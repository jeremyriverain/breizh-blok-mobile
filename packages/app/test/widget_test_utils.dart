import 'package:breizh_blok_mobile/routing/router.dart';
import 'package:breizh_blok_mobile/ui/my_material_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';

extension WidgetTesterExtension on WidgetTester {
  Future<void> myPumpWidget({required Widget widget}) async {
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

    await pumpWidget(MyMaterialApp(router: router, locale: const Locale('fr')));
  }
}
