import 'package:breizh_blok_mobile/tracking_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mixpanel_flutter/mixpanel_flutter.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([
  MockSpec<Mixpanel>(),
])
import './tracking_service_test.mocks.dart';

void main() {
  late Mixpanel mockMixpanel;
  setUp(() async {
    await GetIt.I.reset();

    mockMixpanel = MockMixpanel();
    GetIt.I.registerSingleton<Mixpanel>(mockMixpanel);
  });
  test('call mixpanel track API when trackPageViewed is called', () async {
    TrackingService().trackPageViewed(path: '/foo');
    verify(
      mockMixpanel.track(
        'page_viewed',
        properties: {
          'path': '/foo',
        },
      ),
    ).called(1);
  });

  test('does not throw exception even if mixpanel throws an exception',
      () async {
    when(
      mockMixpanel.track(
        'page_viewed',
        properties: {
          'path': '/foo',
        },
      ),
    ).thenAnswer((_) async {
      throw Exception('foo');
    });

    expect(
      () async => TrackingService().trackPageViewed(path: '/foo'),
      returnsNormally,
    );

    verify(
      mockMixpanel.track(
        'page_viewed',
        properties: {
          'path': '/foo',
        },
      ),
    ).called(1);
  });
}
