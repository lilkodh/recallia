import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../sync_device_assets.dart';
import 'device_asset_repository_provider.dart';
import 'ingestion_api_service_provider.dart';

   final syncDeviceAssetsProvider = Provider<SyncDeviceAssets>((ref){
    final repository = ref.watch(deviceAssetRepositoryProvider);
    final ingestionApiService = ref.watch(ingestionApiServiceProvider);
    return SyncDeviceAssets(repository: repository
    , ingestionApiService: ingestionApiService);
   });
