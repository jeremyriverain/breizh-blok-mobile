import 'package:breizh_blok_map_launcher/breizh_blok_map_launcher.dart';
import 'package:breizh_blok_map_launcher/src/map_launcher_impl.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';

void main() {
  group('MapLauncherImpl', () {
    late MapLauncher mapLauncher;

    void mockMapLauncher({
      required WidgetTester tester,
      required List<Map<String, String>> Function() handler,
    }) {
      const channel = MethodChannel('map_launcher');

      tester.binding.defaultBinaryMessenger.setMockMethodCallHandler(channel, (
        methodCall,
      ) async {
        if (methodCall.method == 'getInstalledMaps') {
          return handler();
        }
        return null;
      });
    }

    setUp(() {
      mapLauncher = const MapLauncherImpl();
    });
    group('installedMaps', () {
      testWidgets('return installed maps', (tester) async {
        mockMapLauncher(
          tester: tester,
          handler: () => [
            {'mapName': 'Google Maps', 'mapType': 'google'},
            {'mapName': 'Apple map', 'mapType': 'apple'},
          ],
        );

        final result = await mapLauncher.availableMaps.run();
        expect(result.isRight(), isTrue);

        final maps = result.getOrElse(
          (l) => [],
        );
        expect(
          maps.length,
          equals(2),
        );

        expect(
          maps,
          isA<List<AvailableMap>>()
              .having(
                (a) => a.first.name,
                'name of 1st map',
                equals('Google Maps'),
              )
              .having(
                (a) => a.last.name,
                'name of 1st map',
                equals('Apple map'),
              ),
        );
      });

      testWidgets('return left result if error', (tester) async {
        mockMapLauncher(
          tester: tester,
          handler: () => throw Exception('foo'),
        );

        final result = await mapLauncher.availableMaps.run();
        expect(result.isLeft(), isTrue);

        expect(
          result.getLeft(),
          isA<Some<MapLauncherException>>(),
        );
      });
    });
  });
}
