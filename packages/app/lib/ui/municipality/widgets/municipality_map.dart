import 'package:breizh_blok_mobile/domain/entities/boulder_area/boulder_area.dart';
import 'package:breizh_blok_mobile/domain/entities/location/location.dart';
import 'package:breizh_blok_mobile/extensions.dart';
import 'package:breizh_blok_mobile/i18n/app_localizations.dart';
import 'package:breizh_blok_mobile/service_locator/service_locator.dart';
import 'package:breizh_blok_mobile/ui/boulder_area/widgets/boulder_area_details_screen.dart';
import 'package:breizh_blok_mobile/ui/core/widgets/my_map.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

class MunicipalityMap extends StatelessWidget {
  const MunicipalityMap({
    required this.boulderAreas,
    required this.initialLocation,
    super.key,
  });

  final List<BoulderArea> boulderAreas;
  final Location initialLocation;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        return MyMap(
          initialZoom: 10,
          initialLatitude: initialLocation.latitude,
          initialLongitude: initialLocation.longitude,
          onMapCreated: (mapboxMap) async {
            final circleAnnotationManager = await mapboxMap.annotations
                .createCircleAnnotationManager();

            if (!context.mounted) {
              return;
            }

            final circleAnnotationBoulderArea = <String, BoulderArea>{};

            for (final boulderArea in boulderAreas) {
              final location = boulderArea.resolveLocation();

              final annotation = await circleAnnotationManager.create(
                CircleAnnotationOptions(
                  geometry: Point(
                    coordinates: Position(
                      location.longitude,
                      location.latitude,
                    ),
                  ),
                  circleColor: context.createRandomColor(),
                  circleRadius: 12,
                ),
              );

              circleAnnotationBoulderArea[annotation.id] = boulderArea;
            }

            circleAnnotationManager.tapEvents(
              onTap: (annotation) {
                final localizations = AppLocalizations.of(context);
                final boulderArea = circleAnnotationBoulderArea[annotation.id];
                if (boulderArea != null) {
                  ScaffoldMessenger.of(context).removeCurrentSnackBar();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        '${boulderArea.name},\n'
                        '${boulderArea.nBouldersRated(localizations)}',
                      ),
                      action: SnackBarAction(
                        label: localizations.showDetails,
                        onPressed: () async {
                          await ref
                              .read(routerProvider)
                              .pushNamed(
                                BoulderAreaDetailsScreen.route.name,
                                pathParameters: {
                                  BoulderAreaDetailsScreen.idParameterName:
                                      boulderArea.id,
                                },
                              );
                        },
                      ),
                    ),
                  );
                }
              },
            );
          },
        );
      },
    );
  }
}
