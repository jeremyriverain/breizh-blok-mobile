import 'package:breizh_blok_mobile/domain/entities/height_boulder/height_boulder.dart';
import 'package:breizh_blok_mobile/ui/boulder/widgets/boulder_details_height.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../widget_test_utils.dart';

void main() {
  testWidgets(
    '''
Given HeightBoulder has min equal to 0 and max equal to 3
Then it displays "Moins de 3m"
''',
    (WidgetTester tester) async {
      await tester.myPumpWidget(
        widget: const BoulderDetailsHeight(
          height: HeightBoulder(iri: 'foo', min: 0, max: 3),
        ),
      );
      await tester.pump();

      expect(find.text('Moins de 3m'), findsOneWidget);
    },
  );

  testWidgets(
    '''
Given HeightBoulder has min equal to 3 and max equal to 5
Then it displays "Entre 3 et 5m"
''',
    (WidgetTester tester) async {
      await tester.myPumpWidget(
        widget: const BoulderDetailsHeight(
          height: HeightBoulder(iri: 'foo', min: 3, max: 5),
        ),
      );
      await tester.pump();

      expect(find.text('Entre 3 et 5m'), findsOneWidget);
    },
  );

  testWidgets(
    '''
Given HeightBoulder has min equal to 5 and max is null
Then it displays "Plus de 5m"
''',
    (WidgetTester tester) async {
      await tester.myPumpWidget(
        widget: const BoulderDetailsHeight(
          height: HeightBoulder(iri: 'foo', min: 5),
        ),
      );
      await tester.pump();

      expect(find.text('Plus de 5m'), findsOneWidget);
    },
  );
}
