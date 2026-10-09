import 'package:flutter/cupertino.dart';

import '../../domain/connectors/device_connector.dart';
import '../../domain/entities/device_asset.dart';
import 'package:flutter/foundation.dart';

import 'package:photo_manager/photo_manager.dart';

class PhotoDeviceConnector implements DeviceConnector {
  @override
  Future<List<DeviceAsset>> discoverAssets() async {
    
    final permission = await PhotoManager.requestPermissionExtend();
    if (!permission.isAuth) {
      debugPrint('permesiion is not required : $permission');
      debugPrint('Is autorized:$permission.isAuth');
      return [];
    }
    

    final albums = await PhotoManager.getAssetPathList();
    if (albums.isEmpty){
      print("hhhhhhh");
      return [];
      
    }
    final album = albums.first;
    final deviceAssets = <DeviceAsset>[];
    var page = 0;
    const pageSize = 100 ;
    while(true){
      final assets = await album.getAssetListPaged(page: page, size: pageSize);
      if(assets.isEmpty){
        break;
      }
print("gggggggg");
  
    for (final asset in assets){

    final deviceAsset = DeviceAsset(
      externalId: asset.id,
      sourceType: DeviceAssetType.photo,
      sourcePath: asset.relativePath ?? "",
      occurredAt: DateTime.fromMillisecondsSinceEpoch(
        asset.createDateSecond! * 1000,
      ),
      modifiedAt: DateTime.fromMillisecondsSinceEpoch(
        asset.modifiedDateSecond! * 1000,
      ),
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
    deviceAssets.add(deviceAsset);
   }
   page++;
     }

    return deviceAssets;
     
  }
}