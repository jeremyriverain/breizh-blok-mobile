import 'package:breizh_blok_mobile/domain/entities/boulder_geo_point/boulder_geo_point.dart';
import 'package:breizh_blok_mobile/domain/entities/domain_exception/domain_exception.dart';
import 'package:breizh_blok_mobile/service_locator/repositories.dart';
import 'package:breizh_blok_mobile/ui/core/extensions/mapbox_map_extension.dart';
import 'package:flutter/foundation.dart';
import 'package:fpdart/fpdart.dart';
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
    required bool initialized,
  }) = _MapScreenState;
}

@riverpod
class MapViewModel extends _$MapViewModel {
  @override
  MapScreenState build() {
    final boulderGeoPointRepository = ref.watch(
      boulderGeoPointRepositoryProvider,
    );

    final subscription = boulderGeoPointRepository.watchAll.listen(
      (points) async {
        state = state.copyWith(
          boulderGeoPoints: points,
        );
      },
    );

    listenSelf((prev, next) async {
      final map = next.mapboxMap;
      if (map != null &&
          (!state.initialized ||
              !listEquals(
                prev?.boulderGeoPoints,
                next.boulderGeoPoints,
              ))) {
        if (next.boulderGeoPoints.isEmpty) {
          return;
        }
        state = state.copyWith(
          initialized: true,
        );
        await showClusters(
          mapboxMap: map,
          features: next.boulderGeoPoints.map((p) => p.toFeature()).toList(),
          geoJsonSourceId: 'boulders',
        ).run();
      }
    });

    ref.onDispose(subscription.cancel);

    return const MapScreenState(
      initialized: false,
      boulderGeoPoints: [],
      mapboxMap: null,
    );
  }

  void setMap(MapboxMap mapboxMap) {
    state = state.copyWith(mapboxMap: mapboxMap);
  }
}

Duration? disableRetry(int retryCount, Object error) {
  return null;
}

@Riverpod(retry: disableRetry)
class FindAllBoulderGeoPoints extends _$FindAllBoulderGeoPoints {
  @override
  Future<Either<DomainException, void>> build() async {
    final boulderGeoPointRepository = ref.watch(
      boulderGeoPointRepositoryProvider,
    );

    return boulderGeoPointRepository.findAll().run();
  }
}

@riverpod
class ActivatePotentialErrorBannerViewModel
    extends _$ActivatePotentialErrorBannerViewModel {
  @override
  bool build() {
    return true;
  }

  void activatePotentialErrorBanner() {
    state = true;
  }

  void deactivatePotentialErrorBanner() {
    state = false;
  }
}
