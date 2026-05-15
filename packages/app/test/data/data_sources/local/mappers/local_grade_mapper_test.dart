import 'package:breizh_blok_mobile/data/data_sources/local/app_database.dart';
import 'package:breizh_blok_mobile/data/data_sources/local/mappers/local_grade_mapper.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../test_utils.dart';

void main() {
  group('LocalGradeMapper', () {
    test('fromDomain', () {
      expect(
        const LocalGradeMapper().fromDomain(fakeGrade6a),
        equals(GradeTableData(iri: fakeGrade6a.iri, name: fakeGrade6a.name)),
      );
    });

    test('toDomain', () {
      expect(
        const LocalGradeMapper().toDomain(
          GradeTableData(iri: fakeGrade6a.iri, name: fakeGrade6a.name),
        ),
        equals(fakeGrade6a),
      );
    });
  });
}
