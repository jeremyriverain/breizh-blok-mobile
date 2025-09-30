import 'package:breizh_blok_analytics/src/analytics.dart';
import 'package:breizh_blok_analytics/src/exceptions.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mixpanel_flutter/mixpanel_flutter.dart';

class AnalyticsImpl implements Analytics {
  AnalyticsImpl({required this.mixpanel});

  final Mixpanel mixpanel;

  @override
  void trackPageViewed({
    required String path,
    required String navigationType,
  }) {
    return TaskEither.tryCatch(
      () {
        return mixpanel.track(
          'page_viewed',
          properties: {
            'path': path,
            'navigationType': navigationType,
          },
        );
      },
      (exception, stackTrace) {
        return AnalyticsException(
          message: exception.toString(),
          stackTrace: stackTrace,
        );
      },
    ).run().ignore();
  }
}
