import 'package:breizh_blok_mobile/data/data_sources/api/model/request_strategy.dart';
import 'package:breizh_blok_mobile/routing/router_observer.dart';
import 'package:breizh_blok_mobile/ui/boulder/widgets/boulder_details_screen.dart';
import 'package:breizh_blok_mobile/ui/boulder/widgets/boulder_list_screen.dart';
import 'package:breizh_blok_mobile/ui/boulder_area/widgets/boulder_area_details_screen.dart';
import 'package:breizh_blok_mobile/ui/core/widgets/scaffold_nested_navigation.dart';
import 'package:breizh_blok_mobile/ui/department/widgets/department_list_screen.dart';
import 'package:breizh_blok_mobile/ui/download/widgets/downloaded_boulder_area_details_screen.dart';
import 'package:breizh_blok_mobile/ui/download/widgets/downloaded_boulder_areas_screen.dart';
import 'package:breizh_blok_mobile/ui/download/widgets/downloaded_boulder_details_screen.dart';
import 'package:breizh_blok_mobile/ui/map/widgets/map_screen.dart';
import 'package:breizh_blok_mobile/ui/municipality/widgets/municipality_details_screen.dart';
import 'package:breizh_blok_mobile/ui/profile/widgets/profile_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();
final _boulderListShellNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: 'boulderListShell',
);
final _mapShellNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'mapShell');
final _sitesShellNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: 'sitesShell',
);
final _profileShellNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: 'profileShell',
);

final routes = [
  StatefulShellRoute.indexedStack(
    builder: (_, _, navigationShell) {
      return ScaffoldNestedNavigation(navigationShell);
    },
    branches: <StatefulShellBranch>[
      StatefulShellBranch(
        navigatorKey: _boulderListShellNavigatorKey,
        observers: [RouterObserver()],
        routes: <RouteBase>[
          GoRoute(
            path: BoulderListScreen.route.path,
            name: BoulderListScreen.route.name,
            pageBuilder: (_, _) => NoTransitionPage(
              child: RepositoryProvider(
                create: (context) => RequestStrategy(),
                child: const BoulderListScreen(),
              ),
            ),
            routes: [
              GoRoute(
                path: BoulderAreaDetailsScreen.route.path,
                name: BoulderAreaDetailsScreen.route.name,
                builder: (context, state) {
                  return RepositoryProvider(
                    create: (context) => RequestStrategy(),
                    child: BoulderAreaDetailsScreen(
                      id:
                          state.pathParameters[BoulderAreaDetailsScreen
                              .idParameterName]!,
                    ),
                  );
                },
              ),
              GoRoute(
                path: BoulderDetailsScreen.route.path,
                name: BoulderDetailsScreen.route.name,
                builder: (context, state) {
                  return RepositoryProvider(
                    create: (context) => RequestStrategy(),
                    child: BoulderDetailsScreen(
                      id:
                          state.pathParameters[BoulderDetailsScreen
                              .idParameterName]!,
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
      StatefulShellBranch(
        navigatorKey: _mapShellNavigatorKey,
        observers: [RouterObserver()],
        routes: <RouteBase>[
          GoRoute(
            path: MapScreen.route.path,
            name: MapScreen.route.name,
            pageBuilder: (_, _) => NoTransitionPage(
              child: RepositoryProvider(
                create: (context) => RequestStrategy(offlineFirst: true),
                child: const MapScreen(),
              ),
            ),
          ),
        ],
      ),
      StatefulShellBranch(
        navigatorKey: _sitesShellNavigatorKey,
        observers: [RouterObserver()],
        routes: <RouteBase>[
          GoRoute(
            path: DepartmentListScreen.route.path,
            name: DepartmentListScreen.route.name,
            pageBuilder: (_, _) => NoTransitionPage(
              child: RepositoryProvider(
                create: (context) => RequestStrategy(),
                child: const DepartmentListScreen(),
              ),
            ),
            routes: [
              GoRoute(
                path: MunicipalityDetailsScreen.route.path,
                name: MunicipalityDetailsScreen.route.name,
                builder: (context, state) {
                  return RepositoryProvider(
                    create: (context) => RequestStrategy(),
                    child: MunicipalityDetailsScreen(
                      id:
                          state.pathParameters[MunicipalityDetailsScreen
                              .idParameterName]!,
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
      StatefulShellBranch(
        navigatorKey: _profileShellNavigatorKey,
        observers: [RouterObserver()],
        routes: <RouteBase>[
          GoRoute(
            path: ProfileScreen.route.path,
            name: ProfileScreen.route.name,
            pageBuilder: (_, _) => NoTransitionPage(
              child: RepositoryProvider(
                create: (context) => RequestStrategy(),
                child: const ProfileScreen(),
              ),
            ),
            routes: [
              GoRoute(
                path: DownloadedBoulderAreasScreen.route.path,
                name: DownloadedBoulderAreasScreen.route.name,
                builder: (context, state) {
                  return RepositoryProvider<RequestStrategy>(
                    create: (context) => RequestStrategy(offlineFirst: true),
                    child: const DownloadedBoulderAreasScreen(),
                  );
                },
                routes: [
                  GoRoute(
                    path: DownloadedBoulderDetailsScreen.route.path,
                    name: DownloadedBoulderDetailsScreen.route.name,
                    builder: (context, state) {
                      return RepositoryProvider<RequestStrategy>(
                        create: (context) =>
                            RequestStrategy(offlineFirst: true),
                        child: DownloadedBoulderDetailsScreen(
                          id:
                              state
                                  // ignore: lines_longer_than_80_chars
                                  .pathParameters[DownloadedBoulderDetailsScreen
                                  .idParameterName]!,
                          boulderAreaIri:
                              state
                                  .uri
                                  // ignore: lines_longer_than_80_chars
                                  .queryParameters[DownloadedBoulderDetailsScreen
                                  .boulderAreaIriParameterName]!,
                        ),
                      );
                    },
                  ),
                  GoRoute(
                    path: DownloadedBoulderAreaDetailsScreen.route.path,
                    name: DownloadedBoulderAreaDetailsScreen.route.name,
                    builder: (context, state) {
                      return RepositoryProvider<RequestStrategy>(
                        create: (context) =>
                            RequestStrategy(offlineFirst: true),
                        child: DownloadedBoulderAreaDetailsScreen(
                          id:
                              state
                                  // ignore: lines_longer_than_80_chars
                                  .pathParameters[DownloadedBoulderAreaDetailsScreen
                                  .idParameterName]!,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ],
  ),
];

GoRouter createRouter({
  required List<RouteBase> routes,
  List<NavigatorObserver>? observers,
  String? initialLocation,
}) {
  return GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: initialLocation ?? BoulderListScreen.route.path,
    observers: observers,
    routes: routes,
  );
}
