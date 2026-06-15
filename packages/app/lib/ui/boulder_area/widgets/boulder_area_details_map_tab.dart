import 'package:breizh_blok_map_launcher/breizh_blok_map_launcher.dart';
import 'package:breizh_blok_mobile/config/assets.dart';
import 'package:breizh_blok_mobile/data/data_sources/remote/model/request_strategy.dart';
import 'package:breizh_blok_mobile/domain/entities/boulder_area/boulder_area.dart';
import 'package:breizh_blok_mobile/domain/entities/location/location.dart';
import 'package:breizh_blok_mobile/i18n/app_localizations.dart';
import 'package:breizh_blok_mobile/ui/boulder/view_models/boulder_bloc.dart';
import 'package:breizh_blok_mobile/ui/boulder/view_models/boulder_filter_bloc.dart';
import 'package:breizh_blok_mobile/ui/boulder/view_models/boulder_order_bloc.dart';
import 'package:breizh_blok_mobile/ui/boulder_area/view_models/boulder_area_map_view_model.dart';
import 'package:breizh_blok_mobile/ui/boulder_area/widgets/boulder_area_details_itinerary_button.dart';
import 'package:breizh_blok_mobile/ui/boulder_area/widgets/boulder_area_details_map_bottom.dart';
import 'package:breizh_blok_mobile/ui/core/extensions/build_context_extension.dart';
import 'package:breizh_blok_mobile/ui/core/extensions/feature_value_extension.dart';
import 'package:breizh_blok_mobile/ui/core/extensions/mapbox_map_extension.dart';
import 'package:breizh_blok_mobile/ui/core/widgets/available_maps_sheet.dart';
import 'package:breizh_blok_mobile/ui/core/widgets/boulder_list_builder.dart';
import 'package:breizh_blok_mobile/ui/core/widgets/modal_closing_button.dart';
import 'package:breizh_blok_mobile/ui/core/widgets/my_map.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
    final areaId = int.parse(widget.boulderArea.id);
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Consumer(
          builder: (context, ref, _) {
            final mapState = ref.watch(
              boulderAreaMapViewModelProvider(areaId),
            );
            return MyMap(
              initialZoom: 12,
              initialLatitude: location.latitude,
              initialLongitude: location.longitude,
              onMapCreated: (mapboxMap) async {
                ref.invalidate(boulderAreaMapViewModelProvider(areaId));
                ref
                    .read(boulderAreaMapViewModelProvider(areaId).notifier)
                    .setMap(mapboxMap);

                final parkingLocation = widget.boulderArea.parkingLocation;
                if (parkingLocation != null) {
                  await _showParkingLocation(
                    context,
                    mapboxMap: mapboxMap,
                    parkingLocation: parkingLocation,
                  );
                }
              },
              onTapListener: (mapboxMap, mapContentGestureContext) async {
                final cluster = await mapboxMap.onTapFindCluster(
                  mapContentGestureContext,
                );

                if (cluster == null) {
                  return;
                }

                final clusterLeaves = await mapboxMap.getGeoJsonClusterLeaves(
                  'boulders',
                  cluster,
                  mapState.boulderGeoPoints.length,
                  0,
                );

                final boulderIds = clusterLeaves.extractIDs();

                if (!context.mounted) {
                  return;
                }

                final offlineFirst = context
                    .read<RequestStrategy>()
                    .offlineFirst;

                await showModalBottomSheet<void>(
                  context: context,
                  isScrollControlled: true,
                  builder: (context) {
                    return RepositoryProvider(
                      create: (_) =>
                          RequestStrategy(offlineFirst: offlineFirst),
                      child: Builder(
                        builder: (context) {
                          return FractionallySizedBox(
                            heightFactor: 0.8,
                            child: Scaffold(
                              floatingActionButton: const ModalClosingButton(),
                              floatingActionButtonLocation:
                                  FloatingActionButtonLocation.endTop,
                              body: BoulderListBuilder(
                                boulderFilterBloc: BoulderFilterBloc(
                                  const BoulderFilterState(),
                                ),
                                onPageRequested: (page) {
                                  final orderParam = context
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
            );
          },
        ),

        BoulderAreaDetailsMapBottom(
          areaId: areaId,
          child: Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 8),
            child: BoulderAreaDetailsItineraryButton(
              boulderArea: widget.boulderArea,
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _showParkingLocation(
    BuildContext context, {
    required MapboxMap mapboxMap,
    required Location parkingLocation,
  }) async {
    final pointAnnotationManager = await mapboxMap.annotations
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
    pointAnnotationManager.tapEvents(
      onTap: (annotation) async {
        if (!context.mounted) {
          return;
        }
        await showModalBottomSheet<void>(
          context: context,
          builder: (context) {
            return AvailableMapsSheet(
              onMapSelected: ({required map}) async {
                await map
                    .showDirections(
                      destination: Coords(
                        latitude: parkingLocation.latitude,
                        longitude: parkingLocation.longitude,
                      ),
                      destinationTitle:
                          // ignore: lines_longer_than_80_chars
                          '${AppLocalizations.of(context).parkingOfTheBoulderArea} '
                          '${widget.boulderArea.name}',
                    )
                    .run();
              },
            );
          },
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
