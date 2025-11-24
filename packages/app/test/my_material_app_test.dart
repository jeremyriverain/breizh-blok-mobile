import 'package:breizh_blok_mobile/service_locator/service_locator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';

import 'widget_test_utils.dart';

void main() {
  group('banner displaying', () {
    testWidgets('show banner when staging flavor', (tester) async {
      await tester.myPumpWidget(
        widget: const Text('foo'),
        overrides: [
          flavorProvider.overrideWith((_) => 'staging'),
        ],
      );

      await tester.pumpAndSettle();

      expect(find.text('foo'), findsOneWidget);
      expect(find.byType(Banner), findsOneWidget);
      final banner = tester.widget<Banner>(find.byType(Banner));
      expect(banner.message, equals('staging'));
    });

    testWidgets('does not show banner if no flavor', (tester) async {
      await tester.myPumpWidget(
        widget: const Text('foo'),
        overrides: [
          flavorProvider.overrideWith((_) => null),
        ],
      );

      await tester.pumpAndSettle();

      expect(find.text('foo'), findsOneWidget);
      expect(find.byType(Banner), findsNothing);
    });

    testWidgets('does not show banner if flavor other than staging', (
      tester,
    ) async {
      await tester.myPumpWidget(
        widget: const Text('foo'),
        overrides: [
          flavorProvider.overrideWith((_) => 'bar'),
        ],
      );

      await tester.pumpAndSettle();

      expect(find.text('foo'), findsOneWidget);
      expect(find.byType(Banner), findsNothing);
    });
  });
}
