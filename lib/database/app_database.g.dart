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
  static const VerificationMeta _responseMeta =
      const VerificationMeta('response');
  @override
  late final GeneratedColumn<String> response = GeneratedColumn<String>(
      'response', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [requestPath, response];
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
    if (data.containsKey('response')) {
      context.handle(_responseMeta,
          response.isAcceptableOrUnknown(data['response']!, _responseMeta));
    } else if (isInserting) {
      context.missing(_responseMeta);
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
      response: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}response'])!,
    );
  }

  @override
  $RequestsTable createAlias(String alias) {
    return $RequestsTable(attachedDatabase, alias);
  }
}

class Request extends DataClass implements Insertable<Request> {
  final String requestPath;
  final String response;
  const Request({required this.requestPath, required this.response});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['request_path'] = Variable<String>(requestPath);
    map['response'] = Variable<String>(response);
    return map;
  }

  RequestsCompanion toCompanion(bool nullToAbsent) {
    return RequestsCompanion(
      requestPath: Value(requestPath),
      response: Value(response),
    );
  }

  factory Request.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Request(
      requestPath: serializer.fromJson<String>(json['requestPath']),
      response: serializer.fromJson<String>(json['response']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'requestPath': serializer.toJson<String>(requestPath),
      'response': serializer.toJson<String>(response),
    };
  }

  Request copyWith({String? requestPath, String? response}) => Request(
        requestPath: requestPath ?? this.requestPath,
        response: response ?? this.response,
      );
  @override
  String toString() {
    return (StringBuffer('Request(')
          ..write('requestPath: $requestPath, ')
          ..write('response: $response')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(requestPath, response);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Request &&
          other.requestPath == this.requestPath &&
          other.response == this.response);
}

class RequestsCompanion extends UpdateCompanion<Request> {
  final Value<String> requestPath;
  final Value<String> response;
  final Value<int> rowid;
  const RequestsCompanion({
    this.requestPath = const Value.absent(),
    this.response = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  RequestsCompanion.insert({
    required String requestPath,
    required String response,
    this.rowid = const Value.absent(),
  })  : requestPath = Value(requestPath),
        response = Value(response);
  static Insertable<Request> custom({
    Expression<String>? requestPath,
    Expression<String>? response,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (requestPath != null) 'request_path': requestPath,
      if (response != null) 'response': response,
      if (rowid != null) 'rowid': rowid,
    });
  }

  RequestsCompanion copyWith(
      {Value<String>? requestPath,
      Value<String>? response,
      Value<int>? rowid}) {
    return RequestsCompanion(
      requestPath: requestPath ?? this.requestPath,
      response: response ?? this.response,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (requestPath.present) {
      map['request_path'] = Variable<String>(requestPath.value);
    }
    if (response.present) {
      map['response'] = Variable<String>(response.value);
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
          ..write('response: $response, ')
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
