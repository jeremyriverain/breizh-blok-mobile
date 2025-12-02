import 'package:breizh_blok_mobile/service_locator/firebase.dart';
import 'package:breizh_blok_mobile/ui/my_material_app.dart';
import 'package:breizh_blok_mobile/ui/splash_screen/widgets/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        final initializeFirebase = ref.watch(initializeFirebaseProvider);

        final app = SentryWidget(child: const MyMaterialApp());

        return initializeFirebase.when(
          data: (_) => app,
          error: (_, _) => app,
          loading: () => const SplashScreen(),
        );
      },
    );
  }
}
