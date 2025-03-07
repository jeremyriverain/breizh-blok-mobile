// ignore_for_file: avoid_print

import 'package:breizh_blok_mobile/i18n/app_localizations.dart';
import 'package:breizh_blok_mobile/ui/core/view_models/locale_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  group('LocaleBloc', () {
    Future<LocaleBloc> pumpLocaleBlocPlayground(WidgetTester tester) async {
      WidgetsFlutterBinding.ensureInitialized();
      final localeBloc = await LocaleBloc.create();
      await tester.pumpWidget(
        BlocProvider<LocaleBloc>(
          create: (context) => localeBloc,
          child: Builder(
            builder: (context) {
              return MaterialApp(
                localizationsDelegates: AppLocalizations.localizationsDelegates,
                supportedLocales: AppLocalizations.supportedLocales,
                locale: context.watch<LocaleBloc>().state.locale,
                home: Column(
                  children: [
                    Text(
                      // ignore: lines_longer_than_80_chars
                      'locale: ${context.watch<LocaleBloc>().state.locale.languageCode}',
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      );

      await tester.pumpAndSettle();

      return localeBloc;
    }

    testWidgets(
      // ignore: lines_longer_than_80_chars
      'if sharedPreferences are empty and platform locale is FR, then locale is FR',
      (tester) async {
        tester.platformDispatcher.localeTestValue = const Locale('fr');
        SharedPreferences.setMockInitialValues({});

        final localeBloc = await pumpLocaleBlocPlayground(tester);

        expect(find.text('locale: fr'), findsOneWidget);
        expect(localeBloc.state.locale, const Locale('fr'));
        final prefs = await SharedPreferences.getInstance();
        expect(prefs.getString(kLocalePrefs), null);
      },
    );

    testWidgets(
      // ignore: lines_longer_than_80_chars
      'if sharedPreferences are empty and platform locale is EN, then locale is EN',
      (tester) async {
        SharedPreferences.setMockInitialValues({});
        tester.platformDispatcher.localeTestValue = const Locale('en');

        final localeBloc = await pumpLocaleBlocPlayground(tester);

        expect(find.text('locale: en'), findsOneWidget);
        expect(localeBloc.state.locale, const Locale('en'));
        final prefs = await SharedPreferences.getInstance();
        expect(prefs.getString(kLocalePrefs), null);
      },
    );

    testWidgets(
      // ignore: lines_longer_than_80_chars
      'if sharedPreferences are empty and platform locale is not a supported locale, then locale is FR',
      (tester) async {
        tester.platformDispatcher.localeTestValue = const Locale('FOO');
        SharedPreferences.setMockInitialValues({});

        final localeBloc = await pumpLocaleBlocPlayground(tester);

        expect(find.text('locale: fr'), findsOneWidget);
        expect(localeBloc.state.locale, const Locale('fr'));
        final prefs = await SharedPreferences.getInstance();
        expect(prefs.getString(kLocalePrefs), null);
      },
    );

    testWidgets(
      // ignore: lines_longer_than_80_chars
      'if sharedPreferences define locale to EN and platform locale is FR, then locale is EN',
      (tester) async {
        tester.platformDispatcher.localeTestValue = const Locale('fr');
        SharedPreferences.setMockInitialValues({kLocalePrefs: 'en'});

        final localeBloc = await pumpLocaleBlocPlayground(tester);

        final prefs = await SharedPreferences.getInstance();
        expect(prefs.getString(kLocalePrefs), 'en');

        expect(find.text('locale: en'), findsOneWidget);
        expect(localeBloc.state.locale, const Locale('en'));
      },
    );

    testWidgets(
      // ignore: lines_longer_than_80_chars
      'if sharedPreferences define locale to an unsupported locale, then locale is FR',
      (tester) async {
        tester.platformDispatcher.localeTestValue = const Locale('fr');
        SharedPreferences.setMockInitialValues({kLocalePrefs: 'foo'});

        final localeBloc = await pumpLocaleBlocPlayground(tester);

        final prefs = await SharedPreferences.getInstance();
        expect(prefs.getString(kLocalePrefs), 'foo');

        expect(find.text('locale: fr'), findsOneWidget);
        expect(localeBloc.state.locale, const Locale('fr'));
      },
    );
  });
}
