import 'package:breizh_blok_analytics/breizh_blok_analytics.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RouterObserver extends NavigatorObserver {
  RouterObserver({required this.analytics});

  final Analytics analytics;

  String? get location {
    final context = navigator?.context;

    if (context == null || !context.mounted) {
      return null;
    }

    final lastMatch = GoRouter.of(
      context,
    ).routerDelegate.currentConfiguration.last;
    final matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : GoRouter.of(context).routerDelegate.currentConfiguration;
    final location = matchList.uri.toString();
    return location;
  }

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);

    final path = location;

    debugPrint('didPush');
    debugPrint(path);

    if (path == null) {
      return;
    }

    analytics.trackPageViewed(
      path: path,
      navigationType: 'push',
    );
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);

    final path = location;

    debugPrint('didPop');
    debugPrint(path);

    if (path == null) {
      return;
    }

    analytics.trackPageViewed(
      path: path,
      navigationType: 'pop',
    );
  }
}
