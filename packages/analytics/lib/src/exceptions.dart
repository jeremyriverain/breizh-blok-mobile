class AnalyticsException implements Exception {
  const AnalyticsException({
    required this.message,
    required this.stackTrace,
  });

  final String message;
  final StackTrace stackTrace;
}
