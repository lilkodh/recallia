import '../domain/connectors/device_connector.dart';
import '../domain/entities/device_asset.dart';
class DiscoverDeviceAssets {
  final DeviceConnector connector;
  DiscoverDeviceAssets( this.connector);
  Future<List<DeviceAsset>> execute() {
    return connector.discoverAssets();
  }
}