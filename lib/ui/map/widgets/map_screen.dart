import 'package:breizh_blok_mobile/blocs/map_bloc.dart';
import 'package:breizh_blok_mobile/map_marker.dart';
import 'package:breizh_blok_mobile/ui/core/widgets/boulder_map.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BoulderMap(
      initialZoom: context.read<MapBloc>().state.mapZoom,
      initialPosition: context.read<MapBloc>().state.mapLatLng,
      boulderMarkerBuilder: MapMarker.markerBuilderFactory(
        context,
      ),
    );
  }
}
