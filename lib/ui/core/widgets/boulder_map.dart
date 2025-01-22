import 'dart:async';

import 'package:breizh_blok_mobile/blocs/boulder_filter_bloc.dart';
import 'package:breizh_blok_mobile/blocs/boulder_marker_bloc.dart';
import 'package:breizh_blok_mobile/blocs/map_bloc.dart';
import 'package:breizh_blok_mobile/blocs/map_permission_bloc.dart';
import 'package:breizh_blok_mobile/constants.dart';
import 'package:breizh_blok_mobile/map_marker.dart';
import 'package:breizh_blok_mobile/models/boulder_marker.dart';
import 'package:breizh_blok_mobile/models/request_strategy.dart';
import 'package:breizh_blok_mobile/ui/core/widgets/boulder_map_loading_indicator.dart';
import 'package:breizh_blok_mobile/ui/core/widgets/my_map.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_maps_cluster_manager/google_maps_cluster_manager.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class BoulderMap extends StatefulWidget {
  const BoulderMap({
    super.key,
    this.initialPosition = kDefaultInitialPosition,
    this.initialZoom = 13,
    this.markers = const {},
    this.boulderMarkerBuilder,
  });

  final LatLng initialPosition;
  final double initialZoom;
  final Future<Marker> Function(Cluster<BoulderMarker>)? boulderMarkerBuilder;
  final Set<Marker> markers;

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
      stopClusteringZoom: 100,
      extraPercent: 1,
    );
  }

  void _updateMarkers(Set<Marker> boulderMarkers) {
    if (mounted) {
      setState(() {
        this.boulderMarkers = boulderMarkers;
      });
    }
  }

  Future<Marker> Function(Cluster<BoulderMarker>) get boulderMarkerBuilder =>
      (cluster) async {
        return Marker(
          markerId: MarkerId(cluster.getId()),
          position: cluster.location,
          icon: await MapMarker.getMarkerBitmap(
            cluster.isMultiple ? 125 : 75,
            text: cluster.isMultiple ? cluster.count.toString() : null,
          ),
        );
      };

  @override
  Widget build(BuildContext context) {
    final map = GoogleMap(
      mapToolbarEnabled: false,
      myLocationEnabled: context.read<MapPermissionBloc>().state.hasPermission,
      myLocationButtonEnabled:
          context.read<MapPermissionBloc>().state.hasPermission,
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
        final mapController = await _controller.future;
        final zoom = await mapController.getZoomLevel();

        await mapController.getVisibleRegion().then((visibleRegion) {
          final centerLatLng = LatLng(
            (visibleRegion.northeast.latitude +
                    visibleRegion.southwest.latitude) /
                2,
            (visibleRegion.northeast.longitude +
                    visibleRegion.southwest.longitude) /
                2,
          );

          context.read<MapBloc>().add(
                MapUpdated(
                  mapZoom: zoom,
                  mapLatLng: centerLatLng,
                ),
              );
        });
      },
      onCameraMove: _manager.onCameraMove,
      markers: {
        ...boulderMarkers,
        ...widget.markers,
      },
      gestureRecognizers: const <Factory<OneSequenceGestureRecognizer>>{
        Factory<OneSequenceGestureRecognizer>(
          EagerGestureRecognizer.new,
        ),
      },
    );

    return BlocBuilder<BoulderMarkerBloc, BoulderMarkerState>(
      builder: (context, state) {
        return Stack(
          children: [
            BlocListener<BoulderMarkerBloc, BoulderMarkerState>(
              listenWhen: (previous, current) {
                return previous.markers != current.markers;
              },
              listener: (context, state) {
                _manager.setItems(state.markers);
              },
              child: MyMap(
                map: map,
              ),
            ),
            if (state.isLoading == true) const BoulderMapLoadingIndicator(),
            if (state.error.isNotEmpty)
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: ColoredBox(
                  color: const Color(0xFF333333),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 1),
                            child: Text(
                              AppLocalizations.of(context)
                                  .errorOccuredWhileFetchingBoulders,
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: ElevatedButton(
                            child: const Text('Réessayer'),
                            onPressed: () {
                              context.read<BoulderMarkerBloc>().add(
                                    BoulderMarkerRequested(
                                      filterState: context
                                          .read<BoulderFilterBloc>()
                                          .state,
                                      offlineFirst: context
                                          .read<RequestStrategy>()
                                          .offlineFirst,
                                    ),
                                  );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
