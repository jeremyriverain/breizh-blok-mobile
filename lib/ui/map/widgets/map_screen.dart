import 'package:flutter/material.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  static const route = (name: 'map', path: '/map');

  @override
  Widget build(BuildContext context) {
    return const MapWidget();
  }
}
