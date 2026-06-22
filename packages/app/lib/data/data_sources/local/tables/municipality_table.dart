import 'package:breizh_blok_mobile/data/data_sources/local/tables/department_table.dart';
import 'package:drift/drift.dart';

class MunicipalityTable extends Table {
  TextColumn get iri => text()();
  TextColumn get name => text()();
  TextColumn get department =>
      text().nullable().references(DepartmentTable, #iri)();

  @override
  Set<Column> get primaryKey => {iri};

  @override
  bool get isStrict => true;
}
