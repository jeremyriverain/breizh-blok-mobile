import 'package:breizh_blok_mobile/routing/router_observer.dart';
import 'package:breizh_blok_mobile/services/tracking/tracking_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:mixpanel_flutter/mixpanel_flutter.dart';
import 'package:mocktail/mocktail.dart';

import '../mocks.dart';

void main() {
  late Mixpanel mixpanel;

  setUp(() {
    mixpanel = MockMixpanel();
  });
  group('RouterObserver', () {
    testWidgets('track page viewed when navigate to a new route', (
      tester,
    ) async {
      when(
        () =>
            mixpanel.track('page_viewed', properties: any(named: 'properties')),
      ).thenAnswer((_) async => () {}());

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
                    onPressed: () {
                      context.push('/bar');
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
        observers: [RouterObserver()],
      );
      addTearDown(router.dispose);

      GetIt.I.registerSingleton<TrackingService>(TrackingService());
      GetIt.I.registerSingleton<Mixpanel>(mixpanel);
      GetIt.I.registerSingleton<GoRouter>(router);
      await tester.pumpWidget(
        MaterialApp.router(
          routeInformationProvider: router.routeInformationProvider,
          routeInformationParser: router.routeInformationParser,
          routerDelegate: router.routerDelegate,
        ),
      );

      await tester.pumpAndSettle();

      verify(
        () => mixpanel.track(
          'page_viewed',
          properties: {'path': '/foo', 'navigationType': 'push'},
        ),
      ).called(1);

      await tester.tap(find.text('go to bar'));
      await tester.pumpAndSettle();

      verify(
        () => mixpanel.track(
          'page_viewed',
          properties: {'path': '/bar', 'navigationType': 'push'},
        ),
      ).called(1);

      await tester.tap(find.text('return to foo'));
      await tester.pumpAndSettle();

      verify(
        () => mixpanel.track(
          'page_viewed',
          properties: {'path': '/foo', 'navigationType': 'pop'},
        ),
      ).called(1);
    });
  });
}
