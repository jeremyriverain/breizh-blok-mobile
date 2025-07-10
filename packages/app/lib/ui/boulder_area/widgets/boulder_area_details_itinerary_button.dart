import 'package:breizh_blok_mobile/domain/entities/boulder_area/boulder_area.dart';
import 'package:breizh_blok_mobile/domain/entities/location/location.dart';
import 'package:breizh_blok_mobile/i18n/app_localizations.dart';
import 'package:breizh_blok_mobile/ui/core/widgets/map_launcher_button.dart';
import 'package:flutter/material.dart';

class BoulderAreaDetailsItineraryButton extends StatelessWidget {
  BoulderAreaDetailsItineraryButton({required this.boulderArea, super.key})
    : location = boulderArea.resolveLocation();

  final BoulderArea boulderArea;
  final Location location;

  @override
  Widget build(BuildContext context) {
    final parkingLocation = boulderArea.parkingLocation;

    final localizations = AppLocalizations.of(context);

    return MapLauncherButton(
      destination: location,
      destinationTitle:
          parkingLocation != null
              // ignore: lines_longer_than_80_chars
              ? '${localizations.parkingOfTheBoulderArea} ${boulderArea.name}'
              : '${localizations.boulderArea} ${boulderArea.name}',
      labelButton:
          parkingLocation != null
              ? localizations.itineraryToTheParking
              : localizations.itineraryToTheBoulderArea,
    );
  }
}
