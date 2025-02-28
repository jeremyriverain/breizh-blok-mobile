// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $DbRequestsTable extends DbRequests
    with TableInfo<$DbRequestsTable, DbRequest> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DbRequestsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _requestPathMeta = const VerificationMeta(
    'requestPath',
  );
  @override
  late final GeneratedColumn<String> requestPath = GeneratedColumn<String>(
    'request_path',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _responseBodyMeta = const VerificationMeta(
    'responseBody',
  );
  @override
  late final GeneratedColumn<String> responseBody = GeneratedColumn<String>(
    'response_body',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [requestPath, responseBody];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'db_requests';
  @override
  VerificationContext validateIntegrity(
    Insertable<DbRequest> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('request_path')) {
      context.handle(
        _requestPathMeta,
        requestPath.isAcceptableOrUnknown(
          data['request_path']!,
          _requestPathMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_requestPathMeta);
    }
    if (data.containsKey('response_body')) {
      context.handle(
        _responseBodyMeta,
        responseBody.isAcceptableOrUnknown(
          data['response_body']!,
          _responseBodyMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_responseBodyMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {requestPath};
  @override
  DbRequest map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DbRequest(
      requestPath:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}request_path'],
          )!,
      responseBody:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}response_body'],
          )!,
    );
  }

  @override
  $DbRequestsTable createAlias(String alias) {
    return $DbRequestsTable(attachedDatabase, alias);
  }
}

