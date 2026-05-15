import 'package:breizh_blok_mobile/data/data_sources/local/local_data_source_grade.dart';
import 'package:breizh_blok_mobile/domain/entities/domain_exception/domain_exception.dart';
import 'package:breizh_blok_mobile/domain/entities/grade/grade.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../database_utils.dart';
import '../../../mocks.dart';
import '../../../test_utils.dart';

void main() {
  group('LocalDataSourceGrade', () {
    group('watchAll', () {
      test('empty list by default', () async {
        final database = createMemoryDatabase();
        final dataSource = LocalDataSourceGrade(
          database: database,
        );
        await expectLater(
          dataSource.watchAll(),
          emits(isEmpty),
        );
      });

      test('watch some entities from db', () async {
        final database = createMemoryDatabase();
        final dataSource = LocalDataSourceGrade(
          database: database,
        );
        final grades = <Grade>[
          fakeGrade6a,
          fakeGrade6b,
        ];
        await database.insertFixtures(grades: grades);
        await expectLater(
          dataSource.watchAll(),
          emits(grades),
        );
      });

      test('Given database throws an exception, '
          'When watchAll is called, '
          'Then it throws a $AppDatabaseException', () async {
        final database = MockAppDatabase();
        final dataSource = LocalDataSourceGrade(
          database: database,
        );
        when(
          () => database.select(database.gradeTable),
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
        final dataSource = LocalDataSourceGrade(
          database: database,
        );
        await expectLater(
          dataSource.seed(
            const [
              fakeGrade6a,
              fakeGrade6b,
            ],
          ),
          completes,
        );
        await expectLater(
          dataSource.watchAll(),
          emits(
            const [
              fakeGrade6a,
              fakeGrade6b,
            ],
          ),
        );
      });

      test('seed should fail when names are not unique', () async {
        final database = createMemoryDatabase();
        final dataSource = LocalDataSourceGrade(
          database: database,
        );
        await expectLater(
          dataSource.seed(
            [fakeGrade6a, fakeGrade6b.copyWith(name: fakeGrade6a.name)],
          ),
          throwsA(
            isA<AppDatabaseException>().having(
              (e) => e.message,
              'message',
              startsWith('SqliteException'),
            ),
          ),
        );
      });

      test('seed should success when entity already exists in db', () async {
        final database = createMemoryDatabase();
        final dataSource = LocalDataSourceGrade(
          database: database,
        );
        await database.insertFixtures(
          grades: const [fakeGrade6a],
        );
        await expectLater(
          dataSource.seed(
            const [fakeGrade6a],
          ),
          completes,
        );
      });

      test('Given database has already elements '
          'When addAll is called '
          'Then table is clear '
          'And new elements from addAll replace previous elements', () async {
        final database = createMemoryDatabase();
        final dataSource = LocalDataSourceGrade(
          database: database,
        );
        await database.insertFixtures(
          grades: [fakeGrade6a],
        );
        await expectLater(
          dataSource.seed(
            const [
              fakeGrade6b,
            ],
          ),
          completes,
        );
        await expectLater(
          dataSource.watchAll(),
          emits(
            const [
              fakeGrade6b,
            ],
          ),
        );
      });
    });
  });
}
