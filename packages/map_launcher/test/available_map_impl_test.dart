import 'package:breizh_blok_map_launcher/src/available_map_impl.dart';
import 'package:breizh_blok_map_launcher/src/coords.dart';
import 'package:breizh_blok_map_launcher/src/exceptions.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:map_launcher/map_launcher.dart' as m;
import 'package:mocktail/mocktail.dart';

import 'mocks.dart';

void main() {
  setUpAll(() {
    registerFallbackValue(m.Coords(4, 2));
  });
  group('AvailableMapImpl', () {
    test('name is derived from originalMap.mapName', () {
      expect(
        AvailableMapImpl(
          map: m.AvailableMap(
            mapName: 'foo',
            mapType: m.MapType.apple,
            icon: 'bar',
          ),
        ).name,
        equals('foo'),
      );
    });

    test('icon is derived from originalMap.icon', () {
      expect(
        AvailableMapImpl(
          map: m.AvailableMap(
            mapName: 'foo',
            mapType: m.MapType.apple,
            icon: 'bar',
          ),
        ).icon,
        equals('bar'),
      );
    });

    group('showDirections', () {
      late m.AvailableMap map;
      late AvailableMapImpl availableMap;

      setUp(() {
        map = MockAvailableMap();
        availableMap = AvailableMapImpl(map: map);
      });
      test('when showDirections is successful', () async {
        when(
          () => map.showDirections(
            destination: any(
              named: 'destination',
              that: isA<m.Coords>()
                  .having(
                    (e) => e.latitude,
                    'latitude',
                    equals(1),
                  )
                  .having(
                    (e) => e.longitude,
                    'longitude',
                    equals(2),
                  ),
            ),
            destinationTitle: 'foo',
          ),
        ).thenAnswer((_) async => Future.value());

        final result = await availableMap
            .showDirections(
              destination: const Coords(latitude: 1, longitude: 2),
              destinationTitle: 'foo',
            )
            .run();

        verify(
          () => map.showDirections(
            destination: any(
              named: 'destination',
              that: isA<m.Coords>()
                  .having(
                    (e) => e.latitude,
                    'latitude',
                    equals(1),
                  )
                  .having(
                    (e) => e.longitude,
                    'longitude',
                    equals(2),
                  ),
            ),
            destinationTitle: 'foo',
          ),
        ).called(1);

        verifyNoMoreInteractions(map);

        expect(result.isRight(), isTrue);
      });

      test('when showDirections throws error', () async {
        when(
          () => map.showDirections(
            destination: any(
              named: 'destination',
              that: isA<m.Coords>()
                  .having(
                    (e) => e.latitude,
                    'latitude',
                    equals(1),
                  )
                  .having(
                    (e) => e.longitude,
                    'longitude',
                    equals(2),
                  ),
            ),
            destinationTitle: 'foo',
          ),
        ).thenThrow(Exception('foo'));

        final result = await availableMap
            .showDirections(
              destination: const Coords(latitude: 1, longitude: 2),
              destinationTitle: 'foo',
            )
            .run();

        verify(
          () => map.showDirections(
            destination: any(
              named: 'destination',
              that: isA<m.Coords>()
                  .having(
                    (e) => e.latitude,
                    'latitude',
                    equals(1),
                  )
                  .having(
                    (e) => e.longitude,
                    'longitude',
                    equals(2),
                  ),
            ),
            destinationTitle: 'foo',
          ),
        ).called(1);

        verifyNoMoreInteractions(map);

        expect(result.isLeft(), isTrue);

        expect(
          result.getLeft().toNullable(),
          isA<MapLauncherException>().having(
            (e) => e.message,
            'message',
            equals('Exception: foo'),
          ),
        );
      });
    });
  });
}
