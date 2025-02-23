import 'package:breizh_blok_mobile/domain/models/location/location.dart';
import 'package:breizh_blok_mobile/domain/models/map/map_directions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:map_launcher/map_launcher.dart';

class MapLauncherButton extends StatelessWidget {
  const MapLauncherButton({
    required this.destination,
    required this.destinationTitle,
    super.key,
    this.labelButton,
  });

  final Location destination;
  final String destinationTitle;
  final String? labelButton;

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
          onPressed: () => MapDirections.openMapsSheet(
            context: context,
            availableMaps: snapshot.data!,
            onMapSelectedFn: MapDirections.showDirections(
              destination: destination,
              destinationTitle: destinationTitle,
            ),
          ),
          icon: const Icon(Icons.directions),
          label: Text(labelButton ?? AppLocalizations.of(context).itinerary),
        );
      },
    );
  }
}
