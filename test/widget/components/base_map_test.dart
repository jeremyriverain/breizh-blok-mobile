// ignore_for_file: avoid_print

import 'package:breizh_blok_mobile/blocs/map_permission_bloc.dart';
import 'package:breizh_blok_mobile/components/base_map.dart';
import 'package:breizh_blok_mobile/location_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([MockSpec<Location>()])
import 'base_map_test.mocks.dart';

void main() {
  group('baseMap', () {
    testWidgets(
        'dont call location service if user has already denied permission',
        (tester) async {
      final mapPermissionBloc = MapPermissionBloc()
        ..add(RequestPermissionEvent(hasDenied: true));
      final location = MockLocation();

      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider(
            create: (context) => mapPermissionBloc,
            child: LocationProvider(
              locationInstance: location,
              child: Builder(
                builder: (context) {
                  return const BaseMap(
                    map: GoogleMap(
                      initialCameraPosition:
                          CameraPosition(target: LatLng(0, 0)),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      );

      verifyNever(location.serviceEnabled());
    });

    Future<void> requestPermissionIfUserHasNotAlreadyDenied(
      WidgetTester tester, {
      required PermissionStatus requestPermissionMockResult,
    }) async {
      final mapPermissionBloc = MapPermissionBloc();
      final location = MockLocation();

      expect(mapPermissionBloc.state.hasDenied, false);
      expect(mapPermissionBloc.state.hasRequested, false);

      when(location.serviceEnabled()).thenAnswer((_) async => true);
      when(location.hasPermission())
          .thenAnswer((_) async => PermissionStatus.denied);

      when(location.requestPermission())
          .thenAnswer((_) async => requestPermissionMockResult);

      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider(
            create: (context) => mapPermissionBloc,
            child: LocationProvider(
              locationInstance: location,
              child: Builder(
                builder: (context) {
                  return const BaseMap(
                    map: GoogleMap(
                      initialCameraPosition:
                          CameraPosition(target: LatLng(0, 0)),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      );

      verify(location.serviceEnabled());
      verify(location.hasPermission());
      verify(location.requestPermission());
      expect(mapPermissionBloc.state.hasDenied, true);
      expect(mapPermissionBloc.state.hasRequested, true);
    }

    testWidgets('call location service if user has not denied permission',
        (tester) async {
      await requestPermissionIfUserHasNotAlreadyDenied(
        tester,
        requestPermissionMockResult: PermissionStatus.denied,
      );
    });

    testWidgets(
        'call location service if user has not denied permission forever',
        (tester) async {
      await requestPermissionIfUserHasNotAlreadyDenied(
        tester,
        requestPermissionMockResult: PermissionStatus.deniedForever,
      );
    });

    Future<void> doesNotRequestPermissionIfPermissionIsGranted(
      WidgetTester tester, {
      required PermissionStatus permissionGranted,
    }) async {
      final mapPermissionBloc = MapPermissionBloc();
      final location = MockLocation();

      expect(mapPermissionBloc.state.hasDenied, false);
      expect(mapPermissionBloc.state.hasRequested, false);

      when(location.serviceEnabled()).thenAnswer((_) async => true);
      when(location.hasPermission()).thenAnswer((_) async => permissionGranted);

      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider(
            create: (context) => mapPermissionBloc,
            child: LocationProvider(
              locationInstance: location,
              child: Builder(
                builder: (context) {
                  return const BaseMap(
                    map: GoogleMap(
                      initialCameraPosition:
                          CameraPosition(target: LatLng(0, 0)),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      );

      verify(location.serviceEnabled());
      verify(location.hasPermission());
      verifyNever(location.requestPermission());
    }

    testWidgets('does not request permission if permission is granted',
        (tester) async {
      await doesNotRequestPermissionIfPermissionIsGranted(
        tester,
        permissionGranted: PermissionStatus.granted,
      );
    });

    testWidgets('does not request permission if permission is granted limited',
        (tester) async {
      await doesNotRequestPermissionIfPermissionIsGranted(
        tester,
        permissionGranted: PermissionStatus.grantedLimited,
      );
    });
  });
}
