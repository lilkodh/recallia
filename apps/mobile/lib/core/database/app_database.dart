import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

import 'tables/device_assets.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [DeviceAssets])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

 @override
int get schemaVersion => 2;

@override
MigrationStrategy get migration => MigrationStrategy(
  onUpgrade: (migrator, from, to) async {
    if (from < 2) {
      await customStatement(
        "ALTER TABLE device_assets "
        "ADD COLUMN sync_status TEXT NOT NULL DEFAULT 'pending'",
      );
    }
  },
);
}

QueryExecutor _openConnection() {
  return driftDatabase(name: "recallia");
}
