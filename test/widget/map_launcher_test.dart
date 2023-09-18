// ignore_for_file: avoid_print, avoid_dynamic_calls

import 'package:breizh_blok_mobile/components/map_launcher_button.dart';
import 'package:breizh_blok_mobile/models/location.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final destination = Location(latitude: 56, longitude: 87);
  const destinationTitle = 'my destination';

  MaterialApp mountMapLauncherButton() {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          actions: [
            MapLauncherButton(
              destination: destination,
              destinationTitle: destinationTitle,
            ),
          ],
        ),
      ),
    );
  }

  testWidgets('button does not show up if there is no installed map',
      (tester) async {
    final logs = <MethodCall>[];

    const channel = MethodChannel('map_launcher');

    tester.binding.defaultBinaryMessenger.setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        print(methodCall);
        logs.add(methodCall);
        if (methodCall.method == 'getInstalledMaps') {
          return [];
        }
        return null;
      },
    );

    // Create the widget by telling the tester to build it.
    await tester.pumpWidget(mountMapLauncherButton());

    await tester.pumpAndSettle();

    expect(logs[0].method, equals('getInstalledMaps'));

    expect(find.byKey(const Key('map-launcher-button')), findsNothing);
  });

  testWidgets(
      'I can launch a map by opening a bottom sheet and selecting one map',
      (tester) async {
    final logs = <MethodCall>[];

    const channel = MethodChannel('map_launcher');

    tester.binding.defaultBinaryMessenger.setMockMethodCallHandler(channel,
        (MethodCall methodCall) async {
      print(methodCall);
      logs.add(methodCall);
      if (methodCall.method == 'getInstalledMaps') {
        return [
          {
            'mapName': 'Google Maps',
            'mapType': 'google',
          },
          {
            'mapName': 'Apple map',
            'mapType': 'apple',
          }
        ];
      }
      return null;
    });

    // Create the widget by telling the tester to build it.
    await tester.pumpWidget(mountMapLauncherButton());

    await tester.pumpAndSettle();

    expect(logs[0].method, equals('getInstalledMaps'));

    final mapLauncherButton = find.byKey(const Key('map-launcher-button'));

    expect(mapLauncherButton, findsOneWidget);

    await tester.tap(mapLauncherButton);

    await tester.pumpAndSettle();

    await tester.tap(find.textContaining('Google Maps', findRichText: true));

    expect(logs[1].method, equals('showDirections'));
    expect(logs[1].arguments['mapType'], equals('google'));
    expect(logs[1].arguments['destinationTitle'], equals(destinationTitle));
    expect(
      logs[1].arguments['destinationLatitude'],
      equals(destination.latitude.toString()),
    );
    expect(
      logs[1].arguments['destinationLongitude'],
      equals(destination.longitude.toString()),
    );
  });
}
