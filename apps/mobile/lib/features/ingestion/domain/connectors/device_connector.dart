import '../entities/device_asset.dart';

abstract class DeviceConnector {
Future<List<DeviceAsset>> discoverAssets({
  bool includePhotos = true,
  bool includeVideos = true,
});
  Future<bool> requestPermission();
}
