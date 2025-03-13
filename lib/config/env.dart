import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env.local', useConstantCase: true)
abstract class Env {
  @EnviedField(varName: 'API_HOST', useConstantCase: true)
  static const String apiHost = _Env.apiHost;

  @EnviedField(
    varName: 'SENTRY_DSN',
    optional: true,
    defaultValue: '',
    obfuscate: true,
  )
  static String sentryDsn = _Env.sentryDsn;

  @EnviedField(varName: 'MIX_PANEL_TOKEN', obfuscate: true)
  static String mixPanelToken = _Env.mixPanelToken;

  @EnviedField(varName: 'MAPBOX_TOKEN', obfuscate: true)
  static String mapboxToken = _Env.mapboxToken;
}
