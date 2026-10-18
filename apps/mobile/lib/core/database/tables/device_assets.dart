import 'package:drift/drift.dart';

class DeviceAssets extends Table {
  TextColumn get externalId => text()();

  TextColumn get sourceType => text()();

  TextColumn get sourcePath => text()();

  DateTimeColumn get occurredAt => dateTime().nullable()();

  DateTimeColumn get modifiedAt => dateTime().nullable()();

  TextColumn get metadataJson => text()();

  TextColumn get processingStatus =>
      text().withDefault(const Constant('pending'))();
      TextColumn get syncStatus =>
    text().withDefault(const Constant('pending'))();

  DateTimeColumn get discoveredAt =>
      dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {externalId};
}
