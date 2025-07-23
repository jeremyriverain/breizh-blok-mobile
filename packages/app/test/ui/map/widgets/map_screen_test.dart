import 'package:breizh_blok_mobile/data/repositories/boulder_marker/boulder_marker_repository.dart';
import 'package:breizh_blok_mobile/ui/core/widgets/my_map.dart';
import 'package:breizh_blok_mobile/ui/map/widgets/map_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mocks.dart';
import '../../../widget_test_utils.dart';

void main() {
  group('MapScreen', () {
    late BoulderMarkerRepository boulderMarkerRepository;

    setUp(() {
      boulderMarkerRepository = MockBoulderMarkerRepository();
    });

    testWidgets(
      '''
Given the markers cannot be retrieved,
Then an error message is displayed inside a banner
''',
      (tester) async {
        when(() => boulderMarkerRepository.findAll()).thenThrow((_) {
          throw Exception('foo');
        });

        await tester.myPumpWidget(
          widget: RepositoryProvider(
            create: (context) => boulderMarkerRepository,
            child: const MapScreen(),
          ),
        );
        await tester.pump();
        expect(find.byType(MyMap), findsOneWidget);

        expect(
          find.widgetWithText(
            MaterialBanner,
            "Une erreur est survenue pendant l'affichage de la carte",
          ),
          findsOneWidget,
        );

        verify(() => boulderMarkerRepository.findAll()).called(1);
        verifyNoMoreInteractions(boulderMarkerRepository);
      },
    );

    testWidgets(
      '''
Given the markers cannot be retrieved,
When I click on the try again button,
Then an attempt to fetch the markers is done
''',
      (tester) async {
        when(() => boulderMarkerRepository.findAll()).thenThrow((_) {
          throw Exception('foo');
        });
        await tester.myPumpWidget(
          widget: RepositoryProvider(
            create: (context) => boulderMarkerRepository,
            child: const MapScreen(),
          ),
        );
        await tester.pump();
        expect(find.byType(MyMap), findsOneWidget);

        expect(
          find.widgetWithText(
            MaterialBanner,
            "Une erreur est survenue pendant l'affichage de la carte",
          ),
          findsOneWidget,
        );

        await tester.tap(find.widgetWithText(TextButton, 'Essayer à nouveau'));
        await tester.pump();

        verify(() => boulderMarkerRepository.findAll()).called(2);

        verifyNoMoreInteractions(boulderMarkerRepository);
      },
    );

    testWidgets(
      '''
it displays a circular progress indicator while fetching markers
''',
      (tester) async {
        when(() => boulderMarkerRepository.findAll()).thenAnswer((_) async {
          await Future<void>.delayed(const Duration(seconds: 1));
          return [];
        });
        await tester.myPumpWidget(
          widget: RepositoryProvider(
            create: (context) => boulderMarkerRepository,
            child: const MapScreen(),
          ),
        );
        await tester.pump();
        expect(find.byType(CircularProgressIndicator), findsOneWidget);

        await tester.pump(const Duration(seconds: 1));
        expect(find.byType(CircularProgressIndicator), findsNothing);

        verify(() => boulderMarkerRepository.findAll()).called(1);
        verifyNoMoreInteractions(boulderMarkerRepository);
      },
    );
  });
}
