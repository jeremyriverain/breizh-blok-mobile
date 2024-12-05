import 'package:breizh_blok_mobile/blocs/map_bloc.dart';
import 'package:breizh_blok_mobile/map_marker.dart';
import 'package:breizh_blok_mobile/ui/widgets/bb_boulder_map.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeMapView extends StatefulWidget {
  const HomeMapView({super.key});

  @override
  State<HomeMapView> createState() => _HomeMapViewState();
}

class _HomeMapViewState extends State<HomeMapView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BbBoulderMap(
      initialZoom: context.read<MapBloc>().state.mapZoom,
      initialPosition: context.read<MapBloc>().state.mapLatLng,
      boulderMarkerBuilder: MapMarker.markerBuilderFactory(
        context,
      ),
    );
  }
}
