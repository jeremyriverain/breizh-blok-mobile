import 'package:drift/drift.dart';

class Requests extends Table {
  TextColumn get requestPath => text()();
  TextColumn get response => text()();

  @override
  Set<Column> get primaryKey => {requestPath};
}
