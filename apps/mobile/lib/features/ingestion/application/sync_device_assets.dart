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
        await repository.updateSyncStatus(asset.externalId, 'syncing');

        await ingestionApiService.ingest(asset);

        await repository.updateSyncStatus(asset.externalId, 'synced');

        successfulCount++;
      } catch (err) {
        failedAssetIds.add(asset.externalId);

        try {
          await repository.updateSyncStatus(asset.externalId, 'failed');
        } catch (statusError) {
          print(
            'Failed to update sync status for '
            '${asset.externalId}: $statusError',
          );
        }

        print('Failed to sync ${asset.externalId}: $err');
      }
    }

    return SyncResult(
      successfulCount: successfulCount,
      failedAssetIds: failedAssetIds,
    );
  }
}
