import 'package:breizh_blok_mobile/data/data_sources/local/local_boulder_geo_point_data_source.dart';
import 'package:breizh_blok_mobile/domain/entities/boulder_geo_point/boulder_geo_point.dart';
import 'package:breizh_blok_mobile/domain/entities/domain_exception/domain_exception.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../database_utils.dart';
import '../../../mocks.dart';
import '../../../test_utils.dart';

void main() {
  group('LocalBoulderGeoPointDataSource', () {
    group('watchAll', () {
      test('empty list by default', () async {
        final database = createMemoryDatabase();
        final dataSource = LocalBoulderGeoPointDataSource(
          database: database,
        );
        await expectLater(
          dataSource.watchAll(),
          emits(isEmpty),
        );
      });

      test('watch some entities from db', () async {
        final database = createMemoryDatabase();
        final dataSource = LocalBoulderGeoPointDataSource(
          database: database,
        );
        final boulderGeoPoints = <BoulderGeoPoint>[
          fakeBoulderGeoPoint,
          fakeBoulderGeoPoint2,
        ];
        await database.insertFixtures(boulderGeoPoints: boulderGeoPoints);
        await expectLater(
          dataSource.watchAll(),
          emits(boulderGeoPoints),
        );
      });

      test('Given database throws an exception, '
          'When watchAll is called, '
          'Then it throws a $AppDatabaseException', () async {
        final database = MockAppDatabase();
        final dataSource = LocalBoulderGeoPointDataSource(
          database: database,
        );
        when(
          () => database.select(database.boulderGeoPointTable),
        ).thenThrow(Exception('fake'));
        expect(
          dataSource.watchAll,
          throwsA(
            isA<AppDatabaseException>(),
          ),
        );
      });
    });

    group('seed', () {
      test('seeds entities from db', () async {
        final database = createMemoryDatabase();
        final dataSource = LocalBoulderGeoPointDataSource(
          database: database,
        );
        await expectLater(
          dataSource.seed(
            const [
              fakeBoulderGeoPoint,
              fakeBoulderGeoPoint2,
            ],
          ),
          completes,
        );
        await expectLater(
          dataSource.watchAll(),
          emits(
            const [
              fakeBoulderGeoPoint,
              fakeBoulderGeoPoint2,
            ],
          ),
        );
      });

      test('seed should success when entity already exists in db', () async {
        final database = createMemoryDatabase();
        final dataSource = LocalBoulderGeoPointDataSource(
          database: database,
        );
        await database.insertFixtures(
          boulderGeoPoints: const [fakeBoulderGeoPoint],
        );
        await expectLater(
          dataSource.seed(
            const [fakeBoulderGeoPoint],
          ),
          completes,
        );
      });

      test('Given database has already elements '
          'When addAll is called '
          'Then table is clear '
          'And new elements from addAll replace previous elements', () async {
        final database = createMemoryDatabase();
        final dataSource = LocalBoulderGeoPointDataSource(
          database: database,
        );
        await database.insertFixtures(
          boulderGeoPoints: [fakeBoulderGeoPoint],
        );
        await expectLater(
          dataSource.seed(
            const [
              fakeBoulderGeoPoint2,
            ],
          ),
          completes,
        );
        await expectLater(
          dataSource.watchAll(),
          emits(
            const [
              fakeBoulderGeoPoint2,
            ],
          ),
        );
      });
    });
  });
}
