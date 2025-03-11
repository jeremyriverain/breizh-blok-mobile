import 'package:breizh_blok_mobile/domain/models/boulder/boulder.dart';
import 'package:breizh_blok_mobile/ui/core/widgets/my_map.dart';
import 'package:flutter/material.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

class BoulderDetailsMap extends StatelessWidget {
  const BoulderDetailsMap({required this.boulder, super.key});

  final Boulder boulder;

  @override
  Widget build(BuildContext context) {
    final location = boulder.rock.location;
    return MyMap(
      cameraOptions: CameraOptions(
        zoom: 15,
        center: Point(
          coordinates: Position(location.longitude, location.latitude),
        ),
      ),
      onMapCreated: (mapboxMap) {
        mapboxMap.gestures.updateSettings(
          GesturesSettings(rotateEnabled: true),
        );
      },
    );
  }
}
