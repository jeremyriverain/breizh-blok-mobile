import 'package:bloc_test/bloc_test.dart';
import 'package:breizh_blok_mobile/blocs/map_bloc.dart';
import 'package:breizh_blok_mobile/utils/map_utils.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  group('MapBloc', () {
    blocTest(
      'default state OK',
      build: () => MapBloc(),
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

    blocTest('initial state OK',
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
        });

    blocTest(
      'MapUpdated event OK',
      build: () => MapBloc(),
      act: (MapBloc bloc) => bloc.add(MapUpdated(
        mapZoom: 5,
        mapLatLng: const LatLng(10, 20),
      )),
      expect: () => [
        const MapState(
          mapZoom: 5,
          mapLatLng: LatLng(10, 20),
        )
      ],
    );
  });
}
