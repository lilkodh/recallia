import 'dart:convert';

import 'package:drift/drift.dart';

import '../../../../core/database/app_database.dart' hide DeviceAsset;
import '../../domain/entities/device_asset.dart';
import '../../domain/repositories/device_asset_repository.dart';

class DriftDeviceAssetRepository implements DeviceAssetRepository {
  final AppDatabase database;

  DriftDeviceAssetRepository(this.database);

  @override
  Future<void> saveAll(List<DeviceAsset> assets) async {
    await database.batch((batch) {
      for (final asset in assets) {
        final companion = DeviceAssetsCompanion.insert(
          externalId: asset.externalId,
          sourceType: asset.sourceType.name,
          sourcePath: asset.sourcePath,
          occurredAt: Value(asset.occurredAt),
          modifiedAt: Value(asset.modifiedAt),
          metadataJson: jsonEncode(asset.metadata),
        );
        batch.insert(
          database.deviceAssets,
          companion,

          onConflict: DoUpdate(
            (old) => DeviceAssetsCompanion.custom(
              sourceType: Constant(asset.sourceType.name),
              sourcePath: Constant(asset.sourcePath),
              occurredAt: Constant(asset.occurredAt),
              modifiedAt: Constant(asset.modifiedAt),
              metadataJson: Constant(jsonEncode(asset.metadata)),
            ),
          ),
        );
      }
    });
  }

  @override
  Future<List<DeviceAsset>> getAll() async {
    final rows = await database.select(database.deviceAssets).get();

    return rows.map((row) {
      return DeviceAsset(
        externalId: row.externalId,
        sourceType: DeviceAssetType.values.byName(row.sourceType),
        sourcePath: row.sourcePath,
        occurredAt: row.occurredAt ?? DateTime.fromMillisecondsSinceEpoch(0),
        modifiedAt: row.modifiedAt ?? DateTime.fromMillisecondsSinceEpoch(0),
        metadata: jsonDecode(row.metadataJson) as Map<String, dynamic>,
      );
    }).toList();
  }

  @override
  Future<int> count() {
    return database.deviceAssets.count().getSingle();
  }

  Future<void> updateSyncStatus(String externalId, String status) async {
    await (database.update(database.deviceAssets)
          ..where((table) => table.externalId.equals(externalId)))
        .write(DeviceAssetsCompanion(syncStatus: Value(status)));
  }
}
