import '../entities/device_asset.dart';
abstract class DeviceConnector {
  Future<List<DeviceAsset>> discoverAssets();
}