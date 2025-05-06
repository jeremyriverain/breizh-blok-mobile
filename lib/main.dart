import 'package:breizh_blok_mobile/config/env.dart';
import 'package:breizh_blok_mobile/setup_app.dart';
import 'package:breizh_blok_mobile/ui/my_app.dart';
import 'package:flutter/material.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

Future<void> main() async {
  await setupApp();

  await SentryFlutter.init((options) {
    options
      ..dsn = options.dsn = Env.sentryDsn
      ..attachScreenshot = true
      ..tracesSampleRate = 0;

    // ignore: require_trailing_commas
  }, appRunner: () => runApp(const MyApp()));
}
