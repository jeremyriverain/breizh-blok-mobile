import 'package:breizh_blok_mobile/i18n/app_localizations.dart';
import 'package:breizh_blok_mobile/routing/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';

Future<void> myPump(WidgetTester tester, {required Widget widget}) async {
  final router = createRouter(
    routes: [
      GoRoute(
        path: '/foo',
        builder: (context, state) => Scaffold(body: widget),
      ),
      ...routes,
    ],
    initialLocation: '/foo',
  );

  await tester.pumpWidget(
    MaterialApp.router(
      routeInformationProvider: router.routeInformationProvider,
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: const Locale('fr'),
    ),
  );
}

Future<void> myPumpAndSettle(
  WidgetTester tester, {
  required Widget widget,
}) async {
  await myPump(tester, widget: widget);

  await tester.pumpAndSettle();
}
