import 'package:breizh_blok_mobile/data/data_sources/api/model/api_order_choice.dart';
import 'package:breizh_blok_mobile/data/data_sources/api/model/api_order_param.dart';
import 'package:breizh_blok_mobile/ui/core/widgets/sort_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../widget_test_utils.dart';

void main() {
  final choices = [
    ApiOrderChoice(
      label: 'label 1',
      orderParam: const ApiOrderParam(direction: 'bar', name: 'foo'),
    ),
    ApiOrderChoice(
      label: 'label 2',
      orderParam: const ApiOrderParam(direction: 'foo', name: 'bar'),
    ),
  ];

  testWidgets('I can select specific radio tile', (WidgetTester tester) async {
    const defaultLabel = 'Afficher en 1er:';

    ApiOrderParam? result;

    await tester.myPumpWidget(
      widget: SortButton(
        choices: choices,
        onChanged: (value) => {result = value},
      ),
    );
    await tester.pump();

    await tester.tap(find.byKey(const Key('sort-button')));
    await tester.pumpAndSettle();

    expect(find.text(defaultLabel), findsOneWidget);

    expect(
      tester
          .widget<RadioGroup<ApiOrderParam>>(
            find.byType(RadioGroup<ApiOrderParam>),
          )
          .groupValue,
      isNull,
    );

    await tester.tap(find.text('label 1'));
    await tester.pumpAndSettle();

    expect(find.text(defaultLabel), findsNothing);

    await tester.tap(find.byKey(const Key('sort-button')));
    await tester.pumpAndSettle();

    expect(
      tester
          .widget<RadioGroup<ApiOrderParam>>(
            find.byType(RadioGroup<ApiOrderParam>),
          )
          .groupValue,
      equals(const ApiOrderParam(direction: 'bar', name: 'foo')),
    );

    expect(result, equals(choices[0].orderParam));
  });

  testWidgets(
    'the initial selected value is checked, the default label is displayed',
    (WidgetTester tester) async {
      const label = 'Sort by';

      await tester.myPumpWidget(
        widget: SortButton(
          choices: choices,
          initialSelected: choices[1].orderParam,
          onChanged: (p0) => {},
          label: label,
        ),
      );
      await tester.pump();

      await tester.tap(find.byKey(const Key('sort-button')));
      await tester.pumpAndSettle();

      expect(
        tester
            .widget<RadioGroup<ApiOrderParam>>(
              find.byType(RadioGroup<ApiOrderParam>),
            )
            .groupValue,
        equals(const ApiOrderParam(direction: 'foo', name: 'bar')),
      );

      expect(find.text(label), findsOneWidget);
    },
  );
}
