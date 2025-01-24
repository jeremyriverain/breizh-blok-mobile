import 'package:bloc_test/bloc_test.dart';
import 'package:breizh_blok_mobile/blocs/map_bloc.dart';
import 'package:breizh_blok_mobile/domain/models/location.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  group('MapBloc', () {
    blocTest<MapBloc, MapState>(
      'default state OK',
      build: MapBloc.new,
      verify: (MapBloc bloc) {
        expect(
          bloc.state,
          const MapState(
            mapZoom: 7,
            mapLatLng: kDefaultInitialPosition,
          ),
        );
      },
    );

    blocTest<MapBloc, MapState>(
      'initial state OK',
      build: () => MapBloc(
        initialState: const MapState(
          mapZoom: 5,
          mapLatLng: LatLng(10, 20),
        ),
      ),
      verify: (MapBloc bloc) {
        expect(
          bloc.state,
          const MapState(
            mapZoom: 5,
            mapLatLng: LatLng(10, 20),
          ),
        );
      },
    );

    blocTest<MapBloc, MapState>(
      'MapUpdated event OK',
      build: MapBloc.new,
      act: (MapBloc bloc) => bloc.add(
        MapUpdated(
          mapZoom: 5,
          mapLatLng: const LatLng(10, 20),
        ),
      ),
      expect: () => [
        const MapState(
          mapZoom: 5,
          mapLatLng: LatLng(10, 20),
        ),
      ],
    );
  });
}
