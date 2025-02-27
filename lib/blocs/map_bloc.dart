import 'package:breizh_blok_mobile/domain/models/location/location.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'map_bloc.freezed.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  MapBloc({MapState? initialState})
    : super(
        initialState ??
            const MapState(mapZoom: 7, mapLatLng: kDefaultInitialPosition),
      ) {
    on<MapUpdated>((event, emit) {
      emit(state.copyWith(mapZoom: event.mapZoom, mapLatLng: event.mapLatLng));
    });
  }
}

abstract class MapEvent {}

class MapUpdated extends MapEvent {
  MapUpdated({required this.mapZoom, required this.mapLatLng});

  final double mapZoom;
  final LatLng mapLatLng;
}

@freezed
abstract class MapState with _$MapState {
  const factory MapState({required double mapZoom, required LatLng mapLatLng}) =
      _MapState;
}
