// ignore_for_file: avoid_print

import 'package:breizh_blok_mobile/domain/models/boulder_area.dart';
import 'package:breizh_blok_mobile/domain/models/municipality.dart';
import 'package:breizh_blok_mobile/ui/boulder_area/widgets/boulder_area_details_description_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('BoulderAreaDetailsDescriptionTab', () {
    testWidgets('displays number of boulders', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          locale: const Locale('fr'),
          home: Material(
            child: BoulderAreaDetailsDescriptionTab(
              boulderArea: BoulderArea(
                iri: '/boulder_areas/1',
                name: 'Le chenal',
                numberOfBouldersGroupedByGrade: const {'foo': 1, 'bar': 2},
                municipality: Municipality(
                  iri: '/municipalities/0',
                  name: 'generic',
                ),
              ),
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(
        find.text('Répartition des 3 blocs'),
        findsOneWidget,
      );
    });
  });
}
