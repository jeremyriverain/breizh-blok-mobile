import 'package:breizh_blok_mobile/data/data_sources/api/model/request_strategy.dart';
import 'package:breizh_blok_mobile/data/repositories/boulder_marker/boulder_marker_repository.dart';
import 'package:breizh_blok_mobile/domain/entities/location/location.dart';
import 'package:breizh_blok_mobile/extensions.dart';
import 'package:breizh_blok_mobile/i18n/app_localizations.dart';
import 'package:breizh_blok_mobile/ui/boulder/view_models/boulder_bloc.dart';
import 'package:breizh_blok_mobile/ui/boulder/view_models/boulder_filter_bloc.dart';
import 'package:breizh_blok_mobile/ui/boulder/view_models/boulder_order_bloc.dart';
import 'package:breizh_blok_mobile/ui/core/widgets/boulder_list_builder.dart';
import 'package:breizh_blok_mobile/ui/core/widgets/modal_closing_button.dart';
import 'package:breizh_blok_mobile/ui/core/widgets/my_map.dart';
import 'package:breizh_blok_mobile/ui/map/view_models/map_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

const boulderIdsProcessingLimit = 500;

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  static const route = (name: 'map', path: '/map');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create:
            (context) => MapScreenViewModel(
              boulderMarkerRepository: context.read<BoulderMarkerRepository>(),
            ),
        child: BlocConsumer<MapScreenViewModel, MapState>(
          listener: (context, state) async {
            final mapboxMap = state.mapboxMap;
            if (!state.pending && mapboxMap != null) {
              await mapboxMap.showClusters(state.clusterSource);
            }
          },
          builder: (context, state) {
            return Stack(
              alignment: Alignment.bottomCenter,
              children: [
                MyMap(
                  cameraOptions: CameraOptions(
                    zoom: 5,
                    center: Point(
                      coordinates: Position(
                        kDefaultLongitude,
                        kDefaultLatitude,
                      ),
                    ),
                  ),
                  onStyleLoadedListener: (mapboxMap, _) async {
                    if (!state.pending) {
                      await mapboxMap.showClusters(state.clusterSource);
                    }
                  },
                  onMapCreated: (mapboxMap) {
                    context.read<MapScreenViewModel>().add(
                      MapLoadedEvent(mapboxMap: mapboxMap),
                    );
                  },
                  onTapListener: (mapboxMap, mapContentGestureContext) async {
                    final cluster = await mapboxMap.onTapFindCluster(
                      mapContentGestureContext,
                    );

                    if (cluster == null) {
                      return;
                    }

                    final clusterLeaves = await mapboxMap
                        .getGeoJsonClusterLeaves(
                          'boulders',
                          cluster,
                          state.boulderMarkers.length,
                          0,
                        );

                    final boulderIds = clusterLeaves.toBoulderIds();

                    if (!context.mounted ||
                        boulderIds.length > boulderIdsProcessingLimit) {
                      return;
                    }

                    await showModalBottomSheet<void>(
                      context: context,
                      isScrollControlled: true,
                      builder: (BuildContext context) {
                        return RepositoryProvider(
                          create: (_) => RequestStrategy(),
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
                if (state.pending)
                  const Padding(
                    padding: EdgeInsets.all(30),
                    child: SizedBox.square(
                      dimension: 50,

                      child: CircularProgressIndicator(strokeWidth: 5),
                    ),
                  ),
                if (state.error)
                  MaterialBanner(
                    content: Text(
                      AppLocalizations.of(
                        context,
                      ).anErrorOccuredWhileDisplayingMap,
                    ),
                    leading: const Icon(Icons.error),
                    forceActionsBelow: true,
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          context.read<MapScreenViewModel>().add(
                            FetchBoulderMarkersEvent(),
                          );
                        },
                        child: Text(AppLocalizations.of(context).tryAgain),
                      ),
                    ],
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}
