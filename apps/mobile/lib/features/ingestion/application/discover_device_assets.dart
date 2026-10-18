import '../domain/connectors/device_connector.dart';
import '../domain/entities/device_asset.dart';
import '../domain/repositories/device_asset_repository.dart';

class DiscoverDeviceAssets {
  final DeviceConnector connector;
  final DeviceAssetRepository repository;

  DiscoverDeviceAssets({required this.connector, required this.repository});
  Future<List<DeviceAsset>> execute({
    bool includePhotos = true,
    bool includeVideos = true,
  }) async {
    final assets = await connector.discoverAssets(
      includePhotos: includePhotos,
      includeVideos: includePhotos,
    );
    await repository.saveAll(assets);
    return assets;
  }
}
