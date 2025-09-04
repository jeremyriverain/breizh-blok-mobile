import 'package:breizh_blok_mobile/config/assets.dart';
import 'package:breizh_blok_mobile/domain/entities/boulder/boulder.dart';
import 'package:breizh_blok_mobile/extensions.dart';
import 'package:breizh_blok_mobile/ui/boulder/view_models/boulder_map_view_model.dart';
import 'package:breizh_blok_mobile/ui/core/widgets/map_launcher_button.dart';
import 'package:breizh_blok_mobile/ui/core/widgets/my_map.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

class BoulderDetailsMapTab extends StatefulWidget {
  const BoulderDetailsMapTab({required this.boulder, super.key});

  final Boulder boulder;

  @override
  State<BoulderDetailsMapTab> createState() => _BoulderDetailsMapTabState();
}

class _BoulderDetailsMapTabState extends State<BoulderDetailsMapTab>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    final location = widget.boulder.rock.location;
    final grade = widget.boulder.grade;
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        BlocProvider(
          create: (context) => BoulderMapViewModel(boulder: widget.boulder),
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
                      coordinates: Position(
                        location.longitude,
                        location.latitude,
                      ),
                    ),
                  ),
                  onMapCreated: (mapboxMap) async {
                    final pointAnnotationManager = await mapboxMap.annotations
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
                          widget.boulder.rock.location.longitude,
                          widget.boulder.rock.location.latitude,
                        ),
                      ),
                      image: imageData,
                      iconSize: 1.3,
                      iconAnchor: IconAnchor.BOTTOM,
                    );

                    await pointAnnotationManager.create(pointAnnotationOptions);
                    pointAnnotationManager.tapEvents(
                      onTap: (annotation) {
                        state.onClickMarker?.call(context);
                      },
                    );
                  },
                ),
              };
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: MapLauncherButton(
            destination: widget.boulder.rock.location,
            destinationTitle:
                '${widget.boulder.name}'
                '${grade != null ? ', ${grade.name}' : ''}',
          ),
        ),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
