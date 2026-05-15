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
          'Then it throws a $DomainException', () async {
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
            isA<UnknownException>().having(
              (e) => e.message,
              'message',
              equals('Exception: fake'),
            ),
          ),
        );
      });
    });
  });
}
