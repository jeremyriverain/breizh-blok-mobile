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

  // _onMapCreated(MapboxMap mapboxMap) async {
  //   final pointAnnotationManager =
  //       await mapboxMap.annotations.createPointAnnotationManager();

  //   // Load the image from assets
  //   final imageData = await getMarkerBitmap(25);

  //   // Create a PointAnnotationOptions
  //   final pointAnnotationOptions = PointAnnotationOptions(
  //     geometry: Point(
  //       coordinates: Position(-74.00913, 40.75183),
  //     ), // Example coordinates
  //     image: imageData,
  //     iconSize: 3,
  //   );

  //   // Add the annotation to the map
  //   await pointAnnotationManager.create(pointAnnotationOptions);
  // }

  // Future<Uint8List> getMarkerBitmap(int size, {String? text}) async {
  //   final pictureRecorder = ui.PictureRecorder();
  //   final canvas = Canvas(pictureRecorder);
  //   final paint1 = Paint()..color = Colors.lightGreen;
  //   final paint2 = Paint()..color = Colors.white;

  //   canvas
  //     ..drawCircle(Offset(size / 2, size / 2), size / 2.0, paint1)
  //     ..drawCircle(Offset(size / 2, size / 2), size / 2.2, paint2)
  //     ..drawCircle(Offset(size / 2, size / 2), size / 2.8, paint1);

  //   if (text != null) {
  //     final painter =
  //         TextPainter(textDirection: TextDirection.ltr)
  //           ..text = TextSpan(
  //             text: text,
  //             style: TextStyle(
  //               fontSize: size / 3,
  //               color: Colors.white,
  //               fontWeight: FontWeight.normal,
  //             ),
  //           )
  //           ..layout();
  //     painter.paint(
  //       canvas,
  //       Offset(size / 2 - painter.width / 2, size / 2 - painter.height / 2),
  //     );
  //   }

  //   final img = await pictureRecorder.endRecording().toImage(size, size);
  //   final data = await img.toByteData(format: ui.ImageByteFormat.png);
  //   return data!.buffer.asUint8List();
  // }
}

class MapMarker {}
