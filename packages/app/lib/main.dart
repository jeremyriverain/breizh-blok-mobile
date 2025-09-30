import 'package:breizh_blok_analytics/breizh_blok_analytics.dart';
import 'package:breizh_blok_auth/breizh_blok_auth.dart';
import 'package:breizh_blok_mobile/config/env.dart';
import 'package:breizh_blok_mobile/service_locator/service_locator.dart';
import 'package:breizh_blok_mobile/ui/my_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  SentryWidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  MapboxOptions.setAccessToken(Env.mapboxToken);

  final services = await Future.wait([
    BreizhBlokAuth.createAuth(
      domain: 'breizh-blok.eu.auth0.com',
      clientId: Env.auth0ClientId,
      audience: Env.auth0Audience,
    ),
    SharedPreferences.getInstance(),
    BreizhBlokAnalytics.createAnalytics(token: Env.mixPanelToken),
  ]);

  await SentryFlutter.init(
    (options) {
      options
        ..dsn = Env.sentryDsn
        ..attachScreenshot = true
        ..tracesSampleRate = 0;
    },
    appRunner: () => runApp(
      ProviderScope(
        overrides: [
          authProvider.overrideWith((_) => services[0] as Auth),
          sharedPreferencesProvider.overrideWith(
            (_) => services[1] as SharedPreferences,
          ),
          analyticsProvider.overrideWith((_) => services[2] as Analytics),
        ],
        child: const MyApp(),
      ),
    ),
  );
}
