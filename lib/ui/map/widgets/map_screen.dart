import 'package:breizh_blok_mobile/domain/models/location/location.dart';
import 'package:breizh_blok_mobile/ui/core/widgets/my_map.dart';
import 'package:flutter/material.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  static const route = (name: 'map', path: '/map');

  @override
  Widget build(BuildContext context) {
    return MyMap(
      cameraOptions: CameraOptions(
        zoom: 6,
        center: Point(
          coordinates: Position(kDefaultLongitude, kDefaultLatitude),
        ),
      ),
    );
  }
}
