// ignore_for_file: avoid_dynamic_calls

import 'package:breizh_blok_mobile/data/repositories/boulder_marker/boulder_marker_repository.dart';
import 'package:breizh_blok_mobile/domain/models/boulder_area/boulder_area.dart';
import 'package:breizh_blok_mobile/ui/boulder_area/view_models/boulder_area_map_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../test_utils.dart';
import '../../../widget_test_utils.dart';

@GenerateNiceMocks([MockSpec<BoulderMarkerRepository>()])
import 'boulder_area_map_view_model_test.mocks.dart';

void main() {
  group('BoulderAreaMapViewModel', () {
    late BoulderMarkerRepository boulderMarkerRepository;
    late List<MethodCall> logs;

    setUp(() {
      boulderMarkerRepository = MockBoulderMarkerRepository();
    });

    tearDown(() async {
      logs.clear();
    });

    void mockMapLauncher({
      required WidgetTester tester,
      List<Map<String, String>> installedMaps = const [],
    }) {
      logs = <MethodCall>[];

      const channel = MethodChannel('map_launcher');

      tester.binding.defaultBinaryMessenger.setMockMethodCallHandler(channel, (
        MethodCall methodCall,
      ) async {
        logs.add(methodCall);
        if (methodCall.method == 'getInstalledMaps') {
          return installedMaps;
        }
        return null;
      });
    }

    void mockBoulderMarkerRepository({required BoulderArea boulderArea}) {
      when(
        boulderMarkerRepository.findByBoulderArea(boulderArea: boulderArea),
      ).thenAnswer((_) async {
        return [fakeBoulderMarker];
      });
    }

    ({Widget widget, BoulderAreaMapViewModel viewModel}) getTestWidget({
      required BoulderArea boulderArea,
    }) {
      final viewModel = BoulderAreaMapViewModel(
        boulderArea: boulderArea,
        boulderMarkerRepository: boulderMarkerRepository,
      );

      return (
        viewModel: viewModel,
        widget: BlocProvider(
          create: (context) => viewModel,
          child: BlocBuilder<BoulderAreaMapViewModel, BoulderAreaMapStates>(
            builder: (context, state) {
              return switch (state) {
                BoulderAreaMapIdle() => const CircularProgressIndicator(),
                BoulderAreaMapOK() => ElevatedButton(
                  onPressed: () {
                    state.onClickParking?.call(context);
                  },
                  child: const Text('open maps'),
                ),
                BoulderAreaMapError() => const Text('error'),
              };
            },
          ),
        ),
      );
    }

    testWidgets('when it initializes, then it retrieves installed maps', (
      tester,
    ) async {
      mockBoulderMarkerRepository(boulderArea: fakeBoulderArea);

      mockMapLauncher(
        tester: tester,
        installedMaps: [
          {'mapName': 'Google Maps', 'mapType': 'google'},
          {'mapName': 'Apple map', 'mapType': 'apple'},
        ],
      );
      await myPumpAndSettle(
        tester,
        widget: getTestWidget(boulderArea: fakeBoulderArea).widget,
      );

      await tester.tap(find.text('open maps'));

      await tester.pumpAndSettle();

      expect(find.byKey(const Key('maps-modal-bottom-sheet')), findsOneWidget);

      await tester.tap(find.textContaining('Google Maps', findRichText: true));

      expect(logs[1].method, equals('showDirections'));
      expect(logs[1].arguments['mapType'], equals('google'));
      expect(
        logs[1].arguments['destinationTitle'],
        equals('Parking du secteur ${fakeBoulderArea.name}'),
      );
      expect(
        logs[1].arguments['destinationLatitude'],
        equals(fakeBoulderArea.parkingLocation?.latitude.toString()),
      );
      expect(
        logs[1].arguments['destinationLongitude'],
        equals(fakeBoulderArea.parkingLocation?.longitude.toString()),
      );
    });

    testWidgets(
      'if there is no available map, then the modal does not display',
      (tester) async {
        mockBoulderMarkerRepository(boulderArea: fakeBoulderArea);

        mockMapLauncher(tester: tester);

        await myPumpAndSettle(
          tester,
          widget: getTestWidget(boulderArea: fakeBoulderArea).widget,
        );

        await tester.tap(find.text('open maps'));

        await tester.pumpAndSettle();

        expect(find.byKey(const Key('maps-modal-bottom-sheet')), findsNothing);
      },
    );

    testWidgets('if parkingLocation is null, then the modal does not display', (
      tester,
    ) async {
      mockBoulderMarkerRepository(boulderArea: fakeBoulderArea);

      mockMapLauncher(
        tester: tester,
        installedMaps: [
          {'mapName': 'Google Maps', 'mapType': 'google'},
        ],
      );

      await myPumpAndSettle(
        tester,
        widget:
            getTestWidget(
              boulderArea: fakeBoulderArea.copyWith(parkingLocation: null),
            ).widget,
      );

      await tester.tap(find.text('open maps'));

      await tester.pumpAndSettle();

      expect(find.byKey(const Key('maps-modal-bottom-sheet')), findsNothing);
    });

    testWidgets('it transitions to error if there is an error', (tester) async {
      mockMapLauncher(tester: tester);

      when(
        boulderMarkerRepository.findByBoulderArea(boulderArea: fakeBoulderArea),
      ).thenThrow(Exception());

      await myPump(
        tester,
        widget: getTestWidget(boulderArea: fakeBoulderArea).widget,
      );

      await tester.pump();

      expect(find.text('error'), findsOneWidget);
    });

    testWidgets('fetches boulder markers when initializing', (tester) async {
      mockBoulderMarkerRepository(boulderArea: fakeBoulderArea);
      mockMapLauncher(tester: tester);

      await myPump(
        tester,
        widget: getTestWidget(boulderArea: fakeBoulderArea).widget,
      );

      await tester.pump();

      verify(
        boulderMarkerRepository.findByBoulderArea(boulderArea: fakeBoulderArea),
      ).called(1);

      verifyNoMoreInteractions(boulderMarkerRepository);
    });

    testWidgets('returns clusterSource correctly', (tester) async {
      mockBoulderMarkerRepository(boulderArea: fakeBoulderArea);
      mockMapLauncher(tester: tester);

      final (:viewModel, :widget) = getTestWidget(boulderArea: fakeBoulderArea);

      await myPump(tester, widget: widget);

      await tester.pump();

      final state = viewModel.state as BoulderAreaMapOK;

      expect(
        state.clusterSource,
        equals({
          'type': 'geojson',
          'cluster': true,
          'clusterMaxZoom': 20,
          'clusterRadius': 50,
          'data': {
            'type': 'FeatureCollection',
            'features': [fakeBoulderMarker.toGeojson()],
          },
        }),
      );
    });
  });
}
