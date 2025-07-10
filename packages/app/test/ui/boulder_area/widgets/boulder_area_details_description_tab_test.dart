import 'package:breizh_blok_mobile/domain/entities/boulder_area/boulder_area.dart';
import 'package:breizh_blok_mobile/domain/entities/municipality/municipality.dart';
import 'package:breizh_blok_mobile/ui/boulder_area/widgets/boulder_area_details_description_tab.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../widget_test_utils.dart';

void main() {
  group('BoulderAreaDetailsDescriptionTab', () {
    testWidgets('displays number of boulders', (tester) async {
      await tester.myPumpWidget(
        widget: const BoulderAreaDetailsDescriptionTab(
          boulderArea: BoulderArea(
            iri: '/boulder_areas/1',
            name: 'Le chenal',
            numberOfBouldersGroupedByGrade: {'foo': 1, 'bar': 2},
            municipality: Municipality(
              iri: '/municipalities/0',
              name: 'generic',
            ),
          ),
        ),
      );
      await tester.pump();

      expect(find.text('Répartition des 3 blocs'), findsOneWidget);
    });
  });
}
