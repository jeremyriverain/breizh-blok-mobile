import 'package:breizh_blok_mobile/services/tracking/tracking_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

class RouterObserver extends NavigatorObserver {
  String get location {
    final lastMatch =
        GetIt.I<GoRouter>().routerDelegate.currentConfiguration.last;
    final matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : GetIt.I<GoRouter>().routerDelegate.currentConfiguration;
    final location = matchList.uri.toString();
    return location;
  }

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);

    debugPrint('didPush');
    debugPrint(location);

    GetIt.I<TrackingService>().trackPageViewed(
      path: location,
      navigationType: 'push',
    );
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);

    debugPrint('didPop');
    debugPrint(location);

    GetIt.I<TrackingService>().trackPageViewed(
      path: location,
      navigationType: 'pop',
    );
  }
}
