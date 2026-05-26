import 'package:breizh_blok_mobile/service_locator/firebase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyApp extends StatelessWidget {
  const MyApp({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        ref.watch(initializeFirebaseProvider);

        return child;
      },
    );
  }
}
