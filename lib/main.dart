import 'dart:io';

import 'package:breizh_blok_mobile/app_http_client.dart';
import 'package:breizh_blok_mobile/blocs/boulder_filter_bloc.dart';
import 'package:breizh_blok_mobile/blocs/boulder_filter_grade_bloc.dart';
import 'package:breizh_blok_mobile/blocs/boulder_marker_bloc.dart';
import 'package:breizh_blok_mobile/blocs/boulder_order_bloc.dart';
import 'package:breizh_blok_mobile/blocs/locale_bloc.dart';
import 'package:breizh_blok_mobile/blocs/map_bloc.dart';
import 'package:breizh_blok_mobile/blocs/map_permission_bloc.dart';
import 'package:breizh_blok_mobile/blocs/tab_bloc.dart';
import 'package:breizh_blok_mobile/blocs/terms_of_use_bloc.dart';
import 'package:breizh_blok_mobile/image_boulder_cache.dart';
import 'package:breizh_blok_mobile/local_db/app_database.dart';
import 'package:breizh_blok_mobile/models/order_param.dart';
import 'package:breizh_blok_mobile/navigation/app_router.dart';
import 'package:breizh_blok_mobile/repositories/boulder_area_repository.dart';
import 'package:breizh_blok_mobile/repositories/boulder_marker_repository.dart';
import 'package:breizh_blok_mobile/repositories/boulder_repository.dart';
import 'package:breizh_blok_mobile/repositories/department_repository.dart';
import 'package:breizh_blok_mobile/repositories/grade_repository.dart';
import 'package:breizh_blok_mobile/repositories/municipality_repository.dart';
import 'package:breizh_blok_mobile/share_content_service.dart';
import 'package:breizh_blok_mobile/share_content_service_interface.dart';
import 'package:breizh_blok_mobile/tracking_service.dart';
import 'package:breizh_blok_mobile/ui/my_app.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter/material.dart' hide HttpClientProvider;
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:location/location.dart';
import 'package:mixpanel_flutter/mixpanel_flutter.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

Future<void> main({
  MapPermissionBloc? mapPermissionBloc,
  ShareContentServiceInterface? shareContentService,
  AppDatabase? database,
}) async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  final termsOfUseBloc = TermsOfUseBloc();

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

  final httpClient = AppHttpClient(
    database: localDatabase,
  );

  final imageBoulderCache = ImageBoulderCache();

  final tabBloc = TabBloc();

  final mapBloc = MapBloc();

  final boulderFilterBloc = BoulderFilterBloc(
    BoulderFilterState(),
  );

  final boulderOrderBloc = BoulderOrderBloc(
    const OrderParam(
      direction: kDescendantDirection,
      name: kIdOrderParam,
    ),
  );

  final boulderFilterGradeBloc =
      BoulderFilterGradeBloc(BoulderFilterGradeState());
  final boulderMarkerRepository =
      BoulderMarkerRepository(httpClient: httpClient);

  final boulderMarkerBloc = BoulderMarkerBloc(
    repository: boulderMarkerRepository,
  );

  final appShareContentService = shareContentService ?? ShareContentService();

  final localeBloc = await LocaleBloc.create();

  GetIt.I.registerSingleton<Mixpanel>(
    await Mixpanel.init(
      const String.fromEnvironment('MIX_PANEL_TOKEN'),
      trackAutomaticEvents: false,
    ),
  );

  GetIt.I.registerSingleton<TrackingService>(TrackingService());

  GetIt.I.registerSingleton<GoRouter>(AppRouter()());

  await SentryFlutter.init(
    (options) {
      options
        ..dsn = options.dsn = const String.fromEnvironment('SENTRY_DSN')
        ..tracesSampleRate = 0;
    },
    appRunner: () => runApp(
      MultiRepositoryProvider(
        providers: [
          RepositoryProvider<BoulderAreaRepository>(
            create: (context) => BoulderAreaRepository(httpClient: httpClient),
          ),
          RepositoryProvider<BoulderMarkerRepository>(
            create: (context) => boulderMarkerRepository,
          ),
          RepositoryProvider<BoulderRepository>(
            create: (context) => BoulderRepository(httpClient: httpClient),
          ),
          RepositoryProvider<DepartmentRepository>(
            create: (context) => DepartmentRepository(httpClient: httpClient),
          ),
          RepositoryProvider<GradeRepository>(
            create: (context) => GradeRepository(httpClient: httpClient),
          ),
          RepositoryProvider<MunicipalityRepository>(
            create: (context) => MunicipalityRepository(httpClient: httpClient),
          ),
          RepositoryProvider<AppDatabase>(
            create: (context) => localDatabase,
          ),
          RepositoryProvider<AppHttpClient>(
            create: (context) => httpClient,
          ),
          RepositoryProvider<ImageBoulderCache>(
            create: (context) => imageBoulderCache,
          ),
          RepositoryProvider<ShareContentServiceInterface>(
            create: (context) => appShareContentService,
          ),
          RepositoryProvider<Location>(
            create: (context) => Location.instance,
          ),
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider<TermsOfUseBloc>(
              create: (BuildContext context) => termsOfUseBloc,
            ),
            BlocProvider<BoulderFilterBloc>(
              create: (BuildContext context) => boulderFilterBloc,
            ),
            BlocProvider<BoulderOrderBloc>(
              create: (BuildContext context) => boulderOrderBloc,
            ),
            BlocProvider<BoulderFilterGradeBloc>(
              create: (BuildContext context) => boulderFilterGradeBloc,
            ),
            BlocProvider<BoulderMarkerBloc>(
              create: (BuildContext context) => boulderMarkerBloc,
            ),
            BlocProvider<TabBloc>(
              create: (BuildContext context) => tabBloc,
            ),
            BlocProvider<MapBloc>(
              create: (BuildContext context) => mapBloc,
            ),
            BlocProvider<MapPermissionBloc>(
              create: (BuildContext context) =>
                  mapPermissionBloc ?? MapPermissionBloc(),
            ),
            BlocProvider<LocaleBloc>(
              create: (context) => localeBloc,
            ),
          ],
          child: const MyApp(),
        ),
      ),
    ),
  );
}
