import 'dart:async';

import 'package:breizh_blok_mobile/ui/core/widgets/map_error_banner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../widget_test_utils.dart';

void main() {
  group('MapErrorBanner', () {
    testWidgets('display text', (tester) async {
      await tester.myPumpWidget(
        widget: MapErrorBanner(
          onTryAgain: () {},
          onClose: () {},
        ),
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
        widget: MapErrorBanner(
          onTryAgain: completer.complete,
          onClose: () {},
        ),
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

    testWidgets('Given I click on try again button '
        'Then the callback is called', (tester) async {
      final completer = Completer<void>();
      await tester.myPumpWidget(
        widget: MapErrorBanner(
          onClose: completer.complete,
          onTryAgain: () {},
        ),
      );

      await tester.pump();

      await tester.tap(find.byIcon(Icons.close));

      await tester.pump();

      expect(completer.isCompleted, isTrue);
    });
  });
}
