import 'package:breizh_blok_mobile/data/data_sources/remote/model/request_strategy.dart';
import 'package:breizh_blok_mobile/domain/entities/location/location.dart';
import 'package:breizh_blok_mobile/ui/boulder/view_models/boulder_bloc.dart';
import 'package:breizh_blok_mobile/ui/boulder/view_models/boulder_filter_bloc.dart';
import 'package:breizh_blok_mobile/ui/boulder/view_models/boulder_order_bloc.dart';
import 'package:breizh_blok_mobile/ui/core/extensions/feature_value_extension.dart';
import 'package:breizh_blok_mobile/ui/core/extensions/mapbox_map_extension.dart';
import 'package:breizh_blok_mobile/ui/core/widgets/boulder_list_builder.dart';
import 'package:breizh_blok_mobile/ui/core/widgets/modal_closing_button.dart';
import 'package:breizh_blok_mobile/ui/core/widgets/my_map.dart';
import 'package:breizh_blok_mobile/ui/map/view_models/map_screen_view_model.dart';
import 'package:breizh_blok_mobile/ui/map/widgets/map_screen_bottom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

const boulderIdsProcessingLimit = 500;

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  static const ({String name, String path}) route = (name: 'map', path: '/map');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer(
        builder: (context, ref, _) {
          final state = ref.watch(mapViewModelProvider);
          return Stack(
            alignment: Alignment.bottomCenter,
            children: [
              MyMap(
                initialZoom: 5,
                initialLatitude: kDefaultLatitude,
                initialLongitude: kDefaultLongitude,
                onMapCreated: (mapboxMap) {
                  ref.read(mapViewModelProvider.notifier).setMap(mapboxMap);
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
                    state.boulderGeoPoints.length,
                    0,
                  );

                  final boulderIds = clusterLeaves.extractIDs();

                  if (!context.mounted ||
                      boulderIds.length > boulderIdsProcessingLimit) {
                    return;
                  }

                  await showModalBottomSheet<void>(
                    context: context,
                    isScrollControlled: true,
                    builder: (context) {
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
                                  onPageRequested: (page) {
                                    final orderParam = context
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
              const MapScreenBottom(),
            ],
          );
        },
      ),
    );
  }
}
