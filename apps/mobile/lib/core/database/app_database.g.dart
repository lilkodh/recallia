// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $DeviceAssetsTable extends DeviceAssets
    with TableInfo<$DeviceAssetsTable, DeviceAsset> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DeviceAssetsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _externalIdMeta = const VerificationMeta(
    'externalId',
  );
  @override
  late final GeneratedColumn<String> externalId = GeneratedColumn<String>(
    'external_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sourceTypeMeta = const VerificationMeta(
    'sourceType',
  );
  @override
  late final GeneratedColumn<String> sourceType = GeneratedColumn<String>(
    'source_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sourcePathMeta = const VerificationMeta(
    'sourcePath',
  );
  @override
  late final GeneratedColumn<String> sourcePath = GeneratedColumn<String>(
    'source_path',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _occurredAtMeta = const VerificationMeta(
    'occurredAt',
  );
  @override
  late final GeneratedColumn<DateTime> occurredAt = GeneratedColumn<DateTime>(
    'occurred_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _modifiedAtMeta = const VerificationMeta(
    'modifiedAt',
  );
  @override
  late final GeneratedColumn<DateTime> modifiedAt = GeneratedColumn<DateTime>(
    'modified_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _metadataJsonMeta = const VerificationMeta(
    'metadataJson',
  );
  @override
  late final GeneratedColumn<String> metadataJson = GeneratedColumn<String>(
    'metadata_json',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _processingStatusMeta = const VerificationMeta(
    'processingStatus',
  );
  @override
  late final GeneratedColumn<String> processingStatus = GeneratedColumn<String>(
    'processing_status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('pending'),
  );
  static const VerificationMeta _syncStatusMeta = const VerificationMeta(
    'syncStatus',
  );
  @override
  late final GeneratedColumn<String> syncStatus = GeneratedColumn<String>(
    'sync_status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('pending'),
  );
  static const VerificationMeta _discoveredAtMeta = const VerificationMeta(
    'discoveredAt',
  );
  @override
  late final GeneratedColumn<DateTime> discoveredAt = GeneratedColumn<DateTime>(
    'discovered_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    externalId,
    sourceType,
    sourcePath,
    occurredAt,
    modifiedAt,
    metadataJson,
    processingStatus,
    syncStatus,
    discoveredAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'device_assets';
  @override
  VerificationContext validateIntegrity(
    Insertable<DeviceAsset> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('external_id')) {
      context.handle(
        _externalIdMeta,
        externalId.isAcceptableOrUnknown(data['external_id']!, _externalIdMeta),
      );
    } else if (isInserting) {
      context.missing(_externalIdMeta);
    }
    if (data.containsKey('source_type')) {
      context.handle(
        _sourceTypeMeta,
        sourceType.isAcceptableOrUnknown(data['source_type']!, _sourceTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_sourceTypeMeta);
    }
    if (data.containsKey('source_path')) {
      context.handle(
        _sourcePathMeta,
        sourcePath.isAcceptableOrUnknown(data['source_path']!, _sourcePathMeta),
      );
    } else if (isInserting) {
      context.missing(_sourcePathMeta);
    }
    if (data.containsKey('occurred_at')) {
      context.handle(
        _occurredAtMeta,
        occurredAt.isAcceptableOrUnknown(data['occurred_at']!, _occurredAtMeta),
      );
    }
    if (data.containsKey('modified_at')) {
      context.handle(
        _modifiedAtMeta,
        modifiedAt.isAcceptableOrUnknown(data['modified_at']!, _modifiedAtMeta),
      );
    }
    if (data.containsKey('metadata_json')) {
      context.handle(
        _metadataJsonMeta,
        metadataJson.isAcceptableOrUnknown(
          data['metadata_json']!,
          _metadataJsonMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_metadataJsonMeta);
    }
    if (data.containsKey('processing_status')) {
      context.handle(
        _processingStatusMeta,
        processingStatus.isAcceptableOrUnknown(
          data['processing_status']!,
          _processingStatusMeta,
        ),
      );
    }
    if (data.containsKey('sync_status')) {
      context.handle(
        _syncStatusMeta,
        syncStatus.isAcceptableOrUnknown(data['sync_status']!, _syncStatusMeta),
      );
    }
    if (data.containsKey('discovered_at')) {
      context.handle(
        _discoveredAtMeta,
        discoveredAt.isAcceptableOrUnknown(
          data['discovered_at']!,
          _discoveredAtMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {externalId};
  @override
  DeviceAsset map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DeviceAsset(
      externalId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}external_id'],
      )!,
      sourceType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}source_type'],
      )!,
      sourcePath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}source_path'],
      )!,
      occurredAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}occurred_at'],
      ),
      modifiedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}modified_at'],
      ),
      metadataJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}metadata_json'],
      )!,
      processingStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}processing_status'],
      )!,
      syncStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sync_status'],
      )!,
      discoveredAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}discovered_at'],
      )!,
    );
  }

  @override
  $DeviceAssetsTable createAlias(String alias) {
    return $DeviceAssetsTable(attachedDatabase, alias);
  }
}

