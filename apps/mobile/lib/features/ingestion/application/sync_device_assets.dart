import '../domain/repositories/device_asset_repository.dart';
import '../data/services/ingestion_api_service.dart';
import 'models/sync_result.dart';

class SyncDeviceAssets {
  final DeviceAssetRepository repository;
  final IngestionApiService ingestionApiService;
  SyncDeviceAssets({
    required this.repository,
    required this.ingestionApiService,
  });

  Future<SyncResult> execute() async {
    final assets = await repository.getAll();
    var successfulCount = 0;
    final failedAssetIds = <String>[];
    for (final asset in assets) {
      try {
        await ingestionApiService.ingest(asset);
        successfulCount++;
      } catch (err) {
         failedAssetIds.add(asset.externalId);
  print('Failed to sync ${asset.externalId}: $err');
      }
    }
    return SyncResult(
      successfulCount: successfulCount,
      failedAssetIds: failedAssetIds,
    );
  }
}
