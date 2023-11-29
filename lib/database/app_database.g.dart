// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $DbRequestsTable extends DbRequests
    with TableInfo<$DbRequestsTable, DbRequest> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DbRequestsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _requestPathMeta =
      const VerificationMeta('requestPath');
  @override
  late final GeneratedColumn<String> requestPath = GeneratedColumn<String>(
      'request_path', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _responseBodyMeta =
      const VerificationMeta('responseBody');
  @override
  late final GeneratedColumn<String> responseBody = GeneratedColumn<String>(
      'response_body', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [requestPath, responseBody];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'db_requests';
  @override
  VerificationContext validateIntegrity(Insertable<DbRequest> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('request_path')) {
      context.handle(
          _requestPathMeta,
          requestPath.isAcceptableOrUnknown(
              data['request_path']!, _requestPathMeta));
    } else if (isInserting) {
      context.missing(_requestPathMeta);
    }
    if (data.containsKey('response_body')) {
      context.handle(
          _responseBodyMeta,
          responseBody.isAcceptableOrUnknown(
              data['response_body']!, _responseBodyMeta));
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
      requestPath: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}request_path'])!,
      responseBody: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}response_body'])!,
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

  factory DbRequest.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
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
  })  : requestPath = Value(requestPath),
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

  DbRequestsCompanion copyWith(
      {Value<String>? requestPath,
      Value<String>? responseBody,
      Value<int>? rowid}) {
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
      'iri', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _isDownloadedMeta =
      const VerificationMeta('isDownloaded');
  @override
  late final GeneratedColumn<bool> isDownloaded = GeneratedColumn<bool>(
      'is_downloaded', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_downloaded" IN (0, 1))'));
  static const VerificationMeta _bouldersMeta =
      const VerificationMeta('boulders');
  @override
  late final GeneratedColumn<String> boulders = GeneratedColumn<String>(
      'boulders', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES db_requests (request_path)'));
  static const VerificationMeta _downloadedAtMeta =
      const VerificationMeta('downloadedAt');
  @override
  late final GeneratedColumn<DateTime> downloadedAt = GeneratedColumn<DateTime>(
      'downloaded_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns =>
      [iri, isDownloaded, boulders, downloadedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'db_boulder_areas';
  @override
  VerificationContext validateIntegrity(Insertable<DbBoulderArea> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('iri')) {
      context.handle(
          _iriMeta, iri.isAcceptableOrUnknown(data['iri']!, _iriMeta));
    } else if (isInserting) {
      context.missing(_iriMeta);
    }
    if (data.containsKey('is_downloaded')) {
      context.handle(
          _isDownloadedMeta,
          isDownloaded.isAcceptableOrUnknown(
              data['is_downloaded']!, _isDownloadedMeta));
    } else if (isInserting) {
      context.missing(_isDownloadedMeta);
    }
    if (data.containsKey('boulders')) {
      context.handle(_bouldersMeta,
          boulders.isAcceptableOrUnknown(data['boulders']!, _bouldersMeta));
    }
    if (data.containsKey('downloaded_at')) {
      context.handle(
          _downloadedAtMeta,
          downloadedAt.isAcceptableOrUnknown(
              data['downloaded_at']!, _downloadedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {iri};
  @override
  DbBoulderArea map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DbBoulderArea(
      iri: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}iri'])!,
      isDownloaded: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_downloaded'])!,
      boulders: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}boulders']),
      downloadedAt: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}downloaded_at'])!,
    );
  }

  @override
  $DbBoulderAreasTable createAlias(String alias) {
    return $DbBoulderAreasTable(attachedDatabase, alias);
  }
}

class DbBoulderArea extends DataClass implements Insertable<DbBoulderArea> {
  final String iri;
  final bool isDownloaded;
  final String? boulders;
  final DateTime downloadedAt;
  const DbBoulderArea(
      {required this.iri,
      required this.isDownloaded,
      this.boulders,
      required this.downloadedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['iri'] = Variable<String>(iri);
    map['is_downloaded'] = Variable<bool>(isDownloaded);
    if (!nullToAbsent || boulders != null) {
      map['boulders'] = Variable<String>(boulders);
    }
    map['downloaded_at'] = Variable<DateTime>(downloadedAt);
    return map;
  }

  DbBoulderAreasCompanion toCompanion(bool nullToAbsent) {
    return DbBoulderAreasCompanion(
      iri: Value(iri),
      isDownloaded: Value(isDownloaded),
      boulders: boulders == null && nullToAbsent
          ? const Value.absent()
          : Value(boulders),
      downloadedAt: Value(downloadedAt),
    );
  }

  factory DbBoulderArea.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DbBoulderArea(
      iri: serializer.fromJson<String>(json['iri']),
      isDownloaded: serializer.fromJson<bool>(json['isDownloaded']),
      boulders: serializer.fromJson<String?>(json['boulders']),
      downloadedAt: serializer.fromJson<DateTime>(json['downloadedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'iri': serializer.toJson<String>(iri),
      'isDownloaded': serializer.toJson<bool>(isDownloaded),
      'boulders': serializer.toJson<String?>(boulders),
      'downloadedAt': serializer.toJson<DateTime>(downloadedAt),
    };
  }

  DbBoulderArea copyWith(
          {String? iri,
          bool? isDownloaded,
          Value<String?> boulders = const Value.absent(),
          DateTime? downloadedAt}) =>
      DbBoulderArea(
        iri: iri ?? this.iri,
        isDownloaded: isDownloaded ?? this.isDownloaded,
        boulders: boulders.present ? boulders.value : this.boulders,
        downloadedAt: downloadedAt ?? this.downloadedAt,
      );
  @override
  String toString() {
    return (StringBuffer('DbBoulderArea(')
          ..write('iri: $iri, ')
          ..write('isDownloaded: $isDownloaded, ')
          ..write('boulders: $boulders, ')
          ..write('downloadedAt: $downloadedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(iri, isDownloaded, boulders, downloadedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DbBoulderArea &&
          other.iri == this.iri &&
          other.isDownloaded == this.isDownloaded &&
          other.boulders == this.boulders &&
          other.downloadedAt == this.downloadedAt);
}

class DbBoulderAreasCompanion extends UpdateCompanion<DbBoulderArea> {
  final Value<String> iri;
  final Value<bool> isDownloaded;
  final Value<String?> boulders;
  final Value<DateTime> downloadedAt;
  final Value<int> rowid;
  const DbBoulderAreasCompanion({
    this.iri = const Value.absent(),
    this.isDownloaded = const Value.absent(),
    this.boulders = const Value.absent(),
    this.downloadedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DbBoulderAreasCompanion.insert({
    required String iri,
    required bool isDownloaded,
    this.boulders = const Value.absent(),
    this.downloadedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : iri = Value(iri),
        isDownloaded = Value(isDownloaded);
  static Insertable<DbBoulderArea> custom({
    Expression<String>? iri,
    Expression<bool>? isDownloaded,
    Expression<String>? boulders,
    Expression<DateTime>? downloadedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (iri != null) 'iri': iri,
      if (isDownloaded != null) 'is_downloaded': isDownloaded,
      if (boulders != null) 'boulders': boulders,
      if (downloadedAt != null) 'downloaded_at': downloadedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DbBoulderAreasCompanion copyWith(
      {Value<String>? iri,
      Value<bool>? isDownloaded,
      Value<String?>? boulders,
      Value<DateTime>? downloadedAt,
      Value<int>? rowid}) {
    return DbBoulderAreasCompanion(
      iri: iri ?? this.iri,
      isDownloaded: isDownloaded ?? this.isDownloaded,
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
    if (isDownloaded.present) {
      map['is_downloaded'] = Variable<bool>(isDownloaded.value);
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
          ..write('isDownloaded: $isDownloaded, ')
          ..write('boulders: $boulders, ')
          ..write('downloadedAt: $downloadedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  late final $DbRequestsTable dbRequests = $DbRequestsTable(this);
  late final $DbBoulderAreasTable dbBoulderAreas = $DbBoulderAreasTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [dbRequests, dbBoulderAreas];
  @override
  DriftDatabaseOptions get options =>
      const DriftDatabaseOptions(storeDateTimeAsText: true);
}
