import 'dart:async';
import 'package:breizh_blok_mobile/blocs/map_permission_bloc.dart';
import 'package:breizh_blok_mobile/components/map_error_message.dart';
import 'package:breizh_blok_mobile/models/boulder_area.dart';
import 'package:breizh_blok_mobile/models/location.dart';
import 'package:breizh_blok_mobile/utils/map_utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:breizh_blok_mobile/components/base_map.dart';

class MunicipalityDetailsMap extends StatefulWidget {
  final List<BoulderArea> boulderAreas;
  final Location initialPosition;

  const MunicipalityDetailsMap({
    Key? key,
    required this.initialPosition,
    this.boulderAreas = const [],
  }) : super(key: key);

  @override
  State<MunicipalityDetailsMap> createState() => MunicipalityDetailsMapState();
}

class MunicipalityDetailsMapState extends State<MunicipalityDetailsMap> {
  final Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    final initialPosition = LatLng(
      widget.initialPosition.latitude,
      widget.initialPosition.longitude,
    );

    final map = FutureBuilder(
        future: Future.wait([
          getMarkerBitmap(kSizeSimpleMarker),
        ]),
        builder: (context, AsyncSnapshot<List<Object>> snapshot) {
          if (snapshot.hasError) {
            return const MapErrorMessage();
          }

          final data = snapshot.data;

          if (data == null) {
            return Container();
          }

          final BitmapDescriptor icon = data[0] as BitmapDescriptor;

          return BaseMap(
            map: GoogleMap(
              mapToolbarEnabled: false,
              myLocationEnabled:
                  context.read<MapPermissionBloc>().state.hasPermission,
              myLocationButtonEnabled:
                  context.read<MapPermissionBloc>().state.hasPermission,
              mapType: MapType.hybrid,
              initialCameraPosition: CameraPosition(
                target: initialPosition,
                zoom: 10,
              ),
              onMapCreated: (GoogleMapController controller) async {
                _controller.complete(controller);
                if (widget.boulderAreas.isNotEmpty) {
                  final GoogleMapController c = await _controller.future;
                  c.showMarkerInfoWindow(
                    MarkerId(
                      widget.boulderAreas.last.iri,
                    ),
                  );
                }
              },
              markers: widget.boulderAreas.map(
                (e) {
                  final location = e.resolveLocation();
                  return Marker(
                    markerId: MarkerId(e.iri),
                    position: LatLng(location.latitude, location.longitude),
                    icon: icon,
                    infoWindow: InfoWindow(
                      title: e.name,
                      snippet: e.computeStatsAsString(),
                    ),
                  );
                },
              ).toSet(),
              gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>{
                Factory<OneSequenceGestureRecognizer>(
                  () => EagerGestureRecognizer(),
                ),
              },
            ),
          );
        });

    return map;
  }
}
