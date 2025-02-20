// ignore_for_file: avoid_print

import 'package:breizh_blok_mobile/domain/models/boulder_area.dart';
import 'package:breizh_blok_mobile/domain/models/municipality.dart';
import 'package:breizh_blok_mobile/ui/boulder_area/widgets/boulder_area_details_description_tab.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../widget_test_utils.dart';

void main() {
  group('BoulderAreaDetailsDescriptionTab', () {
    testWidgets('displays number of boulders', (tester) async {
      await myPumpAndSettle(
        tester,
        widget: BoulderAreaDetailsDescriptionTab(
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
      );

      expect(
        find.text('Répartition des 3 blocs'),
        findsOneWidget,
      );
    });
  });
}
