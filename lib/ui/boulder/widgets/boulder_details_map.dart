import 'dart:async';

import 'package:breizh_blok_mobile/blocs/map_permission_bloc.dart';
import 'package:breizh_blok_mobile/domain/models/boulder/boulder.dart';
import 'package:breizh_blok_mobile/domain/models/map/map_directions.dart';
import 'package:breizh_blok_mobile/domain/models/map/map_marker.dart';
import 'package:breizh_blok_mobile/ui/core/widgets/map_error_message.dart';
import 'package:breizh_blok_mobile/ui/core/widgets/my_map.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:map_launcher/map_launcher.dart' hide MapType;

class BoulderDetailsMap extends StatefulWidget {
  const BoulderDetailsMap({
    required this.boulder,
    super.key,
  });

  final Boulder boulder;

  @override
  State<BoulderDetailsMap> createState() => BoulderDetailsMapState();
}

class BoulderDetailsMapState extends State<BoulderDetailsMap> {
  final Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    final initialPosition = LatLng(
      widget.boulder.rock.location.latitude,
      widget.boulder.rock.location.longitude,
    );

    final map = FutureBuilder(
      future: Future.wait([
        MapMarker.getMarkerBitmap(kSizeSimpleMarker),
        MapLauncher.installedMaps,
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
        final availableMaps = data[1] as List<AvailableMap>;

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
            onMapCreated: _controller.complete,
            markers: {
              Marker(
                markerId: MarkerId(widget.boulder.id),
                position: initialPosition,
                icon: icon,
                onTap: () {
                  MapDirections.openMapsSheet(
                    context: context,
                    availableMaps: availableMaps,
                    onMapSelectedFn: MapDirections.showDirections(
                      destination: widget.boulder.rock.location,
                      destinationTitle: widget.boulder.name,
                    ),
                  );
                },
              ),
            },
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
