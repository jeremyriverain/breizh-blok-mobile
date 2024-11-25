import 'package:get_it/get_it.dart';
import 'package:mixpanel_flutter/mixpanel_flutter.dart';

class TrackingService {
  void trackPageViewed({required String path}) {
    GetIt.I<Mixpanel>().track(
      'page_viewed',
      properties: {
        'path': path,
      },
    ).ignore();
  }
}
