import 'package:breizh_blok_mobile/config/assets.dart';
import 'package:breizh_blok_mobile/data/data_sources/api/api_client.dart';
import 'package:breizh_blok_mobile/data/data_sources/api/model/request_strategy.dart';
import 'package:breizh_blok_mobile/data/repositories/boulder_marker/boulder_marker_repository.dart';
import 'package:breizh_blok_mobile/domain/models/boulder_area/boulder_area.dart';
import 'package:breizh_blok_mobile/domain/models/location/location.dart';
import 'package:breizh_blok_mobile/extensions.dart';
import 'package:breizh_blok_mobile/i18n/app_localizations.dart';
import 'package:breizh_blok_mobile/ui/boulder/view_models/boulder_bloc.dart';
import 'package:breizh_blok_mobile/ui/boulder/view_models/boulder_filter_bloc.dart';
import 'package:breizh_blok_mobile/ui/boulder/view_models/boulder_order_bloc.dart';
import 'package:breizh_blok_mobile/ui/boulder_area/view_models/boulder_area_map_view_model.dart';
import 'package:breizh_blok_mobile/ui/boulder_area/widgets/boulder_area_details_itinerary_button.dart';
import 'package:breizh_blok_mobile/ui/core/widgets/boulder_list_builder.dart';
import 'package:breizh_blok_mobile/ui/core/widgets/modal_closing_button.dart';
import 'package:breizh_blok_mobile/ui/core/widgets/my_map.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

class BoulderAreaDetailsMapTab extends StatefulWidget {
  const BoulderAreaDetailsMapTab({required this.boulderArea, super.key});

  final BoulderArea boulderArea;

  @override
  State<BoulderAreaDetailsMapTab> createState() =>
      _BoulderAreaDetailsMapTabState();
}

class _BoulderAreaDetailsMapTabState extends State<BoulderAreaDetailsMapTab>
    with AutomaticKeepAliveClientMixin {
  Location get location =>
      widget.boulderArea.centroid ??
      const Location(latitude: kDefaultLatitude, longitude: kDefaultLongitude);

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      children: [
        Expanded(
          child: BlocProvider(
            create:
                (context) => BoulderAreaMapViewModel(
                  boulderArea: widget.boulderArea,
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
                  BoulderAreaMapOK(
                    :final clusterSource,
                    :final boulderMarkers,
                  ) =>
                    MyMap(
                      cameraOptions: CameraOptions(
                        zoom: 12,
                        center: Point(
                          coordinates: Position(
                            location.longitude,
                            location.latitude,
                          ),
                        ),
                      ),
                      onMapCreated: (mapboxMap) async {
                        final parkingLocation =
                            widget.boulderArea.parkingLocation;
                        if (parkingLocation != null) {
                          final pointAnnotationManager =
                              await mapboxMap.annotations
                                  .createPointAnnotationManager();

                          if (!context.mounted) {
                            return;
                          }
                          final imageData = await context
                              .getResponsiveImageData(
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
                      onStyleLoadedListener: (mapboxMap, _) async {
                        await mapboxMap.showClusters(clusterSource);
                      },
                      onTapListener: (
                        mapboxMap,
                        mapContentGestureContext,
                      ) async {
                        final renderedQueryGeometry =
                            RenderedQueryGeometry.fromScreenCoordinate(
                              mapContentGestureContext.touchPosition,
                            );

                        final queriedRenderedFeatures = await mapboxMap
                            .queryRenderedFeatures(
                              renderedQueryGeometry,
                              RenderedQueryOptions(layerIds: ['clusters']),
                            );

                        final cluster =
                            queriedRenderedFeatures
                                .firstWhere(
                                  (q) => q?.queriedFeature.source == 'boulders',
                                )
                                ?.queriedFeature
                                .feature;

                        if (cluster == null) {
                          return;
                        }

                        final clusterLeaves = await mapboxMap
                            .getGeoJsonClusterLeaves(
                              'boulders',
                              cluster,
                              boulderMarkers.length,
                              0,
                            );

                        final boulderIds = clusterLeaves.toBoulderIds();

                        if (!context.mounted) {
                          return;
                        }

                        final offlineFirst =
                            context.read<RequestStrategy>().offlineFirst;

                        await showModalBottomSheet<void>(
                          context: context,
                          isScrollControlled: true,
                          builder: (BuildContext context) {
                            return RepositoryProvider(
                              create:
                                  (_) => RequestStrategy(
                                    offlineFirst: offlineFirst,
                                  ),
                              child: Builder(
                                builder: (context) {
                                  return FractionallySizedBox(
                                    heightFactor: 0.8,
                                    child: Scaffold(
                                      floatingActionButton:
                                          const ModalClosingButton(),
                                      floatingActionButtonLocation:
                                          FloatingActionButtonLocation.endTop,
                                      body: BoulderListBuilder(
                                        boulderFilterBloc: BoulderFilterBloc(
                                          const BoulderFilterState(),
                                        ),
                                        onPageRequested: (int page) {
                                          final orderParam =
                                              context
                                                  .read<BoulderOrderBloc>()
                                                  .state;

                                          if (offlineFirst) {
                                            return DbBouldersRequested(
                                              boulderArea: widget.boulderArea,
                                              orderParam: orderParam,
                                              boulderIds: boulderIds,
                                            );
                                          }
                                          return BoulderRequested(
                                            page: page,
                                            boulderIds: boulderIds,
                                            orderParam: orderParam,
                                          );
                                        },
                                        showFilterButton: false,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            );
                          },
                        );
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
          child: BoulderAreaDetailsItineraryButton(
            boulderArea: widget.boulderArea,
          ),
        ),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class _AnnotationClickListener extends OnPointAnnotationClickListener {
  _AnnotationClickListener({required this.onAnnotationClick});

  final void Function(PointAnnotation annotation) onAnnotationClick;

  @override
  void onPointAnnotationClick(PointAnnotation annotation) {
    onAnnotationClick(annotation);
  }
}
