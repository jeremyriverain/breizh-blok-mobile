import 'package:breizh_blok_mobile/domain/entities/boulder_geo_point/boulder_geo_point.dart';
import 'package:breizh_blok_mobile/service_locator/repositories.dart';
import 'package:breizh_blok_mobile/ui/core/extensions/mapbox_map_extension.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'map_screen_view_model.freezed.dart';
part 'map_screen_view_model.g.dart';

@freezed
abstract class MapScreenState with _$MapScreenState {
  const factory MapScreenState({
    required List<BoulderGeoPoint> boulderGeoPoints,
    required MapboxMap? mapboxMap,
    required bool pending,
    required bool error,
  }) = _MapScreenState;
}

@riverpod
class MapViewModel extends _$MapViewModel {
  @override
  MapScreenState build() {
    final boulderGeoPointRepository = ref.watch(
      boulderGeoPointRepositoryProvider,
    );

    boulderGeoPointRepository.findAll().run().ignore();

    final subscription = boulderGeoPointRepository.watchAll.listen(
      (points) async {
        state = state.copyWith(
          boulderGeoPoints: points,
          pending: false,
          error: false,
        );

        final map = state.mapboxMap;
        if (map != null) {
          await showClusters2(map, points).run();
        }
      },
      onError: (_) {
        state = state.copyWith(
          pending: false,
          error: true,
        );
      },
    );

    ref.onDispose(subscription.cancel);

    return const MapScreenState(
      boulderGeoPoints: [],
      mapboxMap: null,
      pending: true,
      error: false,
    );
  }

  Future<void> setMap(MapboxMap mapboxMap) async {
    state = state.copyWith(mapboxMap: mapboxMap);
    await showClusters2(mapboxMap, state.boulderGeoPoints).run();
  }
}
