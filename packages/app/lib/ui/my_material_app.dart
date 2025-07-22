import 'package:breizh_blok_mobile/i18n/app_localizations.dart';
import 'package:breizh_blok_mobile/ui/core/widgets/widget_config.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyMaterialApp extends StatelessWidget {
  const MyMaterialApp({required this.router, required this.locale, super.key});

  final GoRouter router;

  final Locale locale;

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationProvider: router.routeInformationProvider,
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.pink),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: locale,
      builder:
          (context, child) =>
              WidgetConfig(child: child ?? const SizedBox.shrink()),
    );
  }
}
