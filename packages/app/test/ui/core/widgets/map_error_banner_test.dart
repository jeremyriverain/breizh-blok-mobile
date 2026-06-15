import 'dart:async';

import 'package:breizh_blok_mobile/ui/core/widgets/map_error_banner.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../widget_test_utils.dart';

void main() {
  group('MapErrorBanner', () {
    testWidgets('display text', (tester) async {
      await tester.myPumpWidget(
        widget: MapErrorBanner(onTryAgain: () {}),
      );

      await tester.pump();

      expect(
        find.text("Une erreur est survenue pendant l'affichage de la carte"),
        findsOneWidget,
      );
    });

    testWidgets('Given I click on try again button '
        'Then the callback is called', (tester) async {
      final completer = Completer<void>();
      await tester.myPumpWidget(
        widget: MapErrorBanner(onTryAgain: completer.complete),
      );

      await tester.pump();

      await tester.tap(find.text('Essayer à nouveau'));

      await tester.pump();

      expect(
        find.text("Une erreur est survenue pendant l'affichage de la carte"),
        findsOneWidget,
      );

      expect(completer.isCompleted, isTrue);
    });
  });
}
