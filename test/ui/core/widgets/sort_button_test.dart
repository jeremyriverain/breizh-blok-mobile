import 'package:breizh_blok_mobile/data/data_sources/api/model/api_order_choice.dart';
import 'package:breizh_blok_mobile/data/data_sources/api/model/api_order_param.dart';
import 'package:breizh_blok_mobile/ui/core/widgets/sort_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../widget_test_utils.dart';

void main() {
  final radioListTileType = const RadioListTile<ApiOrderParam>(
    value: ApiOrderParam(name: '', direction: ''),
    groupValue: ApiOrderParam(name: '', direction: ''),
    onChanged: null,
  ).runtimeType;

  List<RadioListTile<ApiOrderParam>> findTiles() {
    return find
        .byType(radioListTileType)
        .evaluate()
        .map<Widget>((Element element) => element.widget)
        .cast<RadioListTile<ApiOrderParam>>()
        .toList();
  }

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

    await myPumpAndSettle(
      tester,
      widget: SortButton(
        choices: choices,
        onChanged: (value) => {result = value},
      ),
    );

    await tester.tap(find.byKey(const Key('sort-button')));
    await tester.pumpAndSettle();

    expect(find.text(defaultLabel), findsOneWidget);
    var generatedRadioListTiles = findTiles();

    expect(generatedRadioListTiles[0].checked, equals(false));
    expect(generatedRadioListTiles[1].checked, equals(false));

    await tester.tap(find.text('label 1'));
    await tester.pumpAndSettle();

    expect(find.text(defaultLabel), findsNothing);

    await tester.tap(find.byKey(const Key('sort-button')));
    await tester.pumpAndSettle();

    generatedRadioListTiles = findTiles();

    expect(generatedRadioListTiles[0].checked, equals(true));
    expect(generatedRadioListTiles[1].checked, equals(false));

    expect(result, equals(choices[0].orderParam));
  });

  testWidgets(
      'the initial selected value is checked, the default label is displayed',
      (WidgetTester tester) async {
    const label = 'Sort by';

    await myPumpAndSettle(
      tester,
      widget: SortButton(
        choices: choices,
        initialSelected: choices[1].orderParam,
        onChanged: (p0) => {},
        label: label,
      ),
    );

    await tester.tap(find.byKey(const Key('sort-button')));
    await tester.pumpAndSettle();

    final generatedRadioListTiles = findTiles();

    expect(generatedRadioListTiles[0].checked, equals(false));
    expect(generatedRadioListTiles[1].checked, equals(true));

    expect(
      find.text(label),
      findsOneWidget,
    );
  });
}
