import 'package:breizh_blok_mobile/data/data_sources/local/app_database.dart';
import 'package:breizh_blok_mobile/routing/router.dart';
import 'package:breizh_blok_mobile/service_locator/locale.dart';
import 'package:breizh_blok_mobile/service_locator/service_locator.dart';
import 'package:breizh_blok_mobile/services/tracking/tracking_service.dart';
import 'package:breizh_blok_mobile/ui/my_material_app.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:mocktail/mocktail.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'mocks.dart';

extension WidgetTesterExtension on WidgetTester {
  Future<void> myPumpWidget({
    required Widget widget,
    List<Override> overrides = const [],
    AppDatabase? appDatabase,
    TrackingService? trackingService,
    bool overrideLocale = true,
  }) async {
    driftRuntimeOptions.dontWarnAboutMultipleDatabases = true;

    final mockTrackingService = MockTrackingService();
    when(
      () => mockTrackingService.trackPageViewed(
        path: any(named: 'path'),
        navigationType: any(named: 'navigationType'),
      ),
    ).thenReturn(() {}());

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
              ...getRoutes(
                trackingService: trackingService ?? mockTrackingService,
              ),
            ],
          ),
          appDatabaseProvider.overrideWith(
            (_) => appDatabase ?? AppDatabase(NativeDatabase.memory()),
          ),
          if (overrideLocale)
            myLocaleProvider.overrideWithBuild((_, _) => const Locale('fr')),
          trackingServiceProvider.overrideWith(
            (_) => trackingService ?? mockTrackingService,
          ),
        ],

        child: const MyMaterialApp(),
      ),
    );
  }
}
