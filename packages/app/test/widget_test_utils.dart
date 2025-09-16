import 'package:breizh_blok_mobile/routing/router.dart';
import 'package:breizh_blok_mobile/ui/my_material_app.dart';
import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

extension WidgetTesterExtension on WidgetTester {
  Future<({GoRouter router})> myPumpWidget({
    required Widget widget,
    List<Override> overrides = const [],
  }) async {
    GetIt.I.allowReassignment = true;
    driftRuntimeOptions.dontWarnAboutMultipleDatabases = true;

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

    await pumpWidget(
      ProviderScope(
        overrides: overrides,

        child: MyMaterialApp(router: router, locale: const Locale('fr')),
      ),
    );

    addTearDown(router.dispose);

    return (router: router);
  }
}
