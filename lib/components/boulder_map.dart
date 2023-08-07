import 'dart:async';

import 'package:breizh_blok_mobile/blocs/boulder_filter_bloc.dart';
import 'package:breizh_blok_mobile/blocs/boulder_marker_bloc.dart';
import 'package:breizh_blok_mobile/blocs/boulder_order_bloc.dart';
import 'package:breizh_blok_mobile/blocs/map_bloc.dart';
import 'package:breizh_blok_mobile/components/base_map.dart';
import 'package:breizh_blok_mobile/components/error_indicator.dart';
import 'package:breizh_blok_mobile/components/map_loading_indicator.dart';
import 'package:breizh_blok_mobile/utils/map_utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_cluster_manager/google_maps_cluster_manager.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:breizh_blok_mobile/models/boulder_marker.dart';

class BoulderMap extends StatefulWidget {
  final LatLng initialPosition;
  final double initialZoom;
  final Future<Marker> Function(Cluster<BoulderMarker>)? boulderMarkerBuilder;
  final Set<Marker> markers;

  const BoulderMap({
    Key? key,
    this.initialPosition = kDefaultInitialPosition,
    this.initialZoom = 13,
    this.markers = const {},
    this.boulderMarkerBuilder,
  }) : super(key: key);

  @override
  State<BoulderMap> createState() => _BoulderMapState();
}

class _BoulderMapState extends State<BoulderMap> {
  final Completer<GoogleMapController> _controller = Completer();

  late ClusterManager _manager;
  Set<Marker> boulderMarkers = {};

  @override
  void initState() {
    _manager = _initClusterManager();
    super.initState();
  }

  ClusterManager _initClusterManager() {
    return ClusterManager<BoulderMarker>(
      context.read<BoulderMarkerBloc>().state.markers,
      _updateMarkers,
      markerBuilder: widget.boulderMarkerBuilder ?? boulderMarkerBuilder,
      stopClusteringZoom: 100.0,
      extraPercent: 1,
    );
  }

  void _updateMarkers(Set<Marker> boulderMarkers) {
    setState(() {
      this.boulderMarkers = boulderMarkers;
    });
  }

  Future<Marker> Function(Cluster<BoulderMarker>) get boulderMarkerBuilder =>
      (cluster) async {
        return Marker(
          markerId: MarkerId(cluster.getId()),
          position: cluster.location,
          icon: await getMarkerBitmap(cluster.isMultiple ? 125 : 75,
              text: cluster.isMultiple ? cluster.count.toString() : null),
        );
      };

  @override
  Widget build(BuildContext context) {
    final GoogleMap map = GoogleMap(
      mapToolbarEnabled: false,
      myLocationEnabled: true,
      myLocationButtonEnabled: true,
      mapType: MapType.hybrid,
      initialCameraPosition: CameraPosition(
        target: widget.initialPosition,
        zoom: widget.initialZoom,
      ),
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
        _manager.setMapId(controller.mapId);
      },
      onCameraIdle: () async {
        _manager.updateMap();
        final GoogleMapController mapController = await _controller.future;
        final double zoom = await mapController.getZoomLevel();

        LatLngBounds visibleRegion = await mapController.getVisibleRegion();
        LatLng centerLatLng = LatLng(
          (visibleRegion.northeast.latitude +
                  visibleRegion.southwest.latitude) /
              2,
          (visibleRegion.northeast.longitude +
                  visibleRegion.southwest.longitude) /
              2,
        );

        if (!mounted) return;
        context.read<MapBloc>().add(
              MapUpdated(
                mapZoom: zoom,
                mapLatLng: centerLatLng,
              ),
            );
      },
      onCameraMove: _manager.onCameraMove,
      markers: {
        ...boulderMarkers,
        ...widget.markers,
      },
      gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>{
        Factory<OneSequenceGestureRecognizer>(
          () => EagerGestureRecognizer(),
        ),
      },
    );

    return BlocBuilder<BoulderMarkerBloc, BoulderMarkerState>(
      builder: (context, state) {
        if (state.error.isNotEmpty) {
          return ErrorIndicator(
            error: state.error,
            onTryAgain: () {
              context.read<BoulderMarkerBloc>().add(
                    BoulderMarkerRequested(
                      filterState: context.read<BoulderFilterBloc>().state,
                      orderQueryParam: context.read<BoulderOrderBloc>().state,
                    ),
                  );
            },
          );
        }
        return Stack(
          children: [
            BlocListener<BoulderMarkerBloc, BoulderMarkerState>(
              listenWhen: (previous, current) {
                return previous.markers != current.markers;
              },
              listener: (context, state) {
                _manager.setItems(state.markers);
              },
              child: BaseMap(
                map: map,
              ),
            ),
            if (state.isLoading == true) const MapLoadingIndicator(),
          ],
        );
      },
    );
  }
}
