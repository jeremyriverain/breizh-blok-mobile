import 'package:breizh_blok_analytics/src/analytics_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mixpanel_flutter/mixpanel_flutter.dart';
import 'package:mocktail/mocktail.dart';

import '../mocks.dart';

void main() {
  group('AnalyticsImpl', () {
    late Mixpanel mixpanel;

    setUp(() {
      mixpanel = MockMixpanel();
    });

    test('mixpanel is called', () {
      when(
        () => mixpanel.track(
          'page_viewed',
          properties: {'path': '/foo', 'navigationType': 'foo'},
        ),
      ).thenAnswer((_) async => () {}());

      AnalyticsImpl(
        mixpanel: mixpanel,
      ).trackPageViewed(path: '/foo', navigationType: 'foo');

      verify(
        () => mixpanel.track(
          'page_viewed',
          properties: {'path': '/foo', 'navigationType': 'foo'},
        ),
      ).called(1);
    });

    test('does not throw error even if mixpanel throws an error', () {
      when(
        () => mixpanel.track(
          'page_viewed',
          properties: {'path': '/foo', 'navigationType': 'foo'},
        ),
      ).thenThrow(Exception('foo'));

      AnalyticsImpl(
        mixpanel: mixpanel,
      ).trackPageViewed(path: '/foo', navigationType: 'foo');

      verify(
        () => mixpanel.track(
          'page_viewed',
          properties: {'path': '/foo', 'navigationType': 'foo'},
        ),
      ).called(1);
    });
  });
}