class DbRequest extends DataClass implements Insertable<DbRequest> {
  final String requestPath;
  final String responseBody;
  const DbRequest({required this.requestPath, required this.responseBody});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['request_path'] = Variable<String>(requestPath);
    map['response_body'] = Variable<String>(responseBody);
    return map;
  }

  DbRequestsCompanion toCompanion(bool nullToAbsent) {
    return DbRequestsCompanion(
      requestPath: Value(requestPath),
      responseBody: Value(responseBody),
    );
  }

  factory DbRequest.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DbRequest(
      requestPath: serializer.fromJson<String>(json['requestPath']),
      responseBody: serializer.fromJson<String>(json['responseBody']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'requestPath': serializer.toJson<String>(requestPath),
      'responseBody': serializer.toJson<String>(responseBody),
    };
  }

  DbRequest copyWith({String? requestPath, String? responseBody}) => DbRequest(
    requestPath: requestPath ?? this.requestPath,
    responseBody: responseBody ?? this.responseBody,
  );
  DbRequest copyWithCompanion(DbRequestsCompanion data) {
    return DbRequest(
      requestPath:
          data.requestPath.present ? data.requestPath.value : this.requestPath,
      responseBody:
          data.responseBody.present
              ? data.responseBody.value
              : this.responseBody,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DbRequest(')
          ..write('requestPath: $requestPath, ')
          ..write('responseBody: $responseBody')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(requestPath, responseBody);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DbRequest &&
          other.requestPath == this.requestPath &&
          other.responseBody == this.responseBody);
}

class DbRequestsCompanion extends UpdateCompanion<DbRequest> {
  final Value<String> requestPath;
  final Value<String> responseBody;
  final Value<int> rowid;
  const DbRequestsCompanion({
    this.requestPath = const Value.absent(),
    this.responseBody = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DbRequestsCompanion.insert({
    required String requestPath,
    required String responseBody,
    this.rowid = const Value.absent(),
  }) : requestPath = Value(requestPath),
       responseBody = Value(responseBody);
  static Insertable<DbRequest> custom({
    Expression<String>? requestPath,
    Expression<String>? responseBody,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (requestPath != null) 'request_path': requestPath,
      if (responseBody != null) 'response_body': responseBody,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DbRequestsCompanion copyWith({
    Value<String>? requestPath,
    Value<String>? responseBody,
    Value<int>? rowid,
  }) {
    return DbRequestsCompanion(
      requestPath: requestPath ?? this.requestPath,
      responseBody: responseBody ?? this.responseBody,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (requestPath.present) {
      map['request_path'] = Variable<String>(requestPath.value);
    }
    if (responseBody.present) {
      map['response_body'] = Variable<String>(responseBody.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DbRequestsCompanion(')
          ..write('requestPath: $requestPath, ')
          ..write('responseBody: $responseBody, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $DbBoulderAreasTable extends DbBoulderAreas
    with TableInfo<$DbBoulderAreasTable, DbBoulderArea> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DbBoulderAreasTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _iriMeta = const VerificationMeta('iri');
  @override
  late final GeneratedColumn<String> iri = GeneratedColumn<String>(
    'iri',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _downloadProgressMeta = const VerificationMeta(
    'downloadProgress',
  );
  @override
  late final GeneratedColumn<int> downloadProgress = GeneratedColumn<int>(
    'download_progress',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _bouldersMeta = const VerificationMeta(
    'boulders',
  );
  @override
  late final GeneratedColumn<String> boulders = GeneratedColumn<String>(
    'boulders',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES db_requests (request_path)',
    ),
  );
  static const VerificationMeta _downloadedAtMeta = const VerificationMeta(
    'downloadedAt',
  );
  @override
  late final GeneratedColumn<DateTime> downloadedAt = GeneratedColumn<DateTime>(
    'downloaded_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    iri,
    downloadProgress,
    boulders,
    downloadedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'db_boulder_areas';
  @override
  VerificationContext validateIntegrity(
    Insertable<DbBoulderArea> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('iri')) {
      context.handle(
        _iriMeta,
        iri.isAcceptableOrUnknown(data['iri']!, _iriMeta),
      );
    } else if (isInserting) {
      context.missing(_iriMeta);
    }
    if (data.containsKey('download_progress')) {
      context.handle(
        _downloadProgressMeta,
        downloadProgress.isAcceptableOrUnknown(
          data['download_progress']!,
          _downloadProgressMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_downloadProgressMeta);
    }
    if (data.containsKey('boulders')) {
      context.handle(
        _bouldersMeta,
        boulders.isAcceptableOrUnknown(data['boulders']!, _bouldersMeta),
      );
    }
    if (data.containsKey('downloaded_at')) {
      context.handle(
        _downloadedAtMeta,
        downloadedAt.isAcceptableOrUnknown(
          data['downloaded_at']!,
          _downloadedAtMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {iri};
  @override
  DbBoulderArea map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DbBoulderArea(
      iri:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}iri'],
          )!,
      downloadProgress:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}download_progress'],
          )!,
      boulders: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}boulders'],
      ),
      downloadedAt:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}downloaded_at'],
          )!,
    );
  }

  @override
  $DbBoulderAreasTable createAlias(String alias) {
    return $DbBoulderAreasTable(attachedDatabase, alias);
  }
}

class DbBoulderArea extends DataClass implements Insertable<DbBoulderArea> {
  final String iri;
  final int downloadProgress;
  final String? boulders;
  final DateTime downloadedAt;
  const DbBoulderArea({
    required this.iri,
    required this.downloadProgress,
    this.boulders,
    required this.downloadedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['iri'] = Variable<String>(iri);
    map['download_progress'] = Variable<int>(downloadProgress);
    if (!nullToAbsent || boulders != null) {
      map['boulders'] = Variable<String>(boulders);
    }
    map['downloaded_at'] = Variable<DateTime>(downloadedAt);
    return map;
  }

  DbBoulderAreasCompanion toCompanion(bool nullToAbsent) {
    return DbBoulderAreasCompanion(
      iri: Value(iri),
      downloadProgress: Value(downloadProgress),
      boulders:
          boulders == null && nullToAbsent
              ? const Value.absent()
              : Value(boulders),
      downloadedAt: Value(downloadedAt),
    );
  }

  factory DbBoulderArea.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DbBoulderArea(
      iri: serializer.fromJson<String>(json['iri']),
      downloadProgress: serializer.fromJson<int>(json['downloadProgress']),
      boulders: serializer.fromJson<String?>(json['boulders']),
      downloadedAt: serializer.fromJson<DateTime>(json['downloadedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'iri': serializer.toJson<String>(iri),
      'downloadProgress': serializer.toJson<int>(downloadProgress),
      'boulders': serializer.toJson<String?>(boulders),
      'downloadedAt': serializer.toJson<DateTime>(downloadedAt),
    };
  }

  DbBoulderArea copyWith({
    String? iri,
    int? downloadProgress,
    Value<String?> boulders = const Value.absent(),
    DateTime? downloadedAt,
  }) => DbBoulderArea(
    iri: iri ?? this.iri,
    downloadProgress: downloadProgress ?? this.downloadProgress,
    boulders: boulders.present ? boulders.value : this.boulders,
    downloadedAt: downloadedAt ?? this.downloadedAt,
  );
  DbBoulderArea copyWithCompanion(DbBoulderAreasCompanion data) {
    return DbBoulderArea(
      iri: data.iri.present ? data.iri.value : this.iri,
      downloadProgress:
          data.downloadProgress.present
              ? data.downloadProgress.value
              : this.downloadProgress,
      boulders: data.boulders.present ? data.boulders.value : this.boulders,
      downloadedAt:
          data.downloadedAt.present
              ? data.downloadedAt.value
              : this.downloadedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DbBoulderArea(')
          ..write('iri: $iri, ')
          ..write('downloadProgress: $downloadProgress, ')
          ..write('boulders: $boulders, ')
          ..write('downloadedAt: $downloadedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(iri, downloadProgress, boulders, downloadedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DbBoulderArea &&
          other.iri == this.iri &&
          other.downloadProgress == this.downloadProgress &&
          other.boulders == this.boulders &&
          other.downloadedAt == this.downloadedAt);
}

class DbBoulderAreasCompanion extends UpdateCompanion<DbBoulderArea> {
  final Value<String> iri;
  final Value<int> downloadProgress;
  final Value<String?> boulders;
  final Value<DateTime> downloadedAt;
  final Value<int> rowid;
  const DbBoulderAreasCompanion({
    this.iri = const Value.absent(),
    this.downloadProgress = const Value.absent(),
    this.boulders = const Value.absent(),
    this.downloadedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DbBoulderAreasCompanion.insert({
    required String iri,
    required int downloadProgress,
    this.boulders = const Value.absent(),
    this.downloadedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : iri = Value(iri),
       downloadProgress = Value(downloadProgress);
  static Insertable<DbBoulderArea> custom({
    Expression<String>? iri,
    Expression<int>? downloadProgress,
    Expression<String>? boulders,
    Expression<DateTime>? downloadedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (iri != null) 'iri': iri,
      if (downloadProgress != null) 'download_progress': downloadProgress,
      if (boulders != null) 'boulders': boulders,
      if (downloadedAt != null) 'downloaded_at': downloadedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DbBoulderAreasCompanion copyWith({
    Value<String>? iri,
    Value<int>? downloadProgress,
    Value<String?>? boulders,
    Value<DateTime>? downloadedAt,
    Value<int>? rowid,
  }) {
    return DbBoulderAreasCompanion(
      iri: iri ?? this.iri,
      downloadProgress: downloadProgress ?? this.downloadProgress,
      boulders: boulders ?? this.boulders,
      downloadedAt: downloadedAt ?? this.downloadedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (iri.present) {
      map['iri'] = Variable<String>(iri.value);
    }
    if (downloadProgress.present) {
      map['download_progress'] = Variable<int>(downloadProgress.value);
    }
    if (boulders.present) {
      map['boulders'] = Variable<String>(boulders.value);
    }
    if (downloadedAt.present) {
      map['downloaded_at'] = Variable<DateTime>(downloadedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DbBoulderAreasCompanion(')
          ..write('iri: $iri, ')
          ..write('downloadProgress: $downloadProgress, ')
          ..write('boulders: $boulders, ')
          ..write('downloadedAt: $downloadedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $DbRequestsTable dbRequests = $DbRequestsTable(this);
  late final $DbBoulderAreasTable dbBoulderAreas = $DbBoulderAreasTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    dbRequests,
    dbBoulderAreas,
  ];
  @override
  DriftDatabaseOptions get options =>
      const DriftDatabaseOptions(storeDateTimeAsText: true);
}

typedef $$DbRequestsTableCreateCompanionBuilder =
    DbRequestsCompanion Function({
      required String requestPath,
      required String responseBody,
      Value<int> rowid,
    });
typedef $$DbRequestsTableUpdateCompanionBuilder =
    DbRequestsCompanion Function({
      Value<String> requestPath,
      Value<String> responseBody,
      Value<int> rowid,
    });

final class $$DbRequestsTableReferences
    extends BaseReferences<_$AppDatabase, $DbRequestsTable, DbRequest> {
  $$DbRequestsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$DbBoulderAreasTable, List<DbBoulderArea>>
  _dbBoulderAreasRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.dbBoulderAreas,
    aliasName: $_aliasNameGenerator(
      db.dbRequests.requestPath,
      db.dbBoulderAreas.boulders,
    ),
  );

  $$DbBoulderAreasTableProcessedTableManager get dbBoulderAreasRefs {
    final manager = $$DbBoulderAreasTableTableManager(
      $_db,
      $_db.dbBoulderAreas,
    ).filter(
      (f) => f.boulders.requestPath.sqlEquals(
        $_itemColumn<String>('request_path')!,
      ),
    );

    final cache = $_typedResult.readTableOrNull(_dbBoulderAreasRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$DbRequestsTableFilterComposer
    extends Composer<_$AppDatabase, $DbRequestsTable> {
  $$DbRequestsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get requestPath => $composableBuilder(
    column: $table.requestPath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get responseBody => $composableBuilder(
    column: $table.responseBody,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> dbBoulderAreasRefs(
    Expression<bool> Function($$DbBoulderAreasTableFilterComposer f) f,
  ) {
    final $$DbBoulderAreasTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.requestPath,
      referencedTable: $db.dbBoulderAreas,
      getReferencedColumn: (t) => t.boulders,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DbBoulderAreasTableFilterComposer(
            $db: $db,
            $table: $db.dbBoulderAreas,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$DbRequestsTableOrderingComposer
    extends Composer<_$AppDatabase, $DbRequestsTable> {
  $$DbRequestsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get requestPath => $composableBuilder(
    column: $table.requestPath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get responseBody => $composableBuilder(
    column: $table.responseBody,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$DbRequestsTableAnnotationComposer
    extends Composer<_$AppDatabase, $DbRequestsTable> {
  $$DbRequestsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get requestPath => $composableBuilder(
    column: $table.requestPath,
    builder: (column) => column,
  );

  GeneratedColumn<String> get responseBody => $composableBuilder(
    column: $table.responseBody,
    builder: (column) => column,
  );

  Expression<T> dbBoulderAreasRefs<T extends Object>(
    Expression<T> Function($$DbBoulderAreasTableAnnotationComposer a) f,
  ) {
    final $$DbBoulderAreasTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.requestPath,
      referencedTable: $db.dbBoulderAreas,
      getReferencedColumn: (t) => t.boulders,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DbBoulderAreasTableAnnotationComposer(
            $db: $db,
            $table: $db.dbBoulderAreas,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$DbRequestsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DbRequestsTable,
          DbRequest,
          $$DbRequestsTableFilterComposer,
          $$DbRequestsTableOrderingComposer,
          $$DbRequestsTableAnnotationComposer,
          $$DbRequestsTableCreateCompanionBuilder,
          $$DbRequestsTableUpdateCompanionBuilder,
          (DbRequest, $$DbRequestsTableReferences),
          DbRequest,
          PrefetchHooks Function({bool dbBoulderAreasRefs})
        > {
  $$DbRequestsTableTableManager(_$AppDatabase db, $DbRequestsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$DbRequestsTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$DbRequestsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$DbRequestsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> requestPath = const Value.absent(),
                Value<String> responseBody = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DbRequestsCompanion(
                requestPath: requestPath,
                responseBody: responseBody,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String requestPath,
                required String responseBody,
                Value<int> rowid = const Value.absent(),
              }) => DbRequestsCompanion.insert(
                requestPath: requestPath,
                responseBody: responseBody,
                rowid: rowid,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$DbRequestsTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({dbBoulderAreasRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (dbBoulderAreasRefs) db.dbBoulderAreas,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (dbBoulderAreasRefs)
                    await $_getPrefetchedData<
                      DbRequest,
                      $DbRequestsTable,
                      DbBoulderArea
                    >(
                      currentTable: table,
                      referencedTable: $$DbRequestsTableReferences
                          ._dbBoulderAreasRefsTable(db),
                      managerFromTypedResult:
                          (p0) =>
                              $$DbRequestsTableReferences(
                                db,
                                table,
                                p0,
                              ).dbBoulderAreasRefs,
                      referencedItemsForCurrentItem:
                          (item, referencedItems) => referencedItems.where(
                            (e) => e.boulders == item.requestPath,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$DbRequestsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DbRequestsTable,
      DbRequest,
      $$DbRequestsTableFilterComposer,
      $$DbRequestsTableOrderingComposer,
      $$DbRequestsTableAnnotationComposer,
      $$DbRequestsTableCreateCompanionBuilder,
      $$DbRequestsTableUpdateCompanionBuilder,
      (DbRequest, $$DbRequestsTableReferences),
      DbRequest,
      PrefetchHooks Function({bool dbBoulderAreasRefs})
    >;
typedef $$DbBoulderAreasTableCreateCompanionBuilder =
    DbBoulderAreasCompanion Function({
      required String iri,
      required int downloadProgress,
      Value<String?> boulders,
      Value<DateTime> downloadedAt,
      Value<int> rowid,
    });
typedef $$DbBoulderAreasTableUpdateCompanionBuilder =
    DbBoulderAreasCompanion Function({
      Value<String> iri,
      Value<int> downloadProgress,
      Value<String?> boulders,
      Value<DateTime> downloadedAt,
      Value<int> rowid,
    });

final class $$DbBoulderAreasTableReferences
    extends BaseReferences<_$AppDatabase, $DbBoulderAreasTable, DbBoulderArea> {
  $$DbBoulderAreasTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $DbRequestsTable _bouldersTable(_$AppDatabase db) =>
      db.dbRequests.createAlias(
        $_aliasNameGenerator(
          db.dbBoulderAreas.boulders,
          db.dbRequests.requestPath,
        ),
      );

  $$DbRequestsTableProcessedTableManager? get boulders {
    final $_column = $_itemColumn<String>('boulders');
    if ($_column == null) return null;
    final manager = $$DbRequestsTableTableManager(
      $_db,
      $_db.dbRequests,
    ).filter((f) => f.requestPath.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_bouldersTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$DbBoulderAreasTableFilterComposer
    extends Composer<_$AppDatabase, $DbBoulderAreasTable> {
  $$DbBoulderAreasTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get iri => $composableBuilder(
    column: $table.iri,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get downloadProgress => $composableBuilder(
    column: $table.downloadProgress,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get downloadedAt => $composableBuilder(
    column: $table.downloadedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$DbRequestsTableFilterComposer get boulders {
    final $$DbRequestsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.boulders,
      referencedTable: $db.dbRequests,
      getReferencedColumn: (t) => t.requestPath,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DbRequestsTableFilterComposer(
            $db: $db,
            $table: $db.dbRequests,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DbBoulderAreasTableOrderingComposer
    extends Composer<_$AppDatabase, $DbBoulderAreasTable> {
  $$DbBoulderAreasTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get iri => $composableBuilder(
    column: $table.iri,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get downloadProgress => $composableBuilder(
    column: $table.downloadProgress,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get downloadedAt => $composableBuilder(
    column: $table.downloadedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$DbRequestsTableOrderingComposer get boulders {
    final $$DbRequestsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.boulders,
      referencedTable: $db.dbRequests,
      getReferencedColumn: (t) => t.requestPath,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DbRequestsTableOrderingComposer(
            $db: $db,
            $table: $db.dbRequests,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DbBoulderAreasTableAnnotationComposer
    extends Composer<_$AppDatabase, $DbBoulderAreasTable> {
  $$DbBoulderAreasTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get iri =>
      $composableBuilder(column: $table.iri, builder: (column) => column);

  GeneratedColumn<int> get downloadProgress => $composableBuilder(
    column: $table.downloadProgress,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get downloadedAt => $composableBuilder(
    column: $table.downloadedAt,
    builder: (column) => column,
  );

  $$DbRequestsTableAnnotationComposer get boulders {
    final $$DbRequestsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.boulders,
      referencedTable: $db.dbRequests,
      getReferencedColumn: (t) => t.requestPath,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DbRequestsTableAnnotationComposer(
            $db: $db,
            $table: $db.dbRequests,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DbBoulderAreasTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DbBoulderAreasTable,
          DbBoulderArea,
          $$DbBoulderAreasTableFilterComposer,
          $$DbBoulderAreasTableOrderingComposer,
          $$DbBoulderAreasTableAnnotationComposer,
          $$DbBoulderAreasTableCreateCompanionBuilder,
          $$DbBoulderAreasTableUpdateCompanionBuilder,
          (DbBoulderArea, $$DbBoulderAreasTableReferences),
          DbBoulderArea,
          PrefetchHooks Function({bool boulders})
        > {
  $$DbBoulderAreasTableTableManager(
    _$AppDatabase db,
    $DbBoulderAreasTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$DbBoulderAreasTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () =>
                  $$DbBoulderAreasTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$DbBoulderAreasTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> iri = const Value.absent(),
                Value<int> downloadProgress = const Value.absent(),
                Value<String?> boulders = const Value.absent(),
                Value<DateTime> downloadedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DbBoulderAreasCompanion(
                iri: iri,
                downloadProgress: downloadProgress,
                boulders: boulders,
                downloadedAt: downloadedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String iri,
                required int downloadProgress,
                Value<String?> boulders = const Value.absent(),
                Value<DateTime> downloadedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DbBoulderAreasCompanion.insert(
                iri: iri,
                downloadProgress: downloadProgress,
                boulders: boulders,
                downloadedAt: downloadedAt,
                rowid: rowid,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$DbBoulderAreasTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({boulders = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                T extends TableManagerState<
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic
                >
              >(state) {
                if (boulders) {
                  state =
                      state.withJoin(
                            currentTable: table,
                            currentColumn: table.boulders,
                            referencedTable: $$DbBoulderAreasTableReferences
                                ._bouldersTable(db),
                            referencedColumn:
                                $$DbBoulderAreasTableReferences
                                    ._bouldersTable(db)
                                    .requestPath,
                          )
                          as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$DbBoulderAreasTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DbBoulderAreasTable,
      DbBoulderArea,
      $$DbBoulderAreasTableFilterComposer,
      $$DbBoulderAreasTableOrderingComposer,
      $$DbBoulderAreasTableAnnotationComposer,
      $$DbBoulderAreasTableCreateCompanionBuilder,
      $$DbBoulderAreasTableUpdateCompanionBuilder,
      (DbBoulderArea, $$DbBoulderAreasTableReferences),
      DbBoulderArea,
      PrefetchHooks Function({bool boulders})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$DbRequestsTableTableManager get dbRequests =>
      $$DbRequestsTableTableManager(_db, _db.dbRequests);
  $$DbBoulderAreasTableTableManager get dbBoulderAreas =>
      $$DbBoulderAreasTableTableManager(_db, _db.dbBoulderAreas);
}
