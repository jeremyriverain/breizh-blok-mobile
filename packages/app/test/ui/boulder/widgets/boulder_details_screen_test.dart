import 'package:breizh_blok_mobile/data/data_sources/api/model/paginated_collection.dart';
import 'package:breizh_blok_mobile/data/data_sources/api/model/request_strategy.dart';
import 'package:breizh_blok_mobile/data/repositories/boulder/boulder_repository.dart';
import 'package:breizh_blok_mobile/services/feature_flags.dart';
import 'package:breizh_blok_mobile/ui/boulder/widgets/boulder_details_screen.dart';
import 'package:breizh_blok_mobile/ui/boulder/widgets/contribute_boulder_form_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../test_utils.dart';
import '../../../widget_test_utils.dart';

@GenerateNiceMocks([MockSpec<BoulderRepository>()])
import './boulder_details_screen_test.mocks.dart';

void main() {
  late BoulderRepository boulderRepository;

  setUp(() {
    boulderRepository = MockBoulderRepository();
  });

  Future<void> pumpWidget(WidgetTester tester) async {
    GetIt.I.registerSingleton<FeatureFlags>(
      const FeatureFlags(canCreateBoulderFeedback: true),
    );
    await tester.myPumpWidget(
      widget: RepositoryProvider(
        create: (context) => RequestStrategy(),
        child: RepositoryProvider<BoulderRepository>(
          create: (context) => boulderRepository,
          child: const BoulderDetailsScreen(id: 'foo'),
        ),
      ),
    );
    await tester.pump();
  }

  group('BoulderDetailsScreen', () {
    testWidgets('display name of the boulder in the AppBar', (
      WidgetTester tester,
    ) async {
      when(boulderRepository.find('foo')).thenAnswer((_) async => fakeBoulder);
      when(
        boulderRepository.findBy(queryParams: anyNamed('queryParams')),
      ).thenAnswer(
        (_) async => PaginatedCollection(
          items: [fakeBoulder.copyWith(name: 'boulder associated')],
          totalItems: 1,
        ),
      );

      await pumpWidget(tester);

      expect(find.widgetWithText(AppBar, fakeBoulder.name), findsOneWidget);
    });

    group('Contribute', () {
      testWidgets(
        '''
Given I click on the Contribute ListTile
Then a ContributeBoulderFormView is displayed
''',
        (WidgetTester tester) async {
          when(
            boulderRepository.find('foo'),
          ).thenAnswer((_) async => fakeBoulder);
          when(
            boulderRepository.findBy(queryParams: anyNamed('queryParams')),
          ).thenAnswer(
            (_) async => PaginatedCollection(
              items: [fakeBoulder.copyWith(name: 'boulder associated')],
              totalItems: 1,
            ),
          );

          await pumpWidget(tester);

          expect(find.widgetWithText(ListTile, 'Contribuer'), findsOneWidget);

          await tester.tap(find.widgetWithText(ListTile, 'Contribuer'));

          await tester.pump();

          expect(find.byType(ContributeBoulderFormView), findsOneWidget);
        },
      );

      testWidgets(
        '''
Given a ContributeBoulderFormView is displayed after tapping on Contribuer ListTile
When I click on Annuler
Then the ContributeBoulderFormView disappears
''',
        (WidgetTester tester) async {
          when(
            boulderRepository.find('foo'),
          ).thenAnswer((_) async => fakeBoulder);
          when(
            boulderRepository.findBy(queryParams: anyNamed('queryParams')),
          ).thenAnswer(
            (_) async => PaginatedCollection(
              items: [fakeBoulder.copyWith(name: 'boulder associated')],
              totalItems: 1,
            ),
          );

          await pumpWidget(tester);

          await tester.tap(find.widgetWithText(ListTile, 'Contribuer'));

          await tester.pump();

          expect(find.byType(ContributeBoulderFormView), findsOneWidget);

          await tester.tap(
            find.descendant(
              of: find.byType(ContributeBoulderFormView),
              matching: find.widgetWithText(TextButton, 'Annuler'),
            ),
          );

          await tester.pump();

          expect(find.byType(ContributeBoulderFormView), findsNothing);
        },
      );
    });
  });
}
