import 'package:breizh_blok_mobile/service_locator/firebase.dart';
import 'package:breizh_blok_mobile/ui/my_app.dart';
import 'package:breizh_blok_mobile/ui/splash_screen/widgets/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('MyApp', () {
    testWidgets(
      '''
Given the initialization of firebase throws an error
Then it shows the child widget properly''',
      (tester) async {
        await tester.pumpWidget(
          const ProviderScope(
            child: MyApp(child: Placeholder()),
          ),
        );

        expect(find.byType(SplashScreen), findsOneWidget);

        await tester.pump();

        expect(find.byType(Placeholder), findsOneWidget);
        expect(find.byType(SplashScreen), findsNothing);
      },
    );

    testWidgets(
      '''
Given the initialization of firebase succeeds
Then it shows the child widget properly''',
      (tester) async {
        await tester.pumpWidget(
          ProviderScope(
            overrides: [
              initializeFirebaseProvider.overrideWith((_) {
                return null;
              }),
            ],
            child: const MyApp(child: Placeholder()),
          ),
        );

        await tester.pump();

        expect(find.byType(Placeholder), findsOneWidget);
      },
    );

    testWidgets(
      '''
Given the initialization of firebase is not finished
Then it displays SplashScreen''',
      (tester) async {
        await tester.pumpWidget(
          ProviderScope(
            overrides: [
              initializeFirebaseProvider.overrideWith((_) async {
                await Future<void>.delayed(const Duration(seconds: 1));
                return null;
              }),
            ],
            child: const MyApp(child: Placeholder()),
          ),
        );

        await tester.pump();

        expect(find.byType(SplashScreen), findsOneWidget);

        await tester.pump(const Duration(seconds: 1));

        expect(find.byType(Placeholder), findsOneWidget);
      },
    );
  });
}
