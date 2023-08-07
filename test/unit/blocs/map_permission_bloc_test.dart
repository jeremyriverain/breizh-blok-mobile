import 'package:bloc_test/bloc_test.dart';
import 'package:breizh_blok_mobile/blocs/map_permission_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('MapPermissionBloc', () {
    blocTest(
      'default state OK',
      build: () => MapPermissionBloc(),
      verify: (MapPermissionBloc bloc) async {
        expect(bloc.state.hasRequested, false);
        expect(bloc.state.hasDenied, false);
      },
    );

    blocTest(
      'dont deny permission',
      build: () => MapPermissionBloc(),
      act: (MapPermissionBloc bloc) =>
          bloc.add(RequestPermissionEvent(hasDenied: false)),
      expect: () =>
          [const MapPermissionState(hasRequested: true, hasDenied: false)],
    );

    blocTest(
      'deny permission',
      build: () => MapPermissionBloc(),
      act: (MapPermissionBloc bloc) =>
          bloc.add(RequestPermissionEvent(hasDenied: true)),
      expect: () =>
          [const MapPermissionState(hasRequested: true, hasDenied: true)],
    );
  });
}
