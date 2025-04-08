// ignore_for_file: avoid_dynamic_calls

import 'package:breizh_blok_mobile/data/repositories/boulder_marker/boulder_marker_repository.dart';
import 'package:breizh_blok_mobile/ui/map/view_models/map_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../test_utils.dart';
import '../../../widget_test_utils.dart';

@GenerateNiceMocks([MockSpec<BoulderMarkerRepository>()])
import 'map_screen_view_model_test.mocks.dart';

void main() {
  group('MapScreenViewModel', () {
    late BoulderMarkerRepository boulderMarkerRepository;

    setUp(() {
      boulderMarkerRepository = MockBoulderMarkerRepository();
    });

    void mockBoulderMarkerRepository() {
      when(boulderMarkerRepository.findAll()).thenAnswer((_) async {
        return Future.value([fakeBoulderMarker]);
      });
    }

    ({Widget widget, MapScreenViewModel viewModel}) getTestWidget() {
      final viewModel = MapScreenViewModel(
        boulderMarkerRepository: boulderMarkerRepository,
      );

      return (
        viewModel: viewModel,
        widget: BlocProvider(
          create: (context) => viewModel,
          child: BlocBuilder<MapScreenViewModel, MapScreenStates>(
            builder: (context, state) {
              return switch (state) {
                MapScreenIdle() => const CircularProgressIndicator(),
                MapScreenOK() => const Text('ok'),
                MapScreenError() => const Text('error'),
              };
            },
          ),
        ),
      );
    }

    testWidgets('it transitions to error if there is an error', (tester) async {
      when(boulderMarkerRepository.findAll()).thenThrow(Exception());

      await myPump(tester, widget: getTestWidget().widget);

      await tester.pump();

      expect(find.text('error'), findsOneWidget);
    });

    testWidgets('fetches boulder markers when initializing', (tester) async {
      mockBoulderMarkerRepository();

      await myPump(tester, widget: getTestWidget().widget);

      await tester.pump();

      verify(boulderMarkerRepository.findAll()).called(1);

      verifyNoMoreInteractions(boulderMarkerRepository);
    });

    testWidgets('returns clusterSource correctly', (tester) async {
      mockBoulderMarkerRepository();

      final (:viewModel, :widget) = getTestWidget();

      await myPump(tester, widget: widget);

      await tester.pump();

      final state = viewModel.state as MapScreenOK;

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
