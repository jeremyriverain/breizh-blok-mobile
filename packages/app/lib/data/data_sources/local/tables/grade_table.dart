import 'package:drift/drift.dart';

class GradeTable extends Table {
  TextColumn get iri => text()();
  TextColumn get name => text().unique()();

  @override
  Set<Column> get primaryKey => {iri};

  @override
  bool get isStrict => true;
}
