import 'package:breizh_blok_mobile/data/data_sources/api/model/request_strategy.dart';
import 'package:breizh_blok_mobile/routing/router_observer.dart';
import 'package:breizh_blok_mobile/ui/boulder/widgets/boulder_details_screen.dart';
import 'package:breizh_blok_mobile/ui/boulder/widgets/boulder_list_screen.dart';
import 'package:breizh_blok_mobile/ui/boulder_area/widgets/boulder_area_details_screen.dart';
import 'package:breizh_blok_mobile/ui/download/widgets/download_screen.dart';
import 'package:breizh_blok_mobile/ui/download/widgets/downloaded_boulder_area_details_screen.dart';
import 'package:breizh_blok_mobile/ui/download/widgets/downloaded_boulder_details_screen.dart';
import 'package:breizh_blok_mobile/ui/municipality/widgets/municipality_details_screen.dart';
import 'package:breizh_blok_mobile/ui/profile/widgets/profile_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class Router {
  GoRouter call() {
    return GoRouter(
      routes: [
        GoRoute(
          path: BoulderListScreen.route.path,
          name: BoulderListScreen.route.name,
          builder:
              (context, state) => RepositoryProvider(
                create: (context) => RequestStrategy(),
                child: const BoulderListScreen(),
              ),
          routes: [
            GoRoute(
              path: BoulderDetailsScreen.route.path,
              name: BoulderDetailsScreen.route.name,
              builder: (context, state) {
                return RepositoryProvider(
                  create: (context) => RequestStrategy(),
                  child: BoulderDetailsScreen(id: state.pathParameters['id']!),
                );
              },
            ),
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
            ),
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
            ),
          ],
        ),
        GoRoute(
          path: DownloadedBoulderDetailsScreen.route.path,
          name: DownloadedBoulderDetailsScreen.route.name,
          builder: (context, state) {
            return RepositoryProvider<RequestStrategy>(
              create: (context) => RequestStrategy(offlineFirst: true),
              child: DownloadedBoulderDetailsScreen(
                id: state.pathParameters['id']!,
                boulderAreaIri: state.uri.queryParameters['boulderAreaIri'],
              ),
            );
          },
        ),
        GoRoute(
          path: DownloadedBoulderAreaDetailsScreen.route.path,
          name: DownloadedBoulderAreaDetailsScreen.route.name,
          builder: (context, state) {
            return RepositoryProvider<RequestStrategy>(
              create: (context) => RequestStrategy(offlineFirst: true),
              child: DownloadedBoulderAreaDetailsScreen(
                id: state.pathParameters['id']!,
              ),
            );
          },
        ),
        GoRoute(
          path: ProfileScreen.route.path,
          name: ProfileScreen.route.name,
          builder: (context, state) {
            return RepositoryProvider(
              create: (context) => RequestStrategy(),
              child: const ProfileScreen(),
            );
          },
        ),
        GoRoute(
          path: DownloadScreen.route.path,
          name: DownloadScreen.route.name,
          builder: (context, state) {
            return RepositoryProvider(
              create: (context) => RequestStrategy(),
              child: const DownloadScreen(),
            );
          },
        ),
      ],
      initialLocation: BoulderListScreen.route.path,
      observers: [RouterObserver()],
    );
  }
}
