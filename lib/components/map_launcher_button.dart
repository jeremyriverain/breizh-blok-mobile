import 'package:breizh_blok_mobile/models/location.dart';
import 'package:breizh_blok_mobile/utils/map_utils.dart';
import 'package:flutter/material.dart';
import 'package:map_launcher/map_launcher.dart';

class MapLauncherButton extends StatelessWidget {
  final Location destination;
  final String destinationTitle;
  final String labelButton;

  const MapLauncherButton({
    Key? key,
    required this.destination,
    required this.destinationTitle,
    this.labelButton = 'Itinéraire',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: MapLauncher.installedMaps,
      builder: (context, AsyncSnapshot<List<AvailableMap>> snapshot) {
        if (!snapshot.hasData || snapshot.hasError || snapshot.data!.isEmpty) {
          return Container();
        }
        return ElevatedButton.icon(
          key: const Key('map-launcher-button'),
          onPressed: () => openMapsSheet(
            context: context,
            availableMaps: snapshot.data!,
            onMapSelectedFn: showDirections(
              destination: destination,
              destinationTitle: destinationTitle,
            ),
          ),
          icon: const Icon(Icons.directions),
          label: Text(labelButton),
        );
      },
    );
  }
}
