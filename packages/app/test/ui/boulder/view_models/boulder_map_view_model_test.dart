// ignore_for_file: avoid_dynamic_calls

import 'package:breizh_blok_mobile/ui/boulder/view_models/boulder_map_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../test_utils.dart';
import '../../../widget_test_utils.dart';

void main() {
  group('BoulderMapViewModel', () {
    Widget getTestWidget() {
      return BlocProvider(
        create: (context) => BoulderMapViewModel(boulder: fakeBoulder),
        child: BlocBuilder<BoulderMapViewModel, BoulderMapStates>(
          builder: (context, state) {
            return switch (state) {
              BoulderMapIdle() => const CircularProgressIndicator(),
              BoulderMapOK() => ElevatedButton(
                onPressed: () async {
                  await state.onClickMarker?.call(context);
                },
                child: const Text('open maps'),
              ),
            };
          },
        ),
      );
    }

    testWidgets('when it initializes, then it retrieves installed maps', (
      tester,
    ) async {
      final logs = <MethodCall>[];

      const channel = MethodChannel('map_launcher');

      tester.binding.defaultBinaryMessenger.setMockMethodCallHandler(channel, (
        MethodCall methodCall,
      ) async {
        logs.add(methodCall);
        if (methodCall.method == 'getInstalledMaps') {
          return [
            {'mapName': 'Google Maps', 'mapType': 'google'},
            {'mapName': 'Apple map', 'mapType': 'apple'},
          ];
        }
        return null;
      });
      await tester.myPumpWidget(widget: getTestWidget());
      await tester.pump();

      await tester.tap(find.text('open maps'));

      await tester.pumpAndSettle();

      expect(find.byKey(const Key('maps-modal-bottom-sheet')), findsOneWidget);

      await tester.tap(find.textContaining('Google Maps', findRichText: true));

      expect(logs[1].method, equals('showDirections'));
      expect(logs[1].arguments['mapType'], equals('google'));
      expect(logs[1].arguments['destinationTitle'], equals(fakeBoulder.name));
      expect(
        logs[1].arguments['destinationLatitude'],
        equals(fakeBoulder.rock.location.latitude.toString()),
      );
      expect(
        logs[1].arguments['destinationLongitude'],
        equals(fakeBoulder.rock.location.longitude.toString()),
      );
    });

    testWidgets(
      'if there is no available map, then the modal does not display',
      (tester) async {
        final logs = <MethodCall>[];

        const channel = MethodChannel('map_launcher');

        tester.binding.defaultBinaryMessenger.setMockMethodCallHandler(
          channel,
          (MethodCall methodCall) async {
            logs.add(methodCall);
            if (methodCall.method == 'getInstalledMaps') {
              return [];
            }
            return null;
          },
        );
        await tester.myPumpWidget(widget: getTestWidget());
        await tester.pump();

        await tester.tap(find.text('open maps'));

        await tester.pumpAndSettle();

        expect(find.byKey(const Key('maps-modal-bottom-sheet')), findsNothing);
      },
    );
  });
}
