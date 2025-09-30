import 'package:breizh_blok_analytics/src/analytics.dart';
import 'package:breizh_blok_analytics/src/analytics_impl.dart';
import 'package:mixpanel_flutter/mixpanel_flutter.dart';

export 'package:breizh_blok_analytics/src/analytics.dart';
export 'package:breizh_blok_analytics/src/exceptions.dart';

abstract class BreizhBlokAnalytics {
  static Future<Analytics> createAnalytics({
    required String token,
  }) async {
    return AnalyticsImpl(
      mixpanel: await Mixpanel.init(token, trackAutomaticEvents: true),
    );
  }
}
