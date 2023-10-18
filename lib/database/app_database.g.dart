// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $RequestsTable extends Requests with TableInfo<$RequestsTable, Request> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RequestsTable(this.attachedDatabase, [this._alias]);
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
  static const String $name = 'requests';
  @override
  VerificationContext validateIntegrity(Insertable<Request> instance,
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
  Request map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Request(
      requestPath: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}request_path'])!,
      responseBody: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}response_body'])!,
    );
  }

  @override
  $RequestsTable createAlias(String alias) {
    return $RequestsTable(attachedDatabase, alias);
  }
}

class Request extends DataClass implements Insertable<Request> {
  final String requestPath;
  final String responseBody;
  const Request({required this.requestPath, required this.responseBody});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['request_path'] = Variable<String>(requestPath);
    map['response_body'] = Variable<String>(responseBody);
    return map;
  }

  RequestsCompanion toCompanion(bool nullToAbsent) {
    return RequestsCompanion(
      requestPath: Value(requestPath),
      responseBody: Value(responseBody),
    );
  }

  factory Request.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Request(
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

  Request copyWith({String? requestPath, String? responseBody}) => Request(
        requestPath: requestPath ?? this.requestPath,
        responseBody: responseBody ?? this.responseBody,
      );
  @override
  String toString() {
    return (StringBuffer('Request(')
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
      (other is Request &&
          other.requestPath == this.requestPath &&
          other.responseBody == this.responseBody);
}

class RequestsCompanion extends UpdateCompanion<Request> {
  final Value<String> requestPath;
  final Value<String> responseBody;
  final Value<int> rowid;
  const RequestsCompanion({
    this.requestPath = const Value.absent(),
    this.responseBody = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  RequestsCompanion.insert({
    required String requestPath,
    required String responseBody,
    this.rowid = const Value.absent(),
  })  : requestPath = Value(requestPath),
        responseBody = Value(responseBody);
  static Insertable<Request> custom({
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

  RequestsCompanion copyWith(
      {Value<String>? requestPath,
      Value<String>? responseBody,
      Value<int>? rowid}) {
    return RequestsCompanion(
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
    return (StringBuffer('RequestsCompanion(')
          ..write('requestPath: $requestPath, ')
          ..write('responseBody: $responseBody, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  late final $RequestsTable requests = $RequestsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [requests];
}
