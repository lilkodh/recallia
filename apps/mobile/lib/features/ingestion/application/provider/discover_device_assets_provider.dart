import 'photo_device_connector_provider.dart';
import '../discover_device_assets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final discoverDeviceAssetsProvider = Provider<DiscoverDeviceAssets>((ref){
  final connector = ref.read(photoDeviceConnectorProvider);
  return DiscoverDeviceAssets(connector);
});