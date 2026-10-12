import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../discover_device_assets.dart';
import 'device_asset_repository_provider.dart';
import 'photo_device_connector_provider.dart';

final discoverDeviceAssetsProvider = Provider<DiscoverDeviceAssets>((ref){
  final connector = ref.watch(photoDeviceConnectorProvider);
  final repository = ref.watch(deviceAssetRepositoryProvider);
    
     return DiscoverDeviceAssets(connector: connector, repository: repository);
});