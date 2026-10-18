import 'dart:async';

import 'package:dio/dio.dart';

import '../domain/repositories/device_asset_repository.dart';
import '../data/services/ingestion_api_service.dart';
import 'models/sync_result.dart';

class SyncDeviceAssets {
  final DeviceAssetRepository repository;
  final IngestionApiService ingestionApiService;

  static const int _maxAttempts = 3;
  static const Duration _initialRetryDelay = Duration(seconds: 1);

  SyncDeviceAssets({
    required this.repository,
    required this.ingestionApiService,
  });

  Future<SyncResult> execute() async {
    final assets = await repository.getAll();

    var successfulCount = 0;
    final failedAssetIds = <String>[];

    for (final asset in assets) {
      var synced = false;

      for (var attempt = 1; attempt <= _maxAttempts; attempt++) {
        try {
          await repository.updateSyncStatus(asset.externalId, 'syncing');

          await ingestionApiService.ingest(asset);

          await repository.updateSyncStatus(asset.externalId, 'synced');

          successfulCount++;
          synced = true;
          break;
        } catch (error) {
          final shouldRetry = error is DioException && _isRetryable(error);

          if (!shouldRetry || attempt == _maxAttempts) {
            print(
              'Sync failed for ${asset.externalId} '
              'after $attempt attempt(s): $error',
            );
            break;
          }

          final delaySeconds =
              _initialRetryDelay.inSeconds * (1 << (attempt - 1));

          print(
            'Retrying ${asset.externalId} '
            'in $delaySeconds second(s), '
            'attempt ${attempt + 1}/$_maxAttempts.',
          );

          await Future<void>.delayed(Duration(seconds: delaySeconds));
        }
      }

      if (!synced) {
        failedAssetIds.add(asset.externalId);

        try {
          await repository.updateSyncStatus(asset.externalId, 'failed');
        } catch (error) {
          print(
            'Could not persist failed status for '
            '${asset.externalId}: $error',
          );
        }
      }
    }

    return SyncResult(
      successfulCount: successfulCount,
      failedAssetIds: failedAssetIds,
    );
  }

  bool _isRetryable(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.connectionError:
      case DioExceptionType.unknown:
        return true;

      case DioExceptionType.badResponse:
        final statusCode = error.response?.statusCode;
        return statusCode != null && statusCode >= 500;

      default:
        return false;
    }
  }
}
