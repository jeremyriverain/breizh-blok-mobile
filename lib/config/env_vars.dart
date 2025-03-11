class EnvVars {
  static String get apiHost => const String.fromEnvironment('API_HOST');
  static String get mapboxToken => const String.fromEnvironment('MAPBOX_TOKEN');
  static String get mixPanelToken =>
      const String.fromEnvironment('MIX_PANEL_TOKEN');

  static String get sentryDsn => const String.fromEnvironment('SENTRY_DSN');
}
