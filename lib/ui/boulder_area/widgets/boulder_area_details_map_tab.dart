import 'package:breizh_blok_mobile/config/assets.dart';
import 'package:breizh_blok_mobile/data/data_sources/api/api_client.dart';
import 'package:breizh_blok_mobile/data/repositories/boulder_marker/boulder_marker_repository.dart';
import 'package:breizh_blok_mobile/domain/models/boulder_area/boulder_area.dart';
import 'package:breizh_blok_mobile/domain/models/location/location.dart';
import 'package:breizh_blok_mobile/extensions.dart';
import 'package:breizh_blok_mobile/i18n/app_localizations.dart';
import 'package:breizh_blok_mobile/ui/boulder_area/view_models/boulder_area_map_view_model.dart';
import 'package:breizh_blok_mobile/ui/boulder_area/widgets/boulder_area_details_itinerary_button.dart';
import 'package:breizh_blok_mobile/ui/core/widgets/my_map.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

class BoulderAreaDetailsMapTab extends StatelessWidget {
  const BoulderAreaDetailsMapTab({required this.boulderArea, super.key});

  final BoulderArea boulderArea;

  Location get location =>
      boulderArea.centroid ??
      const Location(latitude: kDefaultLatitude, longitude: kDefaultLongitude);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: BlocProvider(
            create:
                (context) => BoulderAreaMapViewModel(
                  boulderArea: boulderArea,
                  boulderMarkerRepository: BoulderMarkerRepository(
                    httpClient: context.read<ApiClient>(),
                  ),
                ),
            child: BlocBuilder<BoulderAreaMapViewModel, BoulderAreaMapStates>(
              builder: (context, state) {
                return switch (state) {
                  BoulderAreaMapIdle() => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  BoulderAreaMapOK() => MyMap(
                    cameraOptions: CameraOptions(
                      zoom: 14,
                      center: Point(
                        coordinates: Position(
                          location.longitude,
                          location.latitude,
                        ),
                      ),
                    ),
                    onMapCreated: (mapboxMap) async {
                      final parkingLocation = boulderArea.parkingLocation;
                      if (parkingLocation != null) {
                        final pointAnnotationManager =
                            await mapboxMap.annotations
                                .createPointAnnotationManager();

                        if (!context.mounted) {
                          return;
                        }
                        final imageData = await context.getResponsiveImageData(
                          imagePath: Assets.parkingIcon,
                        );

                        final pointAnnotationOptions = PointAnnotationOptions(
                          geometry: Point(
                            coordinates: Position(
                              parkingLocation.longitude,
                              parkingLocation.latitude,
                            ),
                          ),
                          image: imageData,
                          iconSize: 1.2,
                          iconAnchor: IconAnchor.CENTER,
                        );

                        await pointAnnotationManager.create(
                          pointAnnotationOptions,
                        );
                        pointAnnotationManager
                            .addOnPointAnnotationClickListener(
                              _AnnotationClickListener(
                                onAnnotationClick: (annotation) {
                                  state.onClickParking?.call(context);
                                },
                              ),
                            );
                      }
                    },
                  ),
                  BoulderAreaMapError() => Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          AppLocalizations.of(
                            context,
                          ).anErrorOccuredWhileDisplayingMap,
                        ),
                        OutlinedButton(
                          onPressed: () {
                            context.read<BoulderAreaMapViewModel>().add(
                              const BoulderAreaMapInit(),
                            );
                          },
                          child: Text(AppLocalizations.of(context).tryAgain),
                        ),
                      ],
                    ),
                  ),
                };
              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 8),
          child: BoulderAreaDetailsItineraryButton(boulderArea: boulderArea),
        ),
      ],
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
