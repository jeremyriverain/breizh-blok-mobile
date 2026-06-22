import 'package:drift/drift.dart';

class DepartmentTable extends Table {
  TextColumn get iri => text()();
  TextColumn get name => text()();

  @override
  Set<Column> get primaryKey => {iri};

  @override
  bool get isStrict => true;
}
