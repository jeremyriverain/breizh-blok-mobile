import 'package:breizh_blok_mobile/blocs/map_bloc.dart';
import 'package:breizh_blok_mobile/components/boulder_map.dart';
import 'package:breizh_blok_mobile/utils/map_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeMapView extends StatefulWidget {
  const HomeMapView({Key? key}) : super(key: key);

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
    return BoulderMap(
      initialZoom: context.read<MapBloc>().state.mapZoom,
      initialPosition: context.read<MapBloc>().state.mapLatLng,
      boulderMarkerBuilder: markerBuilderFactory(
        context,
      ),
    );
  }
}
