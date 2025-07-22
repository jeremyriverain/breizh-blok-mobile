import 'package:breizh_blok_mobile/services/tracking/tracking_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mixpanel_flutter/mixpanel_flutter.dart';
import 'package:mocktail/mocktail.dart';

import '../../mocks.dart';

void main() {
  late Mixpanel mixpanel;
  setUp(() async {
    await GetIt.I.reset();

    mixpanel = MockMixpanel();
    GetIt.I.registerSingleton<Mixpanel>(mixpanel);
  });
  test('call mixpanel track API when trackPageViewed is called', () async {
    when(
      () => mixpanel.track(
        'page_viewed',
        properties: {'path': '/foo', 'navigationType': 'foo'},
      ),
    ).thenAnswer((_) async => () {}());

    TrackingService().trackPageViewed(path: '/foo', navigationType: 'foo');
    verify(
      () => mixpanel.track(
        'page_viewed',
        properties: {'path': '/foo', 'navigationType': 'foo'},
      ),
    ).called(1);
  });

  test(
    'does not throw exception even if mixpanel throws an exception',
    () async {
      when(
        () => mixpanel.track(
          'page_viewed',
          properties: {'path': '/foo', 'navigationType': 'foo'},
        ),
      ).thenAnswer((_) async {
        throw Exception('foo');
      });

      expect(
        () async => TrackingService().trackPageViewed(
          path: '/foo',
          navigationType: 'foo',
        ),
        returnsNormally,
      );

      verify(
        () => mixpanel.track(
          'page_viewed',
          properties: {'path': '/foo', 'navigationType': 'foo'},
        ),
      ).called(1);
    },
  );
}
