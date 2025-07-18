import 'dart:io';

import 'package:breizh_blok_api_generated/breizh_blok_api_generated.dart'
    as api;
import 'package:breizh_blok_auth/breizh_blok_auth.dart';
import 'package:breizh_blok_mobile/config/env.dart';
import 'package:breizh_blok_mobile/data/data_sources/api/api_boulder_feedback_data_source.dart';
import 'package:breizh_blok_mobile/data/data_sources/api/dio/create_dio.dart';
import 'package:breizh_blok_mobile/data/data_sources/local/app_database.dart';
import 'package:breizh_blok_mobile/data/repositories/boulder_feedback/boulder_feedback_repository.dart';
import 'package:breizh_blok_mobile/data/repositories/boulder_feedback/boulder_feedback_repository_impl.dart';
import 'package:breizh_blok_mobile/routing/router.dart';
import 'package:breizh_blok_mobile/services/share_content/share_content_service.dart';
import 'package:breizh_blok_mobile/services/share_content/share_content_service_interface.dart';
import 'package:breizh_blok_mobile/services/tracking/tracking_service.dart';
import 'package:breizh_blok_mobile/ui/locale/view_models/locale_view_model.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:mixpanel_flutter/mixpanel_flutter.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> setupApp({
  ShareContentServiceInterface? shareContentService,
  AppDatabase? database,
  Mixpanel? mixpanel,
}) async {
  GetIt.I.registerSingleton<AppDatabase>(
    database ??
        AppDatabase(
          LazyDatabase(() async {
            final dbFolder = await getApplicationDocumentsDirectory();
            final file = File(p.join(dbFolder.path, 'db.sqlite'));
            return NativeDatabase.createInBackground(file);
          }),
        ),
  );

  GetIt.I.registerSingleton<Mixpanel>(
    mixpanel ??
        await Mixpanel.init(Env.mixPanelToken, trackAutomaticEvents: true),
  );

  GetIt.I.registerSingleton<TrackingService>(TrackingService());

  GetIt.I.registerSingleton<GoRouter>(
    createRouter(routes: routes, observers: [SentryNavigatorObserver()]),
  );

  GetIt.I.registerSingleton<SharedPreferences>(
    await SharedPreferences.getInstance(),
  );

  GetIt.I.registerSingleton<ShareContentServiceInterface>(
    shareContentService ?? ShareContentService(),
  );

  GetIt.I.registerSingleton<LocaleViewModel>(await LocaleViewModel.create());

  final auth = await BreizhBlokAuth.createAuth(
    domain: 'breizh-blok.eu.auth0.com',
    clientId: Env.auth0ClientId,
    audience: Env.auth0Audience,
  );

  GetIt.I.registerSingleton<Auth>(auth);

  final breizhBlokApi = api.BreizhBlokApiGenerated(dio: createDio(auth: auth));

  GetIt.I.registerLazySingleton<BoulderFeedbackRepository>(
    () => BoulderFeedbackRepositoryImpl(
      apiDataSource: ApiBoulderFeedbackDataSource(
        api: breizhBlokApi.getBoulderFeedbackApi(),
      ),
    ),
  );
}
