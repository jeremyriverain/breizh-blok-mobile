import 'package:breizh_blok_mobile/ui/my_material_app.dart';
import 'package:flutter/material.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SentryWidget(child: const MyMaterialApp());
  }
}
