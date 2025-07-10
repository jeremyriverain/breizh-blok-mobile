import 'package:breizh_blok_mobile/data/repositories/boulder_marker/boulder_marker_repository.dart';
import 'package:breizh_blok_mobile/domain/entities/boulder_marker/boulder_marker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'map_screen_view_model.freezed.dart';

class MapScreenViewModel extends Bloc<MapScreenEvents, MapScreenStates> {
  MapScreenViewModel({required this.boulderMarkerRepository})
    : super(const MapScreenIdle()) {
    on<MapScreenEvents>((event, emit) async {
      switch (event) {
        case MapScreenInit():
          {
            try {
              final boulderMarkers = await boulderMarkerRepository.findAll();

              emit(
                MapScreenOK(
                  clusterSource: _getClusterSource(
                    boulderMarkers: boulderMarkers,
                  ),
                  boulderMarkers: boulderMarkers,
                ),
              );
            } catch (e) {
              emit(const MapScreenError());
            }
          }
      }
    });
    add(const MapScreenInit());
  }

  final BoulderMarkerRepository boulderMarkerRepository;

  Map<String, dynamic> _getClusterSource({
    required List<BoulderMarker> boulderMarkers,
  }) {
    return {
      'type': 'geojson',
      'cluster': true,
      'clusterMaxZoom': 20,
      'clusterRadius': 50,
      'data': {
        'type': 'FeatureCollection',
        'features': [
          for (final boulderMarker in boulderMarkers) boulderMarker.toGeojson(),
        ],
      },
    };
  }
}

@freezed
sealed class MapScreenEvents with _$MapScreenEvents {
  const MapScreenEvents._();

  const factory MapScreenEvents.init() = MapScreenInit;
}

@freezed
sealed class MapScreenStates with _$MapScreenStates {
  const MapScreenStates._();

  const factory MapScreenStates.idle() = MapScreenIdle;
  const factory MapScreenStates.ok({
    required Map<String, dynamic> clusterSource,
    required List<BoulderMarker> boulderMarkers,
  }) = MapScreenOK;
  const factory MapScreenStates.error() = MapScreenError;
}
