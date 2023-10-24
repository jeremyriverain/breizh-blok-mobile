import 'package:breizh_blok_mobile/components/sort_button.dart';
import 'package:breizh_blok_mobile/models/order_choice.dart';
import 'package:breizh_blok_mobile/models/order_query_param.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final radioListTileType = const RadioListTile<OrderQueryParam>(
    value: OrderQueryParam(name: '', direction: ''),
    groupValue: OrderQueryParam(name: '', direction: ''),
    onChanged: null,
  ).runtimeType;

  List<RadioListTile<OrderQueryParam>> findTiles() {
    return find
        .byType(radioListTileType)
        .evaluate()
        .map<Widget>((Element element) => element.widget)
        .cast<RadioListTile<OrderQueryParam>>()
        .toList();
  }

  final choices = [
    OrderChoice(
      label: 'label 1',
      orderQueryParam: const OrderQueryParam(direction: 'bar', name: 'foo'),
    ),
    OrderChoice(
      label: 'label 2',
      orderQueryParam: const OrderQueryParam(direction: 'foo', name: 'bar'),
    ),
  ];

  testWidgets('I can select specific radio tile', (WidgetTester tester) async {
    const defaultLabel = 'Afficher en 1er:';

    OrderQueryParam? result;

    await tester.pumpWidget(
      MaterialApp(
        home: SortButton(
          choices: choices,
          onChanged: (value) => {result = value},
        ),
      ),
    );

    await tester.pumpAndSettle();

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

    expect(result, equals(choices[0].orderQueryParam));
  });

  testWidgets(
      'the initial selected value is checked, the default label is displayed',
      (WidgetTester tester) async {
    const label = 'Sort by';
    await tester.pumpWidget(
      MaterialApp(
        home: SortButton(
          choices: choices,
          initialSelected: choices[1].orderQueryParam,
          onChanged: (p0) => {},
          label: label,
        ),
      ),
    );

    await tester.pumpAndSettle();

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
