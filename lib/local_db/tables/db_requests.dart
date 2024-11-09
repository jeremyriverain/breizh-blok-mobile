import 'package:drift/drift.dart';

class DbRequests extends Table {
  TextColumn get requestPath => text()();
  TextColumn get responseBody => text()();

  @override
  Set<Column> get primaryKey => {requestPath};
}
