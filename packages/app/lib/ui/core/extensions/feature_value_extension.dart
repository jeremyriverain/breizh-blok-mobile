import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

extension FeatureExtensionValueExtension on FeatureExtensionValue {
  Set<String> extractIDs() {
    return featureCollection
            ?.map(
              (f) => (f?['properties'] as Map<Object?, Object?>?)?['id']
                  .toString(),
            )
            .whereType<String>()
            .toSet() ??
        <String>{};
  }
}
