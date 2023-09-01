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
        expect(bloc.state.hasPermission, false);
      },
    );

    blocTest(
      'dont deny permission',
      build: () => MapPermissionBloc(),
      act: (MapPermissionBloc bloc) =>
          bloc.add(RequestPermissionEvent(hasDenied: false)),
      verify: (MapPermissionBloc bloc) async {
        expect(bloc.state.hasRequested, true);
        expect(bloc.state.hasDenied, false);
        expect(bloc.state.hasPermission, true);
      },
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
