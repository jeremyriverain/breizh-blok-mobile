import 'package:breizh_blok_mobile/data/data_sources/api/model/request_strategy.dart';
import 'package:breizh_blok_mobile/routing/router_observer.dart';
import 'package:breizh_blok_mobile/ui/boulder/widgets/boulder_details_screen.dart';
import 'package:breizh_blok_mobile/ui/boulder/widgets/boulder_list_screen.dart';
import 'package:breizh_blok_mobile/ui/boulder_area/widgets/boulder_area_details_screen.dart';
import 'package:breizh_blok_mobile/ui/core/widgets/scaffold_nested_navigation.dart';
import 'package:breizh_blok_mobile/ui/download/widgets/download_screen.dart';
import 'package:breizh_blok_mobile/ui/download/widgets/downloaded_boulder_area_details_screen.dart';
import 'package:breizh_blok_mobile/ui/download/widgets/downloaded_boulder_details_screen.dart';
import 'package:breizh_blok_mobile/ui/map/widgets/map_screen.dart';
import 'package:breizh_blok_mobile/ui/municipality/widgets/municipality_details_screen.dart';
import 'package:breizh_blok_mobile/ui/municipality/widgets/municipality_list_screen.dart';
import 'package:breizh_blok_mobile/ui/profile/widgets/profile_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
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

final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: BoulderListScreen.route.path,
  observers: [RouterObserver()],
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (_, __, navigationShell) {
        return ScaffoldWithNestedNavigation(navigationShell);
      },
      branches: <StatefulShellBranch>[
        StatefulShellBranch(
          navigatorKey: _boulderListShellNavigatorKey,
          routes: <RouteBase>[
            GoRoute(
              path: BoulderListScreen.route.path,
              name: BoulderListScreen.route.name,
              pageBuilder:
                  (_, _) => NoTransitionPage(
                    child: RepositoryProvider(
                      create: (context) => RequestStrategy(),
                      child: const BoulderListScreen(),
                    ),
                  ),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _mapShellNavigatorKey,
          routes: <RouteBase>[
            GoRoute(
              path: MapScreen.route.path,
              name: MapScreen.route.name,
              pageBuilder:
                  (_, _) => NoTransitionPage(
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
          routes: <RouteBase>[
            GoRoute(
              path: MunicipalityListScreen.route.path,
              name: MunicipalityListScreen.route.name,
              pageBuilder:
                  (_, __) => NoTransitionPage(
                    child: RepositoryProvider(
                      create: (context) => RequestStrategy(),
                      child: const MunicipalityListScreen(),
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
                        id: state.pathParameters['id']!,
                      ),
                    );
                  },
                  routes: [
                    GoRoute(
                      path: BoulderAreaDetailsScreen.route.path,
                      name: BoulderAreaDetailsScreen.route.name,
                      builder: (context, state) {
                        return RepositoryProvider(
                          create: (context) => RequestStrategy(),
                          child: BoulderAreaDetailsScreen(
                            id: state.pathParameters['id']!,
                          ),
                        );
                      },
                      routes: [
                        GoRoute(
                          path: BoulderDetailsScreen.route.path,
                          name: BoulderDetailsScreen.route.name,
                          builder: (context, state) {
                            return RepositoryProvider(
                              create: (context) => RequestStrategy(),
                              child: BoulderDetailsScreen(
                                id: state.pathParameters['id']!,
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
        StatefulShellBranch(
          navigatorKey: _profileShellNavigatorKey,
          routes: <RouteBase>[
            GoRoute(
              path: ProfileScreen.route.path,
              name: ProfileScreen.route.name,
              pageBuilder:
                  (_, __) => NoTransitionPage(
                    child: RepositoryProvider(
                      create: (context) => RequestStrategy(),
                      child: const ProfileScreen(),
                    ),
                  ),
              routes: [
                GoRoute(
                  path: DownloadScreen.route.path,
                  name: DownloadScreen.route.name,
                  builder: (context, state) {
                    return RepositoryProvider<RequestStrategy>(
                      create: (context) => RequestStrategy(offlineFirst: true),
                      child: const DownloadScreen(),
                    );
                  },
                  routes: [
                    GoRoute(
                      path: DownloadedBoulderDetailsScreen.route.path,
                      name: DownloadedBoulderDetailsScreen.route.name,
                      builder: (context, state) {
                        return RepositoryProvider<RequestStrategy>(
                          create:
                              (context) => RequestStrategy(offlineFirst: true),
                          child: DownloadedBoulderDetailsScreen(
                            id: state.pathParameters['id']!,
                            boulderAreaIri:
                                state.uri.queryParameters['boulderAreaIri'],
                          ),
                        );
                      },
                    ),
                    GoRoute(
                      path: DownloadedBoulderAreaDetailsScreen.route.path,
                      name: DownloadedBoulderAreaDetailsScreen.route.name,
                      builder: (context, state) {
                        return RepositoryProvider<RequestStrategy>(
                          create:
                              (context) => RequestStrategy(offlineFirst: true),
                          child: DownloadedBoulderAreaDetailsScreen(
                            id: state.pathParameters['id']!,
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
  ],
);
