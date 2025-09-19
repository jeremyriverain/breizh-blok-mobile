import 'package:breizh_blok_mobile/service_locator/locale.dart';
import 'package:breizh_blok_mobile/service_locator/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widget_test_utils.dart';

void main() {
  group('MyLocale', () {
    Widget testWidget() {
      return Scaffold(
        body: Consumer(
          builder: (context, ref, _) {
            return Text('locale: ${ref.watch(myLocaleProvider).languageCode}');
          },
        ),
      );
    }

    testWidgets(
      // ignore: lines_longer_than_80_chars
      'if sharedPreferences are empty and platform locale is FR, then locale is FR',
      (tester) async {
        tester.platformDispatcher.localeTestValue = const Locale('fr');

        SharedPreferences.setMockInitialValues({});
        final prefs = await SharedPreferences.getInstance();

        await tester.myPumpWidget(
          widget: testWidget(),
          overrideLocale: false,
          overrides: [sharedPreferencesProvider.overrideWith((_) => prefs)],
        );

        final container = tester.container();

        expect(container.read(myLocaleProvider), const Locale('fr'));
        expect(prefs.getString(kLocalePrefs), null);
      },
    );

    testWidgets(
      // ignore: lines_longer_than_80_chars
      'if sharedPreferences are empty and platform locale is EN, then locale is EN',
      (tester) async {
        SharedPreferences.setMockInitialValues({});
        final prefs = await SharedPreferences.getInstance();
        tester.platformDispatcher.localeTestValue = const Locale('en');

        await tester.myPumpWidget(
          widget: testWidget(),
          overrides: [sharedPreferencesProvider.overrideWith((_) => prefs)],
          overrideLocale: false,
        );

        await tester.pump();

        final container = tester.container();

        expect(find.text('locale: en'), findsOneWidget);
        expect(container.read(myLocaleProvider), const Locale('en'));
        expect(prefs.getString(kLocalePrefs), null);
      },
    );

    testWidgets(
      // ignore: lines_longer_than_80_chars
      'if sharedPreferences are empty and platform locale is not a supported locale, then locale is FR',
      (tester) async {
        tester.platformDispatcher.localeTestValue = const Locale('FOO');
        SharedPreferences.setMockInitialValues({});

        final prefs = await SharedPreferences.getInstance();

        await tester.myPumpWidget(
          widget: testWidget(),
          overrides: [sharedPreferencesProvider.overrideWith((_) => prefs)],
          overrideLocale: false,
        );

        await tester.pump();

        final container = tester.container();

        expect(find.text('locale: fr'), findsOneWidget);
        expect(container.read(myLocaleProvider), const Locale('fr'));
        expect(prefs.getString(kLocalePrefs), null);
      },
    );

    testWidgets(
      // ignore: lines_longer_than_80_chars
      'if sharedPreferences define locale to EN and platform locale is FR, then locale is EN',
      (tester) async {
        tester.platformDispatcher.localeTestValue = const Locale('fr');
        SharedPreferences.setMockInitialValues({kLocalePrefs: 'en'});

        final prefs = await SharedPreferences.getInstance();

        await tester.myPumpWidget(
          widget: testWidget(),
          overrides: [sharedPreferencesProvider.overrideWith((_) => prefs)],
          overrideLocale: false,
        );

        await tester.pump();

        final container = tester.container();

        expect(prefs.getString(kLocalePrefs), 'en');

        expect(find.text('locale: en'), findsOneWidget);
        expect(container.read(myLocaleProvider), const Locale('en'));
      },
    );

    testWidgets(
      // ignore: lines_longer_than_80_chars
      'if sharedPreferences define locale to an unsupported locale, then locale is FR',
      (tester) async {
        tester.platformDispatcher.localeTestValue = const Locale('fr');
        SharedPreferences.setMockInitialValues({kLocalePrefs: 'foo'});

        final prefs = await SharedPreferences.getInstance();

        await tester.myPumpWidget(
          widget: testWidget(),
          overrides: [sharedPreferencesProvider.overrideWith((_) => prefs)],
          overrideLocale: false,
        );

        await tester.pump();

        final container = tester.container();

        expect(prefs.getString(kLocalePrefs), 'foo');

        expect(find.text('locale: fr'), findsOneWidget);
        expect(container.read(myLocaleProvider), const Locale('fr'));
      },
    );
  });
}
