import 'package:breizh_blok_mobile/domain/entities/location/location.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:map_launcher/map_launcher.dart';

class MapDirections {
  static void Function({required AvailableMap map}) showDirections({
    required Location destination,
    required String destinationTitle,
  }) {
    return ({required AvailableMap map}) => {
      map.showDirections(
        destination: Coords(destination.latitude, destination.longitude),
        destinationTitle: destinationTitle,
      ),
    };
  }

  static Future<void> openMapsSheet({
    required BuildContext context,
    required List<AvailableMap> availableMaps,
    required void Function({required AvailableMap map}) onMapSelectedFn,
  }) async {
    try {
      await showModalBottomSheet<void>(
        context: context,

        builder: (BuildContext context) {
          return SafeArea(
            key: const Key('maps-modal-bottom-sheet'),
            child: SingleChildScrollView(
              child: Wrap(
                children: <Widget>[
                  for (final map in availableMaps)
                    ListTile(
                      onTap: () => onMapSelectedFn(map: map),
                      title: Text(map.mapName),
                      leading: SvgPicture.asset(
                        map.icon,
                        height: 30,
                        width: 30,
                      ),
                    ),
                ],
              ),
            ),
          );
        },
      );
      // ignore: empty_catches
    } catch (e) {}
  }
}
