import '../entities/device_asset.dart';

abstract class DeviceAssetRepository {
  Future<void> saveAll(List<DeviceAsset> assets);
  Future<List<DeviceAsset>> getAll();
  Future<int> count();
}
