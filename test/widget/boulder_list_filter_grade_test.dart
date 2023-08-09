// ignore_for_file: avoid_print

import 'package:breizh_blok_mobile/blocs/boulder_filter_grade_bloc.dart';
import 'package:breizh_blok_mobile/components/boulder_list_filter_grade.dart';
import 'package:breizh_blok_mobile/models/collection_items.dart';
import 'package:breizh_blok_mobile/models/grade.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

void main() {
  final grades = [
    const Grade(
      iri: '/grades/1',
      name: '5',
    ),
    const Grade(
      iri: '/grades/2',
      name: '6a',
    ),
    const Grade(
      iri: '/grades/3',
      name: '6b',
    ),
    const Grade(
      iri: '/grades/4',
      name: '6c',
    ),
    const Grade(
      iri: '/grades/4',
      name: '7a',
    )
  ];
  final CollectionItems<Grade> gradeCollection =
      CollectionItems(items: grades, totalItems: grades.length);
  group('BoulderListFilterGrade', () {
    testWidgets('set bloc values correctly after selecting some grades',
        (tester) async {
      final boulderFilterGradeBloc =
          BoulderFilterGradeBloc(BoulderFilterGradeState());
      expect(boulderFilterGradeBloc.state.grades.length, 0);

      await tester.pumpWidget(MaterialApp(
        home: BlocProvider(
          create: (context) => boulderFilterGradeBloc,
          child: Builder(builder: (context) {
            return Scaffold(
              body: BoulderListFilterGrade(
                allGrades: gradeCollection,
              ),
            );
          }),
        ),
      ));

      await tester.pumpAndSettle();
      final Offset leftTarget =
          tester.getTopLeft(find.byType(SfRangeSlider)).translate(20, 16);
      final Offset rightTarget =
          tester.getTopRight(find.byType(SfRangeSlider)).translate(-20, 16);

      final middleOffset = Offset((leftTarget.dx + rightTarget.dx) / 2, 0);

      await tester.dragFrom(rightTarget, -middleOffset);
      await tester.pumpAndSettle();

      expect(boulderFilterGradeBloc.state.grades, {
        const Grade(
          iri: '/grades/1',
          name: '5',
        ),
        const Grade(
          iri: '/grades/2',
          name: '6a',
        ),
        const Grade(
          iri: '/grades/3',
          name: '6b',
        ),
      });

      await tester.dragFrom(
          rightTarget - middleOffset, middleOffset + const Offset(1, 0));

      expect(boulderFilterGradeBloc.state.grades, <Grade>{});
    });
  });
}
