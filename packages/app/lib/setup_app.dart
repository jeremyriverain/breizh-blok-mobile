import 'package:breizh_blok_mobile/config/env.dart';
import 'package:breizh_blok_mobile/services/tracking/tracking_service.dart';
import 'package:get_it/get_it.dart';
import 'package:mixpanel_flutter/mixpanel_flutter.dart';

Future<void> setupApp({
  Mixpanel? mixpanel,
}) async {
  GetIt.I.registerSingleton<Mixpanel>(
    mixpanel ??
        await Mixpanel.init(Env.mixPanelToken, trackAutomaticEvents: true),
  );

  GetIt.I.registerSingleton<TrackingService>(TrackingService());
}
