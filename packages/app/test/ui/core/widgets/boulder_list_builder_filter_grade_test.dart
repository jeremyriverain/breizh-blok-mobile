import 'package:breizh_blok_mobile/domain/entities/grade/grade.dart';
import 'package:breizh_blok_mobile/ui/core/widgets/boulder_list_builder_filter_grade.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../widget_test_utils.dart';

void main() {
  const grades = [
    Grade(iri: '/grades/1', name: '5'),
    Grade(iri: '/grades/2', name: '6a'),
    Grade(iri: '/grades/3', name: '6b'),
    Grade(iri: '/grades/4', name: '6c'),
    Grade(iri: '/grades/4', name: '7a'),
  ];
  group('BoulderListFilterGrade', () {
    testWidgets('set values correctly after selecting some grades', (
      tester,
    ) async {
      late Set<Grade> values;
      await tester.myPumpWidget(
        widget: Builder(
          builder: (context) {
            return Scaffold(
              body: BoulderListBuilderFilterGrade(
                allGrades: grades,
                selectedGrades: const <Grade>{},
                onChangeEnd: (selectedGrades) {
                  values = selectedGrades;
                },
              ),
            );
          },
        ),
      );

      await tester.pump();

      final leftTarget = tester
          .getTopLeft(find.byType(RangeSlider))
          .translate(20, 16);
      final rightTarget = tester
          .getTopRight(find.byType(RangeSlider))
          .translate(-20, 16);

      final middleOffset = Offset((leftTarget.dx + rightTarget.dx) / 2, 0);

      await tester.dragFrom(rightTarget, -middleOffset);
      await tester.pumpAndSettle();

      expect(
        values,
        equals({
          const Grade(iri: '/grades/1', name: '5'),
          const Grade(iri: '/grades/2', name: '6a'),
          const Grade(iri: '/grades/3', name: '6b'),
        }),
      );

      await tester.dragFrom(
        rightTarget - middleOffset,
        middleOffset + const Offset(1, 0),
      );

      expect(values, equals(<Grade>{}));
    });
  });
}
