import 'package:breizh_blok_mobile/data/data_sources/local/app_database.dart';
import 'package:breizh_blok_mobile/data/data_sources/local/mappers/local_boulder_geo_point_mapper.dart';
import 'package:breizh_blok_mobile/data/data_sources/local/mappers/local_grade_mapper.dart';
import 'package:breizh_blok_mobile/domain/entities/boulder_geo_point/boulder_geo_point.dart';
import 'package:breizh_blok_mobile/domain/entities/grade/grade.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';

AppDatabase createMemoryDatabase() {
  final database = AppDatabase(
    DatabaseConnection(
      NativeDatabase.memory(),
      closeStreamsSynchronously: true,
    ),
  );

  addTearDown(database.close);

  return database;
}

typedef Mappers = ({
  LocalGradeMapper grade,
  LocalBoulderGeoPointMapper boulderGeoPoint,
});

extension AppDatabaseExt on AppDatabase {
  Future<void> insertFixtures({
    Mappers mappers = const (
      boulderGeoPoint: LocalBoulderGeoPointMapper(),
      grade: LocalGradeMapper(),
    ),
    Iterable<Grade> grades = const [],
    Iterable<BoulderGeoPoint> boulderGeoPoints = const [],
  }) async {
    final allGrades = {...grades};
    final allBoulderGeoPoints = {...boulderGeoPoints};

    await setForeignKeysMode(isActive: false);
    await transaction(() async {
      await _insertFixturesFor<Grade, GradeTableData>(
        table: gradeTable,
        fixtures: allGrades,
        mapToCompanion: (e) {
          return mappers.grade.fromDomain(e).toCompanion(true);
        },
      );

      await _insertFixturesFor<BoulderGeoPoint, BoulderGeoPointTableData>(
        table: boulderGeoPointTable,
        fixtures: allBoulderGeoPoints,
        mapToCompanion: (e) {
          return mappers.boulderGeoPoint.fromDomain(e).toCompanion(true);
        },
      );
    });
    await setForeignKeysMode(isActive: true);
  }

  /// [E] for entity
  /// [R] for row of table
  Future<void> _insertFixturesFor<E, R>({
    required TableInfo<Table, R> table,
    required Iterable<E> fixtures,
    required Insertable<R> Function(E) mapToCompanion,
  }) async {
    await delete(table).go();
    await batch(
      (batch) {
        batch.insertAll(
          table,
          <Insertable<R>>[
            for (final fixture in fixtures) mapToCompanion(fixture),
          ],
        );
      },
    );
  }
}
