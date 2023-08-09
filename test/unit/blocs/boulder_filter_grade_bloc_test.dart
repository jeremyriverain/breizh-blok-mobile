import 'package:bloc_test/bloc_test.dart';
import 'package:breizh_blok_mobile/blocs/boulder_filter_grade_bloc.dart';
import 'package:breizh_blok_mobile/models/grade.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('BoulderFilterGradeBloc', () {
    blocTest(
      'default state OK',
      build: () => BoulderFilterGradeBloc(BoulderFilterGradeState()),
      verify: (BoulderFilterGradeBloc bloc) {
        expect(bloc.state.grades, <Grade>{});
      },
    );

    const referenceGrade = Grade(
      iri: '1',
      name: '6a',
    );

    blocTest(
      'BoulderFilterGrade event OK',
      build: () => BoulderFilterGradeBloc(BoulderFilterGradeState()),
      act: (BoulderFilterGradeBloc bloc) => bloc.add(BoulderFilterGradeEvent(
        {
          referenceGrade,
        },
      )),
      expect: () => [
        BoulderFilterGradeState(grades: {referenceGrade})
      ],
    );
  });
}
