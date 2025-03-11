import 'dart:io';

import 'package:breizh_blok_mobile/config/env_vars.dart';
import 'package:breizh_blok_mobile/data/data_sources/api/api_client.dart';
import 'package:breizh_blok_mobile/data/data_sources/api/model/api_order_param.dart';
import 'package:breizh_blok_mobile/data/data_sources/local/app_database.dart';
import 'package:breizh_blok_mobile/data/data_sources/local/model/image_boulder_cache.dart';
import 'package:breizh_blok_mobile/data/repositories/boulder/boulder_repository.dart';
import 'package:breizh_blok_mobile/data/repositories/boulder_area/boulder_area_repository.dart';
import 'package:breizh_blok_mobile/data/repositories/department/department_repository.dart';
import 'package:breizh_blok_mobile/data/repositories/downloaded_boulder_repository/downloaded_boulder_repository.dart';
import 'package:breizh_blok_mobile/data/repositories/grade/grade_repository.dart';
import 'package:breizh_blok_mobile/data/repositories/municipality/municipality_repository.dart';
import 'package:breizh_blok_mobile/routing/router.dart';
import 'package:breizh_blok_mobile/services/share_content/share_content_service.dart';
import 'package:breizh_blok_mobile/services/share_content/share_content_service_interface.dart';
import 'package:breizh_blok_mobile/services/tracking/tracking_service.dart';
import 'package:breizh_blok_mobile/ui/boulder/view_models/boulder_filter_bloc.dart';
import 'package:breizh_blok_mobile/ui/boulder/view_models/boulder_filter_grade_bloc.dart';
import 'package:breizh_blok_mobile/ui/boulder/view_models/boulder_order_bloc.dart';
import 'package:breizh_blok_mobile/ui/locale/view_models/locale_view_model.dart';
import 'package:breizh_blok_mobile/ui/my_app.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter/material.dart' hide HttpClientProvider, Router;
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';
import 'package:mixpanel_flutter/mixpanel_flutter.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main({
  ShareContentServiceInterface? shareContentService,
  AppDatabase? database,
  Mixpanel? mixpanel,
}) async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  MapboxOptions.setAccessToken(EnvVars.mapboxToken);

  final localDatabase = GetIt.I.registerSingleton<AppDatabase>(
    database ??
        AppDatabase(
          LazyDatabase(() async {
            final dbFolder = await getApplicationDocumentsDirectory();
            final file = File(p.join(dbFolder.path, 'db.sqlite'));
            return NativeDatabase.createInBackground(file);
          }),
        ),
  );

  final httpClient = ApiClient(database: localDatabase);

  final imageBoulderCache = ImageBoulderCache();

  final boulderFilterBloc = BoulderFilterBloc(const BoulderFilterState());

  final boulderOrderBloc = BoulderOrderBloc(
    const ApiOrderParam(direction: kDescendantDirection, name: kIdOrderParam),
  );

  final boulderFilterGradeBloc = BoulderFilterGradeBloc(
    const BoulderFilterGradeState(),
  );

  final appShareContentService = shareContentService ?? ShareContentService();

  final localeBloc = await LocaleViewModel.create();

  GetIt.I.registerSingleton<Mixpanel>(
    mixpanel ??
        await Mixpanel.init(EnvVars.mixPanelToken, trackAutomaticEvents: true),
  );

  GetIt.I.registerSingleton<TrackingService>(TrackingService());

  GetIt.I.registerSingleton<GoRouter>(Router()());

  GetIt.I.registerSingleton<SharedPreferences>(
    await SharedPreferences.getInstance(),
  );

  await SentryFlutter.init(
    (options) {
      options
        ..dsn = options.dsn = EnvVars.sentryDsn
        ..tracesSampleRate = 0;
    },
    appRunner:
        () => runApp(
          MultiRepositoryProvider(
            providers: [
              RepositoryProvider<BoulderAreaRepository>(
                create:
                    (context) => BoulderAreaRepository(httpClient: httpClient),
              ),
              RepositoryProvider<BoulderRepository>(
                create: (context) => BoulderRepository(httpClient: httpClient),
              ),
              RepositoryProvider<DepartmentRepository>(
                create:
                    (context) => DepartmentRepository(httpClient: httpClient),
              ),
              RepositoryProvider<GradeRepository>(
                create: (context) => GradeRepository(httpClient: httpClient),
              ),
              RepositoryProvider<MunicipalityRepository>(
                create:
                    (context) => MunicipalityRepository(httpClient: httpClient),
              ),
              RepositoryProvider<AppDatabase>(
                create: (context) => localDatabase,
              ),
              RepositoryProvider<ApiClient>(create: (context) => httpClient),
              RepositoryProvider<ImageBoulderCache>(
                create: (context) => imageBoulderCache,
              ),
              RepositoryProvider<ShareContentServiceInterface>(
                create: (context) => appShareContentService,
              ),
              RepositoryProvider<DownloadedBoulderRepository>(
                create:
                    (context) => DownloadedBoulderRepository(
                      httpClient: httpClient,
                      database: localDatabase,
                    ),
              ),
            ],
            child: MultiBlocProvider(
              providers: [
                BlocProvider<BoulderFilterBloc>(
                  create: (BuildContext context) => boulderFilterBloc,
                ),
                BlocProvider<BoulderOrderBloc>(
                  create: (BuildContext context) => boulderOrderBloc,
                ),
                BlocProvider<BoulderFilterGradeBloc>(
                  create: (BuildContext context) => boulderFilterGradeBloc,
                ),
                BlocProvider<LocaleViewModel>(create: (context) => localeBloc),
              ],
              child: const MyApp(),
            ),
          ),
        ),
  );
}
