import 'package:bloc_test/bloc_test.dart';
import 'package:breizh_blok_mobile/domain/entities/grade/grade.dart';
import 'package:breizh_blok_mobile/ui/boulder/view_models/boulder_filter_grade_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('BoulderFilterGradeBloc', () {
    blocTest<BoulderFilterGradeBloc, BoulderFilterGradeState>(
      'default state OK',
      build: () => BoulderFilterGradeBloc(const BoulderFilterGradeState()),
      verify: (BoulderFilterGradeBloc bloc) {
        expect(bloc.state.grades, <Grade>{});
      },
    );

    const referenceGrade = Grade(iri: '1', name: '6a');

    blocTest<BoulderFilterGradeBloc, BoulderFilterGradeState>(
      'BoulderFilterGrade event OK',
      build: () => BoulderFilterGradeBloc(const BoulderFilterGradeState()),
      act:
          (BoulderFilterGradeBloc bloc) =>
              bloc.add(BoulderFilterGradeEvent({referenceGrade})),
      expect:
          () => [
            BoulderFilterGradeState(grades: {referenceGrade}),
          ],
    );
  });
}
