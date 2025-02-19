import 'package:breizh_blok_mobile/domain/models/height_boulder.dart';
import 'package:breizh_blok_mobile/ui/boulder/widgets/boulder_details_height.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Future<void> pumpWidget(
    WidgetTester tester, {
    required HeightBoulder height,
  }) async {
    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: const Locale('fr'),
        home: Material(
          child: BoulderDetailsHeight(
            height: height,
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();
  }

  testWidgets('''
Given HeightBoulder has min equal to 0 and max equal to 3
Then it displays "Moins de 3m"
''', (WidgetTester tester) async {
    await pumpWidget(
      tester,
      height: const HeightBoulder(iri: 'foo', min: 0, max: 3),
    );

    await tester.pumpAndSettle();

    expect(find.text('Moins de 3m'), findsOneWidget);
  });

  testWidgets('''
Given HeightBoulder has min equal to 3 and max equal to 5
Then it displays "Entre 3 et 5m"
''', (WidgetTester tester) async {
    await pumpWidget(
      tester,
      height: const HeightBoulder(iri: 'foo', min: 3, max: 5),
    );

    await tester.pumpAndSettle();

    expect(find.text('Entre 3 et 5m'), findsOneWidget);
  });

  testWidgets('''
Given HeightBoulder has min equal to 5 and max is null
Then it displays "Plus de 5m"
''', (WidgetTester tester) async {
    await pumpWidget(
      tester,
      height: const HeightBoulder(iri: 'foo', min: 5),
    );

    await tester.pumpAndSettle();

    expect(find.text('Plus de 5m'), findsOneWidget);
  });
}
