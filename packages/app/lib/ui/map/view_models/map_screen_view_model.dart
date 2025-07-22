import 'package:breizh_blok_mobile/data/repositories/boulder_marker/boulder_marker_repository.dart';
import 'package:breizh_blok_mobile/domain/entities/boulder_marker/boulder_marker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

part 'map_screen_view_model.freezed.dart';

class MapScreenViewModel extends Bloc<MapEvents, MapState> {
  MapScreenViewModel({required this.boulderMarkerRepository})
    : super(
        const MapState(
          pending: true,
          error: false,
          mapboxMap: null,
          boulderMarkers: [],
          clusterSource: {},
        ),
      ) {
    on<MapEvents>((event, emit) async {
      switch (event) {
        case FetchBoulderMarkersEvent():
          try {
            emit(
              MapState(
                clusterSource: state.clusterSource,
                boulderMarkers: state.boulderMarkers,
                mapboxMap: state.mapboxMap,
                pending: true,
                error: false,
              ),
            );
            final boulderMarkers = await boulderMarkerRepository.findAll();

            emit(
              MapState(
                clusterSource: _getClusterSource(
                  boulderMarkers: boulderMarkers,
                ),
                boulderMarkers: boulderMarkers,
                mapboxMap: state.mapboxMap,
                pending: false,
                error: false,
              ),
            );
          } catch (e) {
            emit(
              MapState(
                clusterSource: state.clusterSource,
                boulderMarkers: state.boulderMarkers,
                mapboxMap: state.mapboxMap,
                pending: false,
                error: true,
              ),
            );
          }
        case MapLoadedEvent(:final mapboxMap):
          emit(
            MapState(
              clusterSource: state.clusterSource,
              boulderMarkers: state.boulderMarkers,
              mapboxMap: mapboxMap,
              pending: state.pending,
              error: state.error,
            ),
          );
      }
    });
    add(FetchBoulderMarkersEvent());
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

sealed class MapEvents {}

class FetchBoulderMarkersEvent extends MapEvents {}

class MapLoadedEvent extends MapEvents {
  MapLoadedEvent({required this.mapboxMap});

  final MapboxMap mapboxMap;
}

@freezed
abstract class MapState with _$MapState {
  const factory MapState({
    required Map<String, dynamic> clusterSource,
    required List<BoulderMarker> boulderMarkers,
    required MapboxMap? mapboxMap,
    required bool pending,
    required bool error,
  }) = _MapState;
}