class DeviceAsset extends DataClass implements Insertable<DeviceAsset> {
  final String externalId;
  final String sourceType;
  final String sourcePath;
  final DateTime? occurredAt;
  final DateTime? modifiedAt;
  final String metadataJson;
  final String processingStatus;
  final String syncStatus;
  final DateTime discoveredAt;
  const DeviceAsset({
    required this.externalId,
    required this.sourceType,
    required this.sourcePath,
    this.occurredAt,
    this.modifiedAt,
    required this.metadataJson,
    required this.processingStatus,
    required this.syncStatus,
    required this.discoveredAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['external_id'] = Variable<String>(externalId);
    map['source_type'] = Variable<String>(sourceType);
    map['source_path'] = Variable<String>(sourcePath);
    if (!nullToAbsent || occurredAt != null) {
      map['occurred_at'] = Variable<DateTime>(occurredAt);
    }
    if (!nullToAbsent || modifiedAt != null) {
      map['modified_at'] = Variable<DateTime>(modifiedAt);
    }
    map['metadata_json'] = Variable<String>(metadataJson);
    map['processing_status'] = Variable<String>(processingStatus);
    map['sync_status'] = Variable<String>(syncStatus);
    map['discovered_at'] = Variable<DateTime>(discoveredAt);
    return map;
  }

  DeviceAssetsCompanion toCompanion(bool nullToAbsent) {
    return DeviceAssetsCompanion(
      externalId: Value(externalId),
      sourceType: Value(sourceType),
      sourcePath: Value(sourcePath),
      occurredAt: occurredAt == null && nullToAbsent
          ? const Value.absent()
          : Value(occurredAt),
      modifiedAt: modifiedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(modifiedAt),
      metadataJson: Value(metadataJson),
      processingStatus: Value(processingStatus),
      syncStatus: Value(syncStatus),
      discoveredAt: Value(discoveredAt),
    );
  }

  factory DeviceAsset.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DeviceAsset(
      externalId: serializer.fromJson<String>(json['externalId']),
      sourceType: serializer.fromJson<String>(json['sourceType']),
      sourcePath: serializer.fromJson<String>(json['sourcePath']),
      occurredAt: serializer.fromJson<DateTime?>(json['occurredAt']),
      modifiedAt: serializer.fromJson<DateTime?>(json['modifiedAt']),
      metadataJson: serializer.fromJson<String>(json['metadataJson']),
      processingStatus: serializer.fromJson<String>(json['processingStatus']),
      syncStatus: serializer.fromJson<String>(json['syncStatus']),
      discoveredAt: serializer.fromJson<DateTime>(json['discoveredAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'externalId': serializer.toJson<String>(externalId),
      'sourceType': serializer.toJson<String>(sourceType),
      'sourcePath': serializer.toJson<String>(sourcePath),
      'occurredAt': serializer.toJson<DateTime?>(occurredAt),
      'modifiedAt': serializer.toJson<DateTime?>(modifiedAt),
      'metadataJson': serializer.toJson<String>(metadataJson),
      'processingStatus': serializer.toJson<String>(processingStatus),
      'syncStatus': serializer.toJson<String>(syncStatus),
      'discoveredAt': serializer.toJson<DateTime>(discoveredAt),
    };
  }

  DeviceAsset copyWith({
    String? externalId,
    String? sourceType,
    String? sourcePath,
    Value<DateTime?> occurredAt = const Value.absent(),
    Value<DateTime?> modifiedAt = const Value.absent(),
    String? metadataJson,
    String? processingStatus,
    String? syncStatus,
    DateTime? discoveredAt,
  }) => DeviceAsset(
    externalId: externalId ?? this.externalId,
    sourceType: sourceType ?? this.sourceType,
    sourcePath: sourcePath ?? this.sourcePath,
    occurredAt: occurredAt.present ? occurredAt.value : this.occurredAt,
    modifiedAt: modifiedAt.present ? modifiedAt.value : this.modifiedAt,
    metadataJson: metadataJson ?? this.metadataJson,
    processingStatus: processingStatus ?? this.processingStatus,
    syncStatus: syncStatus ?? this.syncStatus,
    discoveredAt: discoveredAt ?? this.discoveredAt,
  );
  DeviceAsset copyWithCompanion(DeviceAssetsCompanion data) {
    return DeviceAsset(
      externalId: data.externalId.present
          ? data.externalId.value
          : this.externalId,
      sourceType: data.sourceType.present
          ? data.sourceType.value
          : this.sourceType,
      sourcePath: data.sourcePath.present
          ? data.sourcePath.value
          : this.sourcePath,
      occurredAt: data.occurredAt.present
          ? data.occurredAt.value
          : this.occurredAt,
      modifiedAt: data.modifiedAt.present
          ? data.modifiedAt.value
          : this.modifiedAt,
      metadataJson: data.metadataJson.present
          ? data.metadataJson.value
          : this.metadataJson,
      processingStatus: data.processingStatus.present
          ? data.processingStatus.value
          : this.processingStatus,
      syncStatus: data.syncStatus.present
          ? data.syncStatus.value
          : this.syncStatus,
      discoveredAt: data.discoveredAt.present
          ? data.discoveredAt.value
          : this.discoveredAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DeviceAsset(')
          ..write('externalId: $externalId, ')
          ..write('sourceType: $sourceType, ')
          ..write('sourcePath: $sourcePath, ')
          ..write('occurredAt: $occurredAt, ')
          ..write('modifiedAt: $modifiedAt, ')
          ..write('metadataJson: $metadataJson, ')
          ..write('processingStatus: $processingStatus, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('discoveredAt: $discoveredAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    externalId,
    sourceType,
    sourcePath,
    occurredAt,
    modifiedAt,
    metadataJson,
    processingStatus,
    syncStatus,
    discoveredAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DeviceAsset &&
          other.externalId == this.externalId &&
          other.sourceType == this.sourceType &&
          other.sourcePath == this.sourcePath &&
          other.occurredAt == this.occurredAt &&
          other.modifiedAt == this.modifiedAt &&
          other.metadataJson == this.metadataJson &&
          other.processingStatus == this.processingStatus &&
          other.syncStatus == this.syncStatus &&
          other.discoveredAt == this.discoveredAt);
}

class DeviceAssetsCompanion extends UpdateCompanion<DeviceAsset> {
  final Value<String> externalId;
  final Value<String> sourceType;
  final Value<String> sourcePath;
  final Value<DateTime?> occurredAt;
  final Value<DateTime?> modifiedAt;
  final Value<String> metadataJson;
  final Value<String> processingStatus;
  final Value<String> syncStatus;
  final Value<DateTime> discoveredAt;
  final Value<int> rowid;
  const DeviceAssetsCompanion({
    this.externalId = const Value.absent(),
    this.sourceType = const Value.absent(),
    this.sourcePath = const Value.absent(),
    this.occurredAt = const Value.absent(),
    this.modifiedAt = const Value.absent(),
    this.metadataJson = const Value.absent(),
    this.processingStatus = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.discoveredAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DeviceAssetsCompanion.insert({
    required String externalId,
    required String sourceType,
    required String sourcePath,
    this.occurredAt = const Value.absent(),
    this.modifiedAt = const Value.absent(),
    required String metadataJson,
    this.processingStatus = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.discoveredAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : externalId = Value(externalId),
       sourceType = Value(sourceType),
       sourcePath = Value(sourcePath),
       metadataJson = Value(metadataJson);
  static Insertable<DeviceAsset> custom({
    Expression<String>? externalId,
    Expression<String>? sourceType,
    Expression<String>? sourcePath,
    Expression<DateTime>? occurredAt,
    Expression<DateTime>? modifiedAt,
    Expression<String>? metadataJson,
    Expression<String>? processingStatus,
    Expression<String>? syncStatus,
    Expression<DateTime>? discoveredAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (externalId != null) 'external_id': externalId,
      if (sourceType != null) 'source_type': sourceType,
      if (sourcePath != null) 'source_path': sourcePath,
      if (occurredAt != null) 'occurred_at': occurredAt,
      if (modifiedAt != null) 'modified_at': modifiedAt,
      if (metadataJson != null) 'metadata_json': metadataJson,
      if (processingStatus != null) 'processing_status': processingStatus,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (discoveredAt != null) 'discovered_at': discoveredAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DeviceAssetsCompanion copyWith({
    Value<String>? externalId,
    Value<String>? sourceType,
    Value<String>? sourcePath,
    Value<DateTime?>? occurredAt,
    Value<DateTime?>? modifiedAt,
    Value<String>? metadataJson,
    Value<String>? processingStatus,
    Value<String>? syncStatus,
    Value<DateTime>? discoveredAt,
    Value<int>? rowid,
  }) {
    return DeviceAssetsCompanion(
      externalId: externalId ?? this.externalId,
      sourceType: sourceType ?? this.sourceType,
      sourcePath: sourcePath ?? this.sourcePath,
      occurredAt: occurredAt ?? this.occurredAt,
      modifiedAt: modifiedAt ?? this.modifiedAt,
      metadataJson: metadataJson ?? this.metadataJson,
      processingStatus: processingStatus ?? this.processingStatus,
      syncStatus: syncStatus ?? this.syncStatus,
      discoveredAt: discoveredAt ?? this.discoveredAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (externalId.present) {
      map['external_id'] = Variable<String>(externalId.value);
    }
    if (sourceType.present) {
      map['source_type'] = Variable<String>(sourceType.value);
    }
    if (sourcePath.present) {
      map['source_path'] = Variable<String>(sourcePath.value);
    }
    if (occurredAt.present) {
      map['occurred_at'] = Variable<DateTime>(occurredAt.value);
    }
    if (modifiedAt.present) {
      map['modified_at'] = Variable<DateTime>(modifiedAt.value);
    }
    if (metadataJson.present) {
      map['metadata_json'] = Variable<String>(metadataJson.value);
    }
    if (processingStatus.present) {
      map['processing_status'] = Variable<String>(processingStatus.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(syncStatus.value);
    }
    if (discoveredAt.present) {
      map['discovered_at'] = Variable<DateTime>(discoveredAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DeviceAssetsCompanion(')
          ..write('externalId: $externalId, ')
          ..write('sourceType: $sourceType, ')
          ..write('sourcePath: $sourcePath, ')
          ..write('occurredAt: $occurredAt, ')
          ..write('modifiedAt: $modifiedAt, ')
          ..write('metadataJson: $metadataJson, ')
          ..write('processingStatus: $processingStatus, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('discoveredAt: $discoveredAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $DeviceAssetsTable deviceAssets = $DeviceAssetsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [deviceAssets];
}

typedef $$DeviceAssetsTableCreateCompanionBuilder =
    DeviceAssetsCompanion Function({
      required String externalId,
      required String sourceType,
      required String sourcePath,
      Value<DateTime?> occurredAt,
      Value<DateTime?> modifiedAt,
      required String metadataJson,
      Value<String> processingStatus,
      Value<String> syncStatus,
      Value<DateTime> discoveredAt,
      Value<int> rowid,
    });
typedef $$DeviceAssetsTableUpdateCompanionBuilder =
    DeviceAssetsCompanion Function({
      Value<String> externalId,
      Value<String> sourceType,
      Value<String> sourcePath,
      Value<DateTime?> occurredAt,
      Value<DateTime?> modifiedAt,
      Value<String> metadataJson,
      Value<String> processingStatus,
      Value<String> syncStatus,
      Value<DateTime> discoveredAt,
      Value<int> rowid,
    });

class $$DeviceAssetsTableFilterComposer
    extends Composer<_$AppDatabase, $DeviceAssetsTable> {
  $$DeviceAssetsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get externalId => $composableBuilder(
    column: $table.externalId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sourceType => $composableBuilder(
    column: $table.sourceType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sourcePath => $composableBuilder(
    column: $table.sourcePath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get occurredAt => $composableBuilder(
    column: $table.occurredAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get modifiedAt => $composableBuilder(
    column: $table.modifiedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get metadataJson => $composableBuilder(
    column: $table.metadataJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get processingStatus => $composableBuilder(
    column: $table.processingStatus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get discoveredAt => $composableBuilder(
    column: $table.discoveredAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$DeviceAssetsTableOrderingComposer
    extends Composer<_$AppDatabase, $DeviceAssetsTable> {
  $$DeviceAssetsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get externalId => $composableBuilder(
    column: $table.externalId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sourceType => $composableBuilder(
    column: $table.sourceType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sourcePath => $composableBuilder(
    column: $table.sourcePath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get occurredAt => $composableBuilder(
    column: $table.occurredAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get modifiedAt => $composableBuilder(
    column: $table.modifiedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get metadataJson => $composableBuilder(
    column: $table.metadataJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get processingStatus => $composableBuilder(
    column: $table.processingStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get discoveredAt => $composableBuilder(
    column: $table.discoveredAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$DeviceAssetsTableAnnotationComposer
    extends Composer<_$AppDatabase, $DeviceAssetsTable> {
  $$DeviceAssetsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get externalId => $composableBuilder(
    column: $table.externalId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get sourceType => $composableBuilder(
    column: $table.sourceType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get sourcePath => $composableBuilder(
    column: $table.sourcePath,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get occurredAt => $composableBuilder(
    column: $table.occurredAt,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get modifiedAt => $composableBuilder(
    column: $table.modifiedAt,
    builder: (column) => column,
  );

  GeneratedColumn<String> get metadataJson => $composableBuilder(
    column: $table.metadataJson,
    builder: (column) => column,
  );

  GeneratedColumn<String> get processingStatus => $composableBuilder(
    column: $table.processingStatus,
    builder: (column) => column,
  );

  GeneratedColumn<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get discoveredAt => $composableBuilder(
    column: $table.discoveredAt,
    builder: (column) => column,
  );
}

class $$DeviceAssetsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DeviceAssetsTable,
          DeviceAsset,
          $$DeviceAssetsTableFilterComposer,
          $$DeviceAssetsTableOrderingComposer,
          $$DeviceAssetsTableAnnotationComposer,
          $$DeviceAssetsTableCreateCompanionBuilder,
          $$DeviceAssetsTableUpdateCompanionBuilder,
          (
            DeviceAsset,
            BaseReferences<_$AppDatabase, $DeviceAssetsTable, DeviceAsset>,
          ),
          DeviceAsset,
          PrefetchHooks Function()
        > {
  $$DeviceAssetsTableTableManager(_$AppDatabase db, $DeviceAssetsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DeviceAssetsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DeviceAssetsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DeviceAssetsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> externalId = const Value.absent(),
                Value<String> sourceType = const Value.absent(),
                Value<String> sourcePath = const Value.absent(),
                Value<DateTime?> occurredAt = const Value.absent(),
                Value<DateTime?> modifiedAt = const Value.absent(),
                Value<String> metadataJson = const Value.absent(),
                Value<String> processingStatus = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<DateTime> discoveredAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DeviceAssetsCompanion(
                externalId: externalId,
                sourceType: sourceType,
                sourcePath: sourcePath,
                occurredAt: occurredAt,
                modifiedAt: modifiedAt,
                metadataJson: metadataJson,
                processingStatus: processingStatus,
                syncStatus: syncStatus,
                discoveredAt: discoveredAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String externalId,
                required String sourceType,
                required String sourcePath,
                Value<DateTime?> occurredAt = const Value.absent(),
                Value<DateTime?> modifiedAt = const Value.absent(),
                required String metadataJson,
                Value<String> processingStatus = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<DateTime> discoveredAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DeviceAssetsCompanion.insert(
                externalId: externalId,
                sourceType: sourceType,
                sourcePath: sourcePath,
                occurredAt: occurredAt,
                modifiedAt: modifiedAt,
                metadataJson: metadataJson,
                processingStatus: processingStatus,
                syncStatus: syncStatus,
                discoveredAt: discoveredAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$DeviceAssetsTable, DeviceAsset>(table),
                  BaseReferences<
                    _$AppDatabase,
                    $DeviceAssetsTable,
                    DeviceAsset
                  >(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$DeviceAssetsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DeviceAssetsTable,
      DeviceAsset,
      $$DeviceAssetsTableFilterComposer,
      $$DeviceAssetsTableOrderingComposer,
      $$DeviceAssetsTableAnnotationComposer,
      $$DeviceAssetsTableCreateCompanionBuilder,
      $$DeviceAssetsTableUpdateCompanionBuilder,
      (
        DeviceAsset,
        BaseReferences<_$AppDatabase, $DeviceAssetsTable, DeviceAsset>,
      ),
      DeviceAsset,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$DeviceAssetsTableTableManager get deviceAssets =>
      $$DeviceAssetsTableTableManager(_db, _db.deviceAssets);
}
