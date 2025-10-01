import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env', environment: true, useConstantCase: true)
abstract class Env {
  @EnviedField(varName: 'API_HOST')
  static const String apiHost = _Env.apiHost;

  @EnviedField(
    varName: 'API_PORT',
  )
  static const int apiPort = _Env.apiPort;

  @EnviedField(varName: 'SENTRY_DSN')
  static const String sentryDsn = _Env.sentryDsn;

  @EnviedField(varName: 'MIX_PANEL_TOKEN')
  static const String mixPanelToken = _Env.mixPanelToken;

  @EnviedField(varName: 'MAPBOX_TOKEN')
  static const String mapboxToken = _Env.mapboxToken;

  @EnviedField(varName: 'AUTH0_CLIENT_ID')
  static const String auth0ClientId = _Env.auth0ClientId;

  @EnviedField(varName: 'AUTH0_AUDIENCE')
  static const String auth0Audience = _Env.auth0Audience;
}
