import 'package:breizh_blok_mobile/config/assets.dart';
import 'package:breizh_blok_mobile/domain/entities/boulder/boulder.dart';
import 'package:breizh_blok_mobile/extensions.dart';
import 'package:breizh_blok_mobile/i18n/app_localizations.dart';
import 'package:breizh_blok_mobile/ui/core/widgets/my_map.dart';
import 'package:flutter/material.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

class ContributeBoulderMapScreen extends StatelessWidget {
  const ContributeBoulderMapScreen({required this.boulder, super.key});

  final Boulder boulder;

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: FittedBox(child: Text(localizations.specifyBoulderLocation)),
      ),
      body: Column(
        children: [
          ListTile(
            subtitle: Text(
              localizations.mapFormHelper(boulderName: boulder.name),
            ),
          ),
          Expanded(
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                MyMap(
                  cameraOptions: CameraOptions(
                    zoom: 15,
                    center: Point(
                      coordinates: Position(
                        boulder.rock.location.longitude,
                        boulder.rock.location.latitude,
                      ),
                    ),
                  ),
                  onMapCreated: (mapboxMap) async {
                    final pointAnnotationManager =
                        await mapboxMap.annotations
                            .createPointAnnotationManager();

                    if (!context.mounted) {
                      return;
                    }
                    final imageData = await context.getResponsiveImageData(
                      imagePath: Assets.locationIcon,
                    );

                    final pointAnnotationOptions = PointAnnotationOptions(
                      geometry: Point(
                        coordinates: Position(
                          boulder.rock.location.longitude,
                          boulder.rock.location.latitude,
                        ),
                      ),
                      image: imageData,
                      iconSize: 1.3,
                      iconAnchor: IconAnchor.BOTTOM,
                    );

                    await pointAnnotationManager.create(pointAnnotationOptions);
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(14),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(localizations.latitude),
                      Text(
                        boulder.rock.location.latitude.toString(),
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(localizations.longitude, textAlign: TextAlign.right),
                      Text(
                        boulder.rock.location.longitude.toString(),
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.right,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: FilledButton(
              onPressed: () {},
              child: Text(localizations.submitLocation),
            ),
          ),
        ],
      ),
    );
  }
}
