import 'package:drift/drift.dart';

@TableIndex(name: 'area', columns: {#areaId})
class BoulderGeoPointTable extends Table {
  IntColumn get id => integer()();
  RealColumn get lat => real()();
  RealColumn get lng => real()();
  IntColumn get areaId => integer()();

  @override
  Set<Column> get primaryKey => {id};

  @override
  bool get isStrict => true;
}
