import 'package:breizh_blok_mobile/blocs/map_bloc.dart';
import 'package:breizh_blok_mobile/components/boulder_map.dart';
import 'package:breizh_blok_mobile/components/map_error_message.dart';
import 'package:breizh_blok_mobile/components/map_launcher_button.dart';
import 'package:breizh_blok_mobile/models/boulder_area.dart';
import 'package:breizh_blok_mobile/models/location.dart';
import 'package:breizh_blok_mobile/models/request_strategy.dart';
import 'package:breizh_blok_mobile/utils/map_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:map_launcher/map_launcher.dart';

class BoulderAreaDetailsMapTab extends StatelessWidget {
  BoulderAreaDetailsMapTab({
    required this.boulderArea,
    super.key,
  }) : location = boulderArea.resolveLocation();

  final BoulderArea boulderArea;
  final Location location;

  @override
  Widget build(BuildContext context) {
    final parkingLocation = boulderArea.parkingLocation;

    return Column(
      children: [
        Expanded(
          child: FutureBuilder(
            future: Future.wait([
              getMarkerIconFromAsset(path: kParkingIcon),
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

              return BoulderMap(
                initialPosition: context.watch<MapBloc>().state.mapLatLng,
                initialZoom: context.watch<MapBloc>().state.mapZoom,
                boulderMarkerBuilder: markerBuilderFactory(
                  context,
                  offlineFirst: context.read<RequestStrategy>().offlineFirst,
                  boulderArea: boulderArea,
                ),
                markers: parkingLocation == null
                    ? {}
                    : {
                        Marker(
                          markerId: MarkerId('${boulderArea.iri}-parking'),
                          position: LatLng(
                            parkingLocation.latitude,
                            parkingLocation.longitude,
                          ),
                          icon: icon,
                          onTap: () {
                            openMapsSheet(
                              context: context,
                              availableMaps: availableMaps,
                              onMapSelectedFn: showDirections(
                                destination: parkingLocation,
                                destinationTitle:
                                    'Parking du secteur ${boulderArea.name}',
                              ),
                            );
                          },
                        ),
                      },
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: MapLauncherButton(
            destination: location,
            destinationTitle: parkingLocation != null
                ? 'Parking du secteur ${boulderArea.name}'
                : 'Secteur ${boulderArea.name}',
            labelButton:
                // ignore: lines_longer_than_80_chars
                'Itinéraire vers le ${parkingLocation != null ? 'parking' : 'secteur'}',
          ),
        ),
      ],
    );
  }
}
