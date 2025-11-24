import 'dart:io';

import 'package:breizh_blok_analytics/breizh_blok_analytics.dart';
import 'package:breizh_blok_api_generated/breizh_blok_api_generated.dart'
    as api;
import 'package:breizh_blok_auth/breizh_blok_auth.dart';
import 'package:breizh_blok_mobile/data/data_sources/api/api_client.dart';
import 'package:breizh_blok_mobile/data/data_sources/api/dio/create_dio.dart';
import 'package:breizh_blok_mobile/data/data_sources/local/app_database.dart';
import 'package:breizh_blok_mobile/data/data_sources/local/model/image_boulder_cache.dart';
import 'package:breizh_blok_mobile/routing/router.dart';
import 'package:breizh_blok_mobile/ui/boulder/widgets/boulder_list_screen.dart';
import 'package:breizh_blok_share_content/breizh_blok_share_content.dart';
import 'package:breizh_blok_url_launcher/breizh_blok_url_launcher.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:location/location.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:upgrader/upgrader.dart';

part 'service_locator.g.dart';

@riverpod
ApiClient apiClient(Ref ref) {
  return ApiClient(database: ref.watch(appDatabaseProvider));
}

@riverpod
AppDatabase appDatabase(Ref ref) {
  return AppDatabase(
    LazyDatabase(() async {
      final dbFolder = await getApplicationDocumentsDirectory();
      final file = File(p.join(dbFolder.path, 'db.sqlite'));
      return NativeDatabase.createInBackground(file);
    }),
  );
}

@riverpod
Auth auth(Ref ref) {
  throw Exception();
}

@riverpod
api.BreizhBlokApiGenerated breizhBlokApi(Ref ref) {
  return api.BreizhBlokApiGenerated(
    dio: createDio(auth: ref.watch(authProvider)),
  );
}

@riverpod
Analytics analytics(Ref ref) {
  throw Exception();
}

@riverpod
String? flavor(Ref ref) {
  return appFlavor;
}

@riverpod
ImageBoulderCache imageBoulderCache(Ref ref) {
  return ImageBoulderCache();
}

@riverpod
Location location(Ref ref) {
  return Location();
}

@riverpod
GoRouter router(Ref ref) {
  return GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: ref.watch(routerInitialLocationProvider),
    observers: ref.watch(routerObserversProvider),
    routes: ref.watch(routerRoutesProvider),
  );
}

@riverpod
String routerInitialLocation(Ref ref) {
  return BoulderListScreen.route.path;
}

@riverpod
List<NavigatorObserver>? routerObservers(Ref ref) {
  return [SentryNavigatorObserver()];
}

@riverpod
List<RouteBase> routerRoutes(Ref ref) {
  return getRoutes(analytics: ref.watch(analyticsProvider));
}

@riverpod
ShareContent shareContent(Ref ref) {
  return BreizhBlokShareContent.createShareContent();
}

@riverpod
SharedPreferences sharedPreferences(Ref ref) {
  throw Exception();
}

@riverpod
UrlLauncher urlLauncher(Ref ref) {
  return BreizhBlokUrlLauncher.createUrlLauncher();
}

@riverpod
Upgrader upgrader(Ref ref) {
  return Upgrader();
}
