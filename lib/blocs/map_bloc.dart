import 'package:breizh_blok_mobile/utils/map_utils.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  MapBloc({
    MapState? initialState,
  }) : super(
          initialState ??
              const MapState(
                mapZoom: 7,
                mapLatLng: kDefaultInitialPosition,
              ),
        ) {
    on<MapUpdated>((event, emit) {
      emit(state.copyWith(
        mapZoom: event.mapZoom,
        mapLatLng: event.mapLatLng,
      ));
    });
  }
}

abstract class MapEvent {}

class MapUpdated extends MapEvent {
  final double mapZoom;
  final LatLng mapLatLng;

  MapUpdated({
    required this.mapZoom,
    required this.mapLatLng,
  });
}

class MapState extends Equatable {
  final double mapZoom;
  final LatLng mapLatLng;

  const MapState({
    required this.mapZoom,
    required this.mapLatLng,
  });

  @override
  List<Object?> get props => [mapZoom, mapLatLng];

  MapState copyWith({
    double? mapZoom,
    LatLng? mapLatLng,
  }) {
    return MapState(
      mapZoom: mapZoom ?? this.mapZoom,
      mapLatLng: mapLatLng ?? this.mapLatLng,
    );
  }
}
