import 'package:breizh_blok_mobile/models/request_strategy.dart';
import 'package:breizh_blok_mobile/navigation/app_router_observer.dart';
import 'package:breizh_blok_mobile/ui/views/boulder_area_details_view.dart';
import 'package:breizh_blok_mobile/ui/views/boulder_details_view.dart';
import 'package:breizh_blok_mobile/ui/views/download_view.dart';
import 'package:breizh_blok_mobile/ui/views/home_view.dart';
import 'package:breizh_blok_mobile/ui/views/municipality_details_view.dart';
import 'package:breizh_blok_mobile/ui/views/profile_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  GoRouter call() {
    return GoRouter(
      routes: [
        GoRoute(
          path: '/',
          name: 'boulder_list',
          builder: (context, state) => RepositoryProvider(
            create: (context) => RequestStrategy(),
            child: const HomeView(),
          ),
          routes: [
            GoRoute(
              path: 'boulders/:id',
              name: 'boulder_details',
              builder: (context, state) {
                return RepositoryProvider(
                  create: (context) => RequestStrategy(),
                  child: BoulderDetailsView(id: state.pathParameters['id']!),
                );
              },
            ),
            GoRoute(
              path: 'boulder-areas/:id',
              name: 'boulder_area_details',
              builder: (context, state) {
                return RepositoryProvider(
                  create: (context) => RequestStrategy(),
                  child: BoulderAreaDetailsView(
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
                  child: MunicipalityDetailsView(
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
              child: BoulderDetailsView(
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
              child: BoulderAreaDetailsView(
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
              child: const ProfileView(),
            );
          },
        ),
        GoRoute(
          path: '/downloads',
          name: 'downloads',
          builder: (context, state) {
            return RepositoryProvider(
              create: (context) => RequestStrategy(),
              child: const DownloadView(),
            );
          },
        ),
      ],
      initialLocation: '/',
      observers: [AppRouterObserver()],
    );
  }
}
