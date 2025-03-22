import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env', environment: true, useConstantCase: true)
abstract class Env {
  @EnviedField(varName: 'API_HOST')
  static const String apiHost = _Env.apiHost;

  @EnviedField(varName: 'SENTRY_DSN')
  static const String sentryDsn = _Env.sentryDsn;

  @EnviedField(varName: 'MIX_PANEL_TOKEN')
  static const String mixPanelToken = _Env.mixPanelToken;

  @EnviedField(varName: 'MAPBOX_TOKEN')
  static const String mapboxToken = _Env.mapboxToken;
}
