import 'dart:async';
import 'package:breizh_blok_mobile/blocs/map_permission_bloc.dart';
import 'package:breizh_blok_mobile/components/map_error_message.dart';
import 'package:breizh_blok_mobile/utils/map_utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:breizh_blok_mobile/components/base_map.dart';
import 'package:breizh_blok_mobile/models/boulder.dart';
import 'package:map_launcher/map_launcher.dart' hide MapType;

class BoulderItemMap extends StatefulWidget {
  final Boulder boulder;

  const BoulderItemMap({
    Key? key,
    required this.boulder,
  }) : super(key: key);

  @override
  State<BoulderItemMap> createState() => BoulderItemMapState();
}

class BoulderItemMapState extends State<BoulderItemMap> {
  final Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    final initialPosition = LatLng(
      widget.boulder.rock.location.latitude,
      widget.boulder.rock.location.longitude,
    );

    final map = FutureBuilder(
        future: Future.wait([
          getMarkerBitmap(kSizeSimpleMarker),
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

          final BitmapDescriptor icon = data[0] as BitmapDescriptor;
          final List<AvailableMap> availableMaps =
              data[1] as List<AvailableMap>;

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
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
              markers: {
                Marker(
                  markerId: MarkerId(widget.boulder.id),
                  position: initialPosition,
                  icon: icon,
                  onTap: () {
                    openMapsSheet(
                      context: context,
                      availableMaps: availableMaps,
                      onMapSelectedFn: showDirections(
                        destination: widget.boulder.rock.location,
                        destinationTitle: widget.boulder.name,
                      ),
                    );
                  },
                ),
              },
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
