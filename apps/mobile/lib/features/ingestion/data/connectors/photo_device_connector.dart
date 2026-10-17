import '../../domain/connectors/device_connector.dart';
import '../../domain/entities/device_asset.dart';

import 'package:photo_manager/photo_manager.dart';

class PhotoDeviceConnector implements DeviceConnector {
  @override
  Future<bool> requestPermission() async {
  final permission = await PhotoManager.requestPermissionExtend();
  return permission.isAuth;
}
  
  @override
  
  Future<List<DeviceAsset>> discoverAssets({
     bool includePhotos = true,
  bool includeVideos = true,
  }) async {
   if (!await requestPermission()) {
  return [];
}

    final albums = await PhotoManager.getAssetPathList();
    if (albums.isEmpty) {
      return [];
    }

    final deviceAssets = <String, DeviceAsset>{};
    const pageSize = 100;
    for (final album in albums) {
      var page = 0;
      while (true) {
        final assets = await album.getAssetListPaged(
          page: page,
          size: pageSize,
        );
        if (assets.isEmpty) {
          break;
        }

        for (final asset in assets) {
          if (asset.type == AssetType.image && !includePhotos) continue;
           if (asset.type == AssetType.video && !includeVideos) continue;
          final occurredAt = asset.createDateSecond == null
              ? DateTime.fromMillisecondsSinceEpoch(0)
              : DateTime.fromMillisecondsSinceEpoch(
                  asset.createDateSecond! * 1000,
                );
          final modifiedAt = asset.modifiedDateSecond == null
              ? DateTime.fromMillisecondsSinceEpoch(0)
              : DateTime.fromMillisecondsSinceEpoch(
                  asset.createDateSecond! * 1000,
                );

          final deviceAsset = DeviceAsset(
            externalId: asset.id,
            sourceType:  asset.type == AssetType.video
    ? DeviceAssetType.video
    : DeviceAssetType.photo,
            sourcePath: asset.relativePath ?? "",
            occurredAt: occurredAt,
            modifiedAt: modifiedAt,

            metadata: {
              "width": asset.width,
              "height": asset.height,
              "mimeType": asset.mimeType,
              "duration": asset.duration,
              "isFavorite": asset.isFavorite,
              "latitude": asset.latLng?.latitude,
              "longitude": asset.latLng?.longitude,
            },
          );
          deviceAssets[deviceAsset.externalId] = deviceAsset;
        }

        page++;
      }
    }

    return deviceAssets.values.toList();
  }
}
