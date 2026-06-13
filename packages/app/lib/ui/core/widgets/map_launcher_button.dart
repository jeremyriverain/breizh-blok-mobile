import 'package:breizh_blok_map_launcher/breizh_blok_map_launcher.dart';
import 'package:breizh_blok_mobile/domain/entities/location/location.dart';
import 'package:breizh_blok_mobile/i18n/app_localizations.dart';
import 'package:breizh_blok_mobile/service_locator/map_launcher.dart';
import 'package:breizh_blok_mobile/ui/core/widgets/available_maps_sheet.dart';
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
        return ref
            .watch(availableMapsProvider)
            .when(
              data: (data) {
                return data.fold((e) => const SizedBox.shrink(), (
                  availableMaps,
                ) {
                  if (availableMaps.isEmpty) {
                    return const SizedBox.shrink();
                  }

                  return FilledButton.icon(
                    key: const Key('map-launcher-button'),
                    onPressed: () async {
                      await showModalBottomSheet<void>(
                        context: context,
                        builder: (context) {
                          return AvailableMapsSheet(
                            onMapSelected: ({required map}) async {
                              await map
                                  .showDirections(
                                    destinationTitle: destinationTitle,
                                    destination: Coords(
                                      latitude: destination.latitude,
                                      longitude: destination.longitude,
                                    ),
                                  )
                                  .run();
                            },
                          );
                        },
                      );
                    },
                    icon: const Icon(Icons.directions),
                    label: Text(
                      labelButton ?? AppLocalizations.of(context).itinerary,
                    ),
                  );
                });
              },
              error: (error, stackTrace) => const SizedBox.shrink(),
              loading: () => const SizedBox.shrink(),
            );
      },
    );
  }
}
