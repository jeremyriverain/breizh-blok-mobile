// import 'dart:typed_data';
// import 'dart:ui' as ui;

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class MyMap extends StatelessWidget {
  const MyMap({super.key, this.cameraOptions, this.onMapCreated});

  final CameraOptions? cameraOptions;
  final void Function(MapboxMap)? onMapCreated;

  @override
  Widget build(BuildContext context) {
    return MapWidget(
      styleUri: MapboxStyles.STANDARD_SATELLITE,
      cameraOptions: cameraOptions,
      gestureRecognizers: const {
        Factory<EagerGestureRecognizer>(EagerGestureRecognizer.new),
      },
      onMapCreated: (mapboxMap) async {
        try {
          await mapboxMap.style.setStyleImportConfigProperties('basemap', {
            'showPedestrianRoads': true,
            'showRoadLabels': true,
            'showPlaceLabels': true,
          });
          onMapCreated?.call(mapboxMap);
        } catch (exception, stackTrace) {
          await Sentry.captureException(exception, stackTrace: stackTrace);
        }
      },
    );
  }
}

class MapMarker {}
