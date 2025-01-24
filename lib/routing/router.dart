import 'package:breizh_blok_mobile/data/data_sources/api/model/request_strategy.dart';
import 'package:breizh_blok_mobile/routing/router_observer.dart';
import 'package:breizh_blok_mobile/ui/boulder/widgets/boulder_details_screen.dart';
import 'package:breizh_blok_mobile/ui/boulder/widgets/boulder_list_screen.dart';
import 'package:breizh_blok_mobile/ui/boulder_area/widgets/boulder_area_details_screen.dart';
import 'package:breizh_blok_mobile/ui/download/widgets/download_screen.dart';
import 'package:breizh_blok_mobile/ui/municipality/widgets/municipality_details_screen.dart';
import 'package:breizh_blok_mobile/ui/profile/widgets/profile_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class Router {
  GoRouter call() {
    return GoRouter(
      routes: [
        GoRoute(
          path: '/',
          name: 'boulder_list',
          builder: (context, state) => RepositoryProvider(
            create: (context) => RequestStrategy(),
            child: const BoulderListScreen(),
          ),
          routes: [
            GoRoute(
              path: 'boulders/:id',
              name: 'boulder_details',
              builder: (context, state) {
                return RepositoryProvider(
                  create: (context) => RequestStrategy(),
                  child: BoulderDetailsScreen(id: state.pathParameters['id']!),
                );
              },
            ),
            GoRoute(
              path: 'boulder-areas/:id',
              name: 'boulder_area_details',
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
              path: 'municipalities/:id',
              name: 'municipality_details',
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
          path: '/downloads/boulders/:id',
          name: 'downloaded_boulder_details',
          builder: (context, state) {
            return RepositoryProvider<RequestStrategy>(
              create: (context) => RequestStrategy(offlineFirst: true),
              child: BoulderDetailsScreen(
                id: state.pathParameters['id']!,
                boulderAreaIri: state.uri.queryParameters['boulderAreaIri'],
              ),
            );
          },
        ),
        GoRoute(
          path: '/downloads/boulders-area/:id',
          name: 'downloaded_boulder_area_details',
          builder: (context, state) {
            return RepositoryProvider<RequestStrategy>(
              create: (context) => RequestStrategy(offlineFirst: true),
              child: BoulderAreaDetailsScreen(
                id: state.pathParameters['id']!,
              ),
            );
          },
        ),
        GoRoute(
          path: '/profile',
          name: 'profile',
          builder: (context, state) {
            return RepositoryProvider(
              create: (context) => RequestStrategy(),
              child: const ProfileScreen(),
            );
          },
        ),
        GoRoute(
          path: '/downloads',
          name: 'downloads',
          builder: (context, state) {
            return RepositoryProvider(
              create: (context) => RequestStrategy(),
              child: const DownloadScreen(),
            );
          },
        ),
      ],
      initialLocation: '/',
      observers: [RouterObserver()],
    );
  }
}
