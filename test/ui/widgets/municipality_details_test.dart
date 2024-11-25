// ignore_for_file: avoid_print

import 'package:breizh_blok_mobile/models/boulder_area.dart';
import 'package:breizh_blok_mobile/models/grade.dart';
import 'package:breizh_blok_mobile/models/municipality.dart';
import 'package:breizh_blok_mobile/ui/widgets/municipality_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('MunicipalityDetails', (tester) async {
    final boulderAreas = [
      BoulderArea(
        iri: '/boulder_areas/1',
        name: 'Le chenal',
        municipality: Municipality(
          iri: '/municipalities/0',
          name: 'generic',
        ),
        numberOfBoulders: 4,
        lowestGrade: const Grade(iri: '', name: '5c'),
        highestGrade: const Grade(iri: '', name: '6c'),
      ),
      BoulderArea(
        iri: '/boulder_areas/2',
        name: 'Mars',
        municipality: Municipality(
          iri: '/municipalities/0',
          name: 'generic',
        ),
      ),
    ];
    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: const Locale('fr'),
        home: MunicipalityDetails(
          municipality: Municipality(
            name: 'Kerlouan',
            iri: '/municipalities/1',
            boulderAreas: boulderAreas,
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.widgetWithText(ListTile, 'Le chenal'), findsOneWidget);
    find.widgetWithText(ListTile, '10 blocs du 5c au 6c');
    expect(find.widgetWithText(ListTile, 'Mars'), findsNothing);
  });
}
