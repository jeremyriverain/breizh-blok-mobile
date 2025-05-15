import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class ImageBoulderCache {
  final cache = CacheManager(
    Config(
      'image_boulder_cache',
      stalePeriod: const Duration(
        days: 365 * 100,
      ),
      maxNrOfCacheObjects: 100000,
    ),
  );
}
