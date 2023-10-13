import 'dart:io';

import 'package:breizh_blok_mobile/app_http_client.dart';
import 'package:breizh_blok_mobile/blocs/boulder_filter_bloc.dart';
import 'package:breizh_blok_mobile/blocs/boulder_filter_grade_bloc.dart';
import 'package:breizh_blok_mobile/blocs/boulder_marker_bloc.dart';
import 'package:breizh_blok_mobile/blocs/boulder_order_bloc.dart';
import 'package:breizh_blok_mobile/blocs/map_bloc.dart';
import 'package:breizh_blok_mobile/blocs/map_permission_bloc.dart';
import 'package:breizh_blok_mobile/blocs/offline_bloc.dart';
import 'package:breizh_blok_mobile/blocs/tab_bloc.dart';
import 'package:breizh_blok_mobile/blocs/terms_of_use_bloc.dart';
import 'package:breizh_blok_mobile/database/app_database.dart';
import 'package:breizh_blok_mobile/location_provider.dart';
import 'package:breizh_blok_mobile/models/order_query_param.dart';
import 'package:breizh_blok_mobile/repositories/boulder_area_repository.dart';
import 'package:breizh_blok_mobile/repositories/boulder_marker_repository.dart';
import 'package:breizh_blok_mobile/repositories/boulder_repository.dart';
import 'package:breizh_blok_mobile/repositories/department_repository.dart';
import 'package:breizh_blok_mobile/repositories/grade_repository.dart';
import 'package:breizh_blok_mobile/repositories/municipality_repository.dart';
import 'package:breizh_blok_mobile/views/boulder_area_details_view.dart';
import 'package:breizh_blok_mobile/views/boulder_details_view.dart';
import 'package:breizh_blok_mobile/views/home_view.dart';
import 'package:breizh_blok_mobile/views/municipality_details_view.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter/material.dart' hide HttpClientProvider;
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:location/location.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

Future<void> main({
  MapPermissionBloc? mapPermissionBloc,
  AppDatabase? database,
}) async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  final termsOfUseBloc = TermsOfUseBloc();

  final appDatabase = database ??
      AppDatabase(
        LazyDatabase(() async {
          final dbFolder = await getApplicationDocumentsDirectory();
          final file = File(p.join(dbFolder.path, 'db.sqlite'));
          return NativeDatabase.createInBackground(file);
        }),
      );
  final httpClient = AppHttpClient();

  final tabBloc = TabBloc();

  final mapBloc = MapBloc();

  final boulderFilterBloc = BoulderFilterBloc(
    BoulderFilterState(),
  );

  final boulderOrderBloc = BoulderOrderBloc(
    const OrderQueryParam(direction: 'desc', name: 'order[id]'),
  );

  final boulderFilterGradeBloc =
      BoulderFilterGradeBloc(BoulderFilterGradeState());
  final boulderMarkerRepository =
      BoulderMarkerRepository(httpClient: httpClient);

  final boulderMarkerBloc = BoulderMarkerBloc(
    repository: boulderMarkerRepository,
  );

  final offlineBloc = OfflineBloc();

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
            create: (context) => appDatabase,
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
            BlocProvider<OfflineBloc>(create: (context) => offlineBloc),
          ],
          child: LocationProvider(
            locationInstance: Location.instance,
            child: MyApp(),
          ),
        ),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _router = GoRouter(
    routes: [
      GoRoute(
        path: '/boulders',
        name: 'boulder_list',
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: '/boulders/:bid',
        name: 'boulder_details',
        builder: (context, state) {
          return BoulderDetailsView(id: state.pathParameters['bid']!);
        },
      ),
      GoRoute(
        path: '/boulders-area/:id',
        name: 'boulder_area_details',
        builder: (context, state) {
          return BoulderAreaDetailsView(id: state.pathParameters['id']!);
        },
      ),
      GoRoute(
        path: '/municipalities/:id',
        name: 'municipality_details',
        builder: (context, state) {
          return MunicipalityDetailsView(id: state.pathParameters['id']!);
        },
      ),
    ],
    initialLocation: '/boulders',
  );

  @override
  Widget build(BuildContext context) => MaterialApp.router(
        routeInformationProvider: _router.routeInformationProvider,
        routeInformationParser: _router.routeInformationParser,
        routerDelegate: _router.routerDelegate,
        theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.lightBlue),
        debugShowCheckedModeBanner: false,
      );
}
