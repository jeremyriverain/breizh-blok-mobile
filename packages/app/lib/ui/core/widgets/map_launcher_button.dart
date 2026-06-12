import 'package:breizh_blok_mobile/domain/entities/location/location.dart';
import 'package:breizh_blok_mobile/domain/entities/map/map_directions.dart';
import 'package:breizh_blok_mobile/i18n/app_localizations.dart';
import 'package:breizh_blok_mobile/service_locator/map_launcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
    return Consumer(
      builder: (context, ref, child) {
        final availableMaps = ref.watch(mapLauncherProvider);

        return availableMaps.when(
          data: (data) {
            if (data.isEmpty) {
              return const SizedBox.shrink();
            }
            return FilledButton.icon(
              key: const Key('map-launcher-button'),
              onPressed: () => MapDirections.openMapsSheet(
                context: context,
                availableMaps: data,
                onMapSelectedFn: MapDirections.showDirections(
                  destination: destination,
                  destinationTitle: destinationTitle,
                ),
              ),
              icon: const Icon(Icons.directions),
              label: Text(
                labelButton ?? AppLocalizations.of(context).itinerary,
              ),
            );
          },
          error: (error, stackTrace) => const SizedBox.shrink(),
          loading: () => const SizedBox.shrink(),
        );
      },
    );
  }
}
