import 'dart:async';

import 'package:breizh_blok_mobile/ui/core/widgets/my_map_location_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:location/location.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mocks.dart';
import '../../../widget_test_utils.dart';

void main() {
  group('MyMapLocationButton', () {
    late Location location;

    setUp(() {
      location = MockLocation();
    });
    testWidgets(
      '''
Given isLocation is equal to true,
When I click on the button,
Then the onHideLocation callback is called
''',
      (tester) async {
        final completer = Completer<void>();

        await tester.myPumpWidget(
          widget: MyMapLocationButton(
            isLocationShown: true,
            onHideLocation: () async {
              completer.complete();
            },
            onShowLocation: () async {},
          ),
        );

        await tester.pump();

        expect(completer.isCompleted, isFalse);

        expect(find.byIcon(Icons.location_off), findsOneWidget);

        await tester.tap(find.byType(IconButton));
        await tester.pump();

        expect(completer.isCompleted, isTrue);
      },
    );

    testWidgets(
      '''
Given isLocation is equal to true,
Ans I click on the button,
And the onHideLocation callback throws an exception,
Then the exception is properly caught
''',
      (tester) async {
        await tester.myPumpWidget(
          widget: MyMapLocationButton(
            isLocationShown: true,
            onHideLocation: () async {
              throw Exception();
            },
            onShowLocation: () async {},
          ),
        );

        await tester.pump();

        expect(find.byIcon(Icons.location_off), findsOneWidget);

        await tester.tap(find.byType(IconButton));
        await tester.pump();
      },
    );

    testWidgets(
      '''
Given isLocation is equal to false,
And location permission is granted,
When I click on the button,
Then the onShowLocation callback is called
''',
      (tester) async {
        GetIt.I.registerLazySingleton<Location>(() => location);
        final completer = Completer<void>();

        when(() => location.serviceEnabled()).thenAnswer((_) async => true);

        when(
          () => location.hasPermission(),
        ).thenAnswer((_) async => PermissionStatus.granted);

        await tester.myPumpWidget(
          widget: MyMapLocationButton(
            isLocationShown: false,
            onHideLocation: () async {},
            onShowLocation: () async {
              completer.complete();
            },
          ),
        );

        await tester.pump();

        expect(completer.isCompleted, isFalse);

        expect(find.byIcon(Icons.my_location), findsOneWidget);

        await tester.tap(find.byType(IconButton));
        await tester.pump();

        expect(completer.isCompleted, isTrue);

        verify(() => location.serviceEnabled()).called(1);
        verify(() => location.hasPermission()).called(1);
        verifyNoMoreInteractions(location);
      },
    );

    testWidgets(
      '''
Given isLocation is equal to false,
And location permission is denied forever,
When I click on the button,
Then the onShowLocation callback is not called
''',
      (tester) async {
        GetIt.I.registerLazySingleton<Location>(() => location);
        final completer = Completer<void>();

        when(() => location.serviceEnabled()).thenAnswer((_) async => true);

        when(
          () => location.hasPermission(),
        ).thenAnswer((_) async => PermissionStatus.deniedForever);

        await tester.myPumpWidget(
          widget: MyMapLocationButton(
            isLocationShown: false,
            onHideLocation: () async {},
            onShowLocation: () async {
              completer.complete();
            },
          ),
        );

        await tester.pump();

        expect(completer.isCompleted, isFalse);

        expect(find.byIcon(Icons.my_location), findsOneWidget);

        await tester.tap(find.byType(IconButton));
        await tester.pump();

        expect(completer.isCompleted, isFalse);

        verify(() => location.serviceEnabled()).called(1);
        verify(() => location.hasPermission()).called(1);
        verifyNoMoreInteractions(location);
      },
    );

    testWidgets(
      '''
Given isLocation is equal to false,
And location permission is denied,
And the permission requested is granted
When I click on the button,
Then the onShowLocation callback is called
''',
      (tester) async {
        GetIt.I.registerLazySingleton<Location>(() => location);
        final completer = Completer<void>();

        when(() => location.serviceEnabled()).thenAnswer((_) async => true);

        when(
          () => location.hasPermission(),
        ).thenAnswer((_) async => PermissionStatus.denied);

        when(
          () => location.requestPermission(),
        ).thenAnswer((_) async => PermissionStatus.granted);

        await tester.myPumpWidget(
          widget: MyMapLocationButton(
            isLocationShown: false,
            onHideLocation: () async {},
            onShowLocation: () async {
              completer.complete();
            },
          ),
        );

        await tester.pump();

        expect(completer.isCompleted, isFalse);

        expect(find.byIcon(Icons.my_location), findsOneWidget);

        await tester.tap(find.byType(IconButton));
        await tester.pump();

        expect(completer.isCompleted, isTrue);

        verify(() => location.serviceEnabled()).called(1);
        verify(() => location.hasPermission()).called(1);
        verify(() => location.requestPermission()).called(1);
        verifyNoMoreInteractions(location);
      },
    );

    testWidgets(
      '''
Given isLocation is equal to false,
And location permission is denied,
And the permission requested is granted limited
When I click on the button,
Then the onShowLocation callback is called
''',
      (tester) async {
        GetIt.I.registerLazySingleton<Location>(() => location);
        final completer = Completer<void>();

        when(() => location.serviceEnabled()).thenAnswer((_) async => true);

        when(
          () => location.hasPermission(),
        ).thenAnswer((_) async => PermissionStatus.denied);

        when(
          () => location.requestPermission(),
        ).thenAnswer((_) async => PermissionStatus.grantedLimited);

        await tester.myPumpWidget(
          widget: MyMapLocationButton(
            isLocationShown: false,
            onHideLocation: () async {},
            onShowLocation: () async {
              completer.complete();
            },
          ),
        );

        await tester.pump();

        expect(completer.isCompleted, isFalse);

        expect(find.byIcon(Icons.my_location), findsOneWidget);

        await tester.tap(find.byType(IconButton));
        await tester.pump();

        expect(completer.isCompleted, isTrue);

        verify(() => location.serviceEnabled()).called(1);
        verify(() => location.hasPermission()).called(1);
        verify(() => location.requestPermission()).called(1);
        verifyNoMoreInteractions(location);
      },
    );

    testWidgets(
      '''
Given isLocation is equal to false,
And location permission is denied,
And the permission requested is neither granted nor granted limited
When I click on the button,
Then the onShowLocation callback is not called
''',
      (tester) async {
        GetIt.I.registerLazySingleton<Location>(() => location);
        final completer = Completer<void>();

        when(() => location.serviceEnabled()).thenAnswer((_) async => true);

        when(
          () => location.hasPermission(),
        ).thenAnswer((_) async => PermissionStatus.denied);

        when(
          () => location.requestPermission(),
        ).thenAnswer((_) async => PermissionStatus.denied);

        await tester.myPumpWidget(
          widget: MyMapLocationButton(
            isLocationShown: false,
            onHideLocation: () async {},
            onShowLocation: () async {
              completer.complete();
            },
          ),
        );

        await tester.pump();

        expect(completer.isCompleted, isFalse);

        expect(find.byIcon(Icons.my_location), findsOneWidget);

        await tester.tap(find.byType(IconButton));
        await tester.pump();

        expect(completer.isCompleted, isFalse);

        verify(() => location.serviceEnabled()).called(1);
        verify(() => location.hasPermission()).called(1);
        verify(() => location.requestPermission()).called(1);
        verifyNoMoreInteractions(location);
      },
    );

    testWidgets(
      '''
Given isLocation is equal to false,
And service is not enabled,
And service request is not accepted,
When I click on the button,
Then the onShowLocation callback is not called
''',
      (tester) async {
        GetIt.I.registerLazySingleton<Location>(() => location);
        final completer = Completer<void>();

        when(() => location.serviceEnabled()).thenAnswer((_) async => false);

        when(() => location.requestService()).thenAnswer((_) async => false);

        await tester.myPumpWidget(
          widget: MyMapLocationButton(
            isLocationShown: false,
            onHideLocation: () async {},
            onShowLocation: () async {
              completer.complete();
            },
          ),
        );

        await tester.pump();

        expect(completer.isCompleted, isFalse);

        expect(find.byIcon(Icons.my_location), findsOneWidget);

        await tester.tap(find.byType(IconButton));
        await tester.pump();

        expect(completer.isCompleted, isFalse);

        verify(() => location.serviceEnabled()).called(1);
        verify(() => location.requestService()).called(1);
        verifyNoMoreInteractions(location);
      },
    );

    testWidgets(
      '''
Given isLocation is equal to false,
And location permission is granted,
And onShowLocation throws an exception,
Then the onShowLocation exception is properly caught 
''',
      (tester) async {
        GetIt.I.registerLazySingleton<Location>(() => location);

        when(() => location.serviceEnabled()).thenAnswer((_) async => true);

        when(
          () => location.hasPermission(),
        ).thenAnswer((_) async => PermissionStatus.granted);

        await tester.myPumpWidget(
          widget: MyMapLocationButton(
            isLocationShown: false,
            onHideLocation: () async {},
            onShowLocation: () async {
              throw Exception();
            },
          ),
        );

        await tester.pump();

        await tester.tap(find.byType(IconButton));
        await tester.pump();

        verify(() => location.serviceEnabled()).called(1);
        verify(() => location.hasPermission()).called(1);
        verifyNoMoreInteractions(location);
      },
    );
  });
}
