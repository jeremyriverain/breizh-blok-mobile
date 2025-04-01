import 'package:breizh_blok_mobile/i18n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> myPump(WidgetTester tester, {required Widget widget}) async {
  await tester.pumpWidget(
    MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: const Locale('fr'),
      home: Material(child: widget),
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
