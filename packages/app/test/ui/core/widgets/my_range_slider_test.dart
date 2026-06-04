import 'package:breizh_blok_mobile/domain/entities/grade/grade.dart';
import 'package:breizh_blok_mobile/ui/core/widgets/my_range_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../test_utils.dart';
import '../../../widget_test_utils.dart';

void main() {
  const grades = [
    Grade(iri: '/grades/1', name: '5'),
    Grade(iri: '/grades/2', name: '6a'),
    Grade(iri: '/grades/3', name: '6b'),
    Grade(iri: '/grades/4', name: '6c'),
    Grade(iri: '/grades/4', name: '7a'),
  ];
  group('MyRangeSlider', () {
    testWidgets('set values correctly after selecting some values', (
      tester,
    ) async {
      late Set<RangeEntry<Grade>> values;
      await tester.myPumpWidget(
        widget: Builder(
          builder: (context) {
            return Scaffold(
              body: MyRangeSlider(
                allValues: grades
                    .map(
                      (g) => RangeEntry(name: g.name, value: g),
                    )
                    .toList(),
                selectedValues: const <RangeEntry<Grade>>{},
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
          const RangeEntry(
            name: '5',
            value: Grade(iri: '/grades/1', name: '5'),
          ),
          const RangeEntry(
            name: '6a',
            value: Grade(iri: '/grades/2', name: '6a'),
          ),
          const RangeEntry(
            name: '6b',
            value: Grade(iri: '/grades/3', name: '6b'),
          ),
        }),
      );

      await tester.dragFrom(
        rightTarget - middleOffset,
        middleOffset + const Offset(1, 0),
      );

      expect(values, equals(<RangeEntry<Grade>>{}));
    });

    testWidgets(
      'displays shrinked SizedBox when there is less than two possible values',
      (
        tester,
      ) async {
        await tester.myPumpWidget(
          widget: Builder(
            builder: (context) {
              return Scaffold(
                body: MyRangeSlider(
                  allValues: const [
                    fakeGrade6a,
                  ].map((g) => RangeEntry(name: g.name, value: g)).toList(),
                  selectedValues: const <RangeEntry<Grade>>{},
                  onChangeEnd: (_) {},
                ),
              );
            },
          ),
        );

        await tester.pump();

        expect(find.byType(RangeSlider), findsNothing);
        final sizedBox = tester.widget<SizedBox>(find.byType(SizedBox));

        expect(sizedBox.height, equals(0));
        expect(sizedBox.width, equals(0));
      },
    );

    testWidgets('set default values', (
      tester,
    ) async {
      await tester.myPumpWidget(
        widget: Builder(
          builder: (context) {
            return Scaffold(
              body: MyRangeSlider(
                allValues: grades
                    .map((g) => RangeEntry(name: g.name, value: g))
                    .toList(),
                selectedValues: {
                  RangeEntry(name: grades[1].name, value: grades[1]),
                  RangeEntry(name: grades[2].name, value: grades[2]),
                },
                onChangeEnd: (selectedGrades) {},
              ),
            );
          },
        ),
      );

      await tester.pump();

      expect(
        find.textContaining(grades[0].name, findRichText: true),
        findsNothing,
      );
      expect(
        find.textContaining(grades[1].name, findRichText: true),
        findsOneWidget,
      );
      expect(
        find.textContaining(grades[2].name, findRichText: true),
        findsOneWidget,
      );
    });

    testWidgets('when selected value matches nothing', (
      tester,
    ) async {
      await tester.myPumpWidget(
        widget: Builder(
          builder: (context) {
            return Scaffold(
              body: MyRangeSlider(
                allValues: grades
                    .map((g) => RangeEntry(name: g.name, value: g))
                    .toList(),
                selectedValues: {
                  RangeEntry(name: grades[1].name, value: grades[1]),
                  RangeEntry(
                    name: grades[2].name,
                    value: grades[2].copyWith(iri: 'foo', name: 'bar'),
                  ),
                },
                onChangeEnd: (selectedGrades) {},
              ),
            );
          },
        ),
      );

      await tester.pump();

      expect(
        find.textContaining(grades[0].name, findRichText: true),
        findsOneWidget,
      );
      expect(
        find.textContaining(grades[grades.length - 1].name, findRichText: true),
        findsOneWidget,
      );
    });
  });
}
