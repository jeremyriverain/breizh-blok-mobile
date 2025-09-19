import 'dart:io';

import 'package:breizh_blok_api_generated/breizh_blok_api_generated.dart'
    as api;
import 'package:breizh_blok_auth/breizh_blok_auth.dart';
import 'package:breizh_blok_mobile/data/data_sources/api/api_client.dart';
import 'package:breizh_blok_mobile/data/data_sources/api/dio/create_dio.dart';
import 'package:breizh_blok_mobile/data/data_sources/local/app_database.dart';
import 'package:breizh_blok_mobile/data/data_sources/local/model/image_boulder_cache.dart';
import 'package:breizh_blok_mobile/routing/router.dart';
import 'package:breizh_blok_mobile/services/share_content/share_content_service.dart';
import 'package:breizh_blok_mobile/services/share_content/share_content_service_impl.dart';
import 'package:breizh_blok_mobile/services/tracking/tracking_service.dart';
import 'package:breizh_blok_mobile/ui/boulder/widgets/boulder_list_screen.dart';
import 'package:breizh_blok_url_launcher/breizh_blok_url_launcher.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:location/location.dart';
import 'package:mixpanel_flutter/mixpanel_flutter.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
Mixpanel mixpanel(Ref ref) {
  throw Exception();
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
  return getRoutes(trackingService: ref.watch(trackingServiceProvider));
}

@riverpod
ShareContentService shareContentService(Ref ref) {
  return ShareContentServiceImpl();
}

@riverpod
SharedPreferences sharedPreferences(Ref ref) {
  throw Exception();
}

@riverpod
TrackingService trackingService(Ref ref) {
  return TrackingService(mixpanel: ref.watch(mixpanelProvider));
}

@riverpod
UrlLauncher urlLauncher(Ref ref) {
  return BreizhBlokUrlLauncher.createUrlLauncher();
}
