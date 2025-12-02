import 'package:breizh_blok_mobile/ui/splash_screen/widgets/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('SplashScreen', () {
    testWidgets('debug banner is not displayed', (tester) async {
      await tester.pumpWidget(const ProviderScope(child: SplashScreen()));
      await tester.pump();

      final materialApp = tester.widget<MaterialApp>(find.byType(MaterialApp));
      expect(materialApp.debugShowCheckedModeBanner, isFalse);
    });

    testWidgets('circular progress indicator is displayed', (tester) async {
      await tester.pumpWidget(const ProviderScope(child: SplashScreen()));
      await tester.pump();

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });
  });
}
