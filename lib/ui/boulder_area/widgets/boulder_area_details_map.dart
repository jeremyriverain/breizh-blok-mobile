import 'package:breizh_blok_mobile/blocs/map_bloc.dart';
import 'package:breizh_blok_mobile/config/assets.dart';
import 'package:breizh_blok_mobile/data/data_sources/api/model/request_strategy.dart';
import 'package:breizh_blok_mobile/domain/models/boulder_area/boulder_area.dart';
import 'package:breizh_blok_mobile/domain/models/location/location.dart';
import 'package:breizh_blok_mobile/domain/models/map/map_directions.dart';
import 'package:breizh_blok_mobile/domain/models/map/map_marker.dart';
import 'package:breizh_blok_mobile/ui/core/widgets/boulder_map.dart';
import 'package:breizh_blok_mobile/ui/core/widgets/map_error_message.dart';
import 'package:breizh_blok_mobile/ui/core/widgets/map_launcher_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:map_launcher/map_launcher.dart';

class BoulderAreaDetailsMap extends StatelessWidget {
  BoulderAreaDetailsMap({
    required this.boulderArea,
    super.key,
  }) : location = boulderArea.resolveLocation();

  final BoulderArea boulderArea;
  final Location location;

  @override
  Widget build(BuildContext context) {
    final parkingLocation = boulderArea.parkingLocation;

    final localizations = AppLocalizations.of(context);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: MapLauncherButton(
            destination: location,
            destinationTitle: parkingLocation != null
                ? '${localizations.parkingOfTheBoulderArea} ${boulderArea.name}'
                : '${localizations.boulderArea} ${boulderArea.name}',
            labelButton: parkingLocation != null
                ? localizations.itineraryToTheParking
                : localizations.itineraryToTheBoulderArea,
          ),
        ),
        Expanded(
          child: FutureBuilder(
            future: Future.wait([
              MapMarker.getMarkerIconFromAsset(path: Assets.parkingIcon),
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
                boulderMarkerBuilder: MapMarker.markerBuilderFactory(
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
                            MapDirections.openMapsSheet(
                              context: context,
                              availableMaps: availableMaps,
                              onMapSelectedFn: MapDirections.showDirections(
                                destination: parkingLocation,
                                destinationTitle:
                                    // ignore: lines_longer_than_80_chars
                                    '${localizations.parkingOfTheBoulderArea} ${boulderArea.name}',
                              ),
                            );
                          },
                        ),
                      },
              );
            },
          ),
        ),
      ],
    );
  }
}
