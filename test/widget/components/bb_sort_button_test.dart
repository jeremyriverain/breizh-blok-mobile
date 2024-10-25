import 'package:breizh_blok_mobile/components/bb_sort_button.dart';
import 'package:breizh_blok_mobile/models/order_choice.dart';
import 'package:breizh_blok_mobile/models/order_param.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final radioListTileType = const RadioListTile<OrderParam>(
    value: OrderParam(name: '', direction: ''),
    groupValue: OrderParam(name: '', direction: ''),
    onChanged: null,
  ).runtimeType;

  List<RadioListTile<OrderParam>> findTiles() {
    return find
        .byType(radioListTileType)
        .evaluate()
        .map<Widget>((Element element) => element.widget)
        .cast<RadioListTile<OrderParam>>()
        .toList();
  }

  final choices = [
    OrderChoice(
      label: 'label 1',
      orderParam: const OrderParam(direction: 'bar', name: 'foo'),
    ),
    OrderChoice(
      label: 'label 2',
      orderParam: const OrderParam(direction: 'foo', name: 'bar'),
    ),
  ];

  testWidgets('I can select specific radio tile', (WidgetTester tester) async {
    const defaultLabel = 'Afficher en 1er:';

    OrderParam? result;

    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: const Locale('fr'),
        home: BbSortButton(
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

    expect(result, equals(choices[0].orderParam));
  });

  testWidgets(
      'the initial selected value is checked, the default label is displayed',
      (WidgetTester tester) async {
    const label = 'Sort by';
    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: BbSortButton(
          choices: choices,
          initialSelected: choices[1].orderParam,
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
