import 'package:breizh_blok_mobile/data/data_sources/local/app_database.dart';
import 'package:breizh_blok_mobile/routing/router.dart';
import 'package:breizh_blok_mobile/service_locator/locale.dart';
import 'package:breizh_blok_mobile/service_locator/service_locator.dart';
import 'package:breizh_blok_mobile/ui/my_material_app.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

extension WidgetTesterExtension on WidgetTester {
  Future<void> myPumpWidget({
    required Widget widget,
    List<Override> overrides = const [],
    AppDatabase? appDatabase,
    bool overrideLocale = true,
  }) async {
    GetIt.I.allowReassignment = true;
    driftRuntimeOptions.dontWarnAboutMultipleDatabases = true;

    await pumpWidget(
      ProviderScope(
        overrides: [
          ...overrides,
          routerObserversProvider.overrideWith((_) => []),
          routerInitialLocationProvider.overrideWith((_) => '/foo'),
          routerRoutesProvider.overrideWith(
            (_) => [
              GoRoute(
                path: '/foo',
                builder: (context, state) => Scaffold(body: widget),
              ),
              ...routes,
            ],
          ),
          appDatabaseProvider.overrideWith(
            (_) => appDatabase ?? AppDatabase(NativeDatabase.memory()),
          ),
          if (overrideLocale)
            myLocaleProvider.overrideWithBuild((_, _) => const Locale('fr')),
        ],

        child: const MyMaterialApp(),
      ),
    );
  }
}
