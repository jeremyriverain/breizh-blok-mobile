import 'package:mixpanel_flutter/mixpanel_flutter.dart';

class TrackingService {
  TrackingService({required this.mixpanel});

  final Mixpanel mixpanel;

  void trackPageViewed({
    required String path,
    required String navigationType,
  }) {
    mixpanel
        .track(
          'page_viewed',
          properties: {
            'path': path,
            'navigationType': navigationType,
          },
        )
        .ignore();
  }
}
