import 'package:breizh_blok_mobile/config/assets.dart';
import 'package:breizh_blok_mobile/domain/models/boulder/boulder.dart';
import 'package:breizh_blok_mobile/extensions.dart';
import 'package:breizh_blok_mobile/ui/boulder/view_models/boulder_map_view_model.dart';
import 'package:breizh_blok_mobile/ui/core/widgets/my_map.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

class BoulderDetailsMap extends StatelessWidget {
  const BoulderDetailsMap({required this.boulder, super.key});

  final Boulder boulder;

  @override
  Widget build(BuildContext context) {
    final location = boulder.rock.location;
    return BlocProvider(
      create: (context) => BoulderMapViewModel(boulder: boulder),
      child: BlocBuilder<BoulderMapViewModel, BoulderMapStates>(
        builder: (context, state) {
          return switch (state) {
            BoulderMapIdle() => const Center(
              child: CircularProgressIndicator(),
            ),
            BoulderMapOK() => MyMap(
              cameraOptions: CameraOptions(
                zoom: 15,
                center: Point(
                  coordinates: Position(location.longitude, location.latitude),
                ),
              ),
              onMapCreated: (mapboxMap) async {
                final pointAnnotationManager =
                    await mapboxMap.annotations.createPointAnnotationManager();

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
                pointAnnotationManager.addOnPointAnnotationClickListener(
                  _AnnotationClickListener(
                    onAnnotationClick: (annotation) {
                      state.onClickMarker(context);
                    },
                  ),
                );
              },
            ),
          };
        },
      ),
    );
  }
}

class _AnnotationClickListener extends OnPointAnnotationClickListener {
  _AnnotationClickListener({required this.onAnnotationClick});

  final void Function(PointAnnotation annotation) onAnnotationClick;

  @override
  void onPointAnnotationClick(PointAnnotation annotation) {
    onAnnotationClick(annotation);
  }
}
