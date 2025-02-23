import 'dart:async';

import 'package:breizh_blok_mobile/blocs/map_permission_bloc.dart';
import 'package:breizh_blok_mobile/domain/models/boulder_area/boulder_area.dart';
import 'package:breizh_blok_mobile/domain/models/location/location.dart';
import 'package:breizh_blok_mobile/domain/models/map/map_marker.dart';
import 'package:breizh_blok_mobile/ui/core/widgets/map_error_message.dart';
import 'package:breizh_blok_mobile/ui/core/widgets/my_map.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MunicipalityDetailsMap extends StatefulWidget {
  const MunicipalityDetailsMap({
    required this.initialPosition,
    super.key,
    this.boulderAreas = const [],
  });

  final List<BoulderArea> boulderAreas;
  final Location initialPosition;

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
        MapMarker.getMarkerBitmap(kSizeSimpleMarker),
      ]),
      builder: (context, AsyncSnapshot<List<Object>> snapshot) {
        if (snapshot.hasError) {
          return const MapErrorMessage();
        }

        final data = snapshot.data;

        if (data == null) {
          return Container();
        }

        final icon = data[0] as BitmapDescriptor;

        return MyMap(
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
                final c = await _controller.future;
                await c.showMarkerInfoWindow(
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
                    snippet: e.nBouldersRated(AppLocalizations.of(context)),
                  ),
                );
              },
            ).toSet(),
            gestureRecognizers: const <Factory<OneSequenceGestureRecognizer>>{
              Factory<OneSequenceGestureRecognizer>(
                EagerGestureRecognizer.new,
              ),
            },
          ),
        );
      },
    );

    return map;
  }
}
