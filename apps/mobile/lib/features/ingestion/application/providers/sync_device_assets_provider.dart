import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../sync_device_assets.dart';
import 'cloud_sync_preferences_provider.dart';
import 'device_asset_repository_provider.dart';
import 'ingestion_api_service_provider.dart';

final syncDeviceAssetsProvider = Provider<SyncDeviceAssets>((ref) {
  final repository = ref.watch(deviceAssetRepositoryProvider);
  final ingestionApiService = ref.watch(ingestionApiServiceProvider);
  final cloudSyncPreferences = ref.watch(cloudSyncPreferencesProvider);

  return SyncDeviceAssets(
    repository: repository,
    ingestionApiService: ingestionApiService,
    cloudSyncPreferences: cloudSyncPreferences,
  );
});
