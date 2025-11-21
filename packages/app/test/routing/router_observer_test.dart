import 'package:breizh_blok_analytics/breizh_blok_analytics.dart';
import 'package:breizh_blok_mobile/routing/router_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:mocktail/mocktail.dart';

import '../mocks.dart';

void main() {
  late Analytics analytics;

  setUp(() {
    analytics = MockAnalytics();
  });
  group('RouterObserver', () {
    testWidgets('track page viewed when navigate to a new route', (
      tester,
    ) async {
      when(
        () => analytics.trackPageViewed(
          navigationType: any(named: 'navigationType'),
          path: any(named: 'path'),
        ),
      ).thenReturn(() {}());

      final router = GoRouter(
        routes: [
          GoRoute(
            path: '/foo',
            name: 'foo',
            builder: (context, state) => Scaffold(
              appBar: AppBar(title: const Text('foo')),
              body: Column(
                children: [
                  ElevatedButton(
                    child: const Text('go to bar'),
                    onPressed: () async {
                      await context.push('/bar');
                    },
                  ),
                ],
              ),
            ),
          ),
          GoRoute(
            path: '/bar',
            name: 'bar',
            builder: (context, state) => Scaffold(
              appBar: AppBar(title: const Text('bar')),
              body: ElevatedButton(
                child: const Text('return to foo'),
                onPressed: () {
                  context.pop();
                },
              ),
            ),
          ),
        ],
        initialLocation: '/foo',
        observers: [RouterObserver(analytics: analytics)],
      );
      addTearDown(router.dispose);

      await tester.pumpWidget(
        MaterialApp.router(
          routeInformationProvider: router.routeInformationProvider,
          routeInformationParser: router.routeInformationParser,
          routerDelegate: router.routerDelegate,
        ),
      );

      await tester.pumpAndSettle();

      verify(
        () => analytics.trackPageViewed(path: '/foo', navigationType: 'push'),
      ).called(1);

      await tester.tap(find.text('go to bar'));
      await tester.pumpAndSettle();

      verify(
        () => analytics.trackPageViewed(path: '/bar', navigationType: 'push'),
      ).called(1);

      await tester.tap(find.text('return to foo'));
      await tester.pumpAndSettle();

      verify(
        () => analytics.trackPageViewed(path: '/foo', navigationType: 'pop'),
      ).called(1);
    });
  });
}
