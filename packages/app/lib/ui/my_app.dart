import 'package:breizh_blok_mobile/service_locator/firebase.dart';
import 'package:breizh_blok_mobile/ui/splash_screen/widgets/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyApp extends StatelessWidget {
  const MyApp({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        final initializeFirebase = ref.watch(initializeFirebaseProvider);

        return initializeFirebase.when(
          data: (_) => child,
          error: (_, _) => child,
          loading: () => const SplashScreen(),
        );
      },
    );
  }
}
