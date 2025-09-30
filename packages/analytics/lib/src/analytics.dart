abstract interface class Analytics {
  void trackPageViewed({
    required String path,
    required String navigationType,
  });
}
