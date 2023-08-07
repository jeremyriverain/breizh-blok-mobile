import 'package:breizh_blok_mobile/blocs/boulder_marker_bloc.dart';
import 'package:breizh_blok_mobile/blocs/boulder_order_bloc.dart';
import 'package:breizh_blok_mobile/blocs/map_bloc.dart';
import 'package:breizh_blok_mobile/blocs/map_permission_bloc.dart';
import 'package:breizh_blok_mobile/location_provider.dart';
import 'package:breizh_blok_mobile/models/order_query_param.dart';
import 'package:breizh_blok_mobile/views/boulder_area_details_view.dart';
import 'package:breizh_blok_mobile/views/municipality_details_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:location/location.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import 'package:breizh_blok_mobile/views/boulder_details_view.dart';
import 'package:breizh_blok_mobile/blocs/boulder_filter_bloc.dart';
import 'package:breizh_blok_mobile/views/home_view.dart';
import 'package:breizh_blok_mobile/blocs/tab_bloc.dart';
import 'package:breizh_blok_mobile/blocs/terms_of_use_bloc.dart';

main({
  MapPermissionBloc? mapPermissionBloc,
}) async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  TermsOfUseBloc termsOfUseBloc = TermsOfUseBloc();

  TabBloc tabBloc = TabBloc();

  MapBloc mapBloc = MapBloc();

  final BoulderFilterBloc boulderFilterBloc = BoulderFilterBloc(
    BoulderFilterState(),
  );

  final BoulderOrderBloc boulderOrderBloc = BoulderOrderBloc(
    const OrderQueryParam(direction: 'desc', name: 'order[id]'),
  );

  final boulderMarkerBloc = BoulderMarkerBloc();

  await SentryFlutter.init(
    (options) {
      options.dsn = options.dsn =
          const String.fromEnvironment('SENTRY_DSN', defaultValue: '');
      options.tracesSampleRate = 0;
    },
    appRunner: () => runApp(
      MultiBlocProvider(
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
        ],
        child: LocationProvider(
          locationInstance: Location.instance,
          child: MyApp(),
        ),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

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
          return BoulderDetailsView(id: state.params['bid'] as String);
        },
      ),
      GoRoute(
        path: '/boulders-area/:id',
        name: 'boulder_area_details',
        builder: (context, state) {
          return BoulderAreaDetailsView(id: state.params['id'] as String);
        },
      ),
      GoRoute(
        path: '/municipalities/:id',
        name: 'municipality_details',
        builder: (context, state) {
          return MunicipalityDetailsView(id: state.params['id'] as String);
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
