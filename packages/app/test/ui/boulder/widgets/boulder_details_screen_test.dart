import 'package:breizh_blok_mobile/data/data_sources/api/model/paginated_collection.dart';
import 'package:breizh_blok_mobile/data/data_sources/api/model/request_strategy.dart';
import 'package:breizh_blok_mobile/data/repositories/boulder/boulder_repository.dart';
import 'package:breizh_blok_mobile/data/repositories/boulder_feedback/boulder_feedback_repository.dart';
import 'package:breizh_blok_mobile/domain/entities/boulder_feedback/boulder_feedback.dart';
import 'package:breizh_blok_mobile/domain/entities/domain_exception/domain_exception.dart';
import 'package:breizh_blok_mobile/ui/boulder/widgets/boulder_details_screen.dart';
import 'package:breizh_blok_mobile/ui/boulder/widgets/contribute_boulder_form_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../mocks.dart';
import '../../../test_utils.dart';
import '../../../widget_test_utils.dart';

void main() {
  late BoulderRepository boulderRepository;

  setUp(() {
    boulderRepository = MockBoulderRepository();
  });

  Future<void> pumpWidget(WidgetTester tester) async {
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
      when(
        () => boulderRepository.find('foo'),
      ).thenAnswer((_) async => fakeBoulder);
      when(
        () => boulderRepository.findBy(queryParams: any(named: 'queryParams')),
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
      late BoulderFeedbackRepository boulderFeedbackRepository;
      setUp(() {
        boulderFeedbackRepository = MockBoulderFeedbackRepository();
        GetIt.I.registerSingleton(boulderFeedbackRepository);
      });
      testWidgets(
        '''
Given I click on the Contribute ListTile
Then a ContributeBoulderFormView is displayed
''',
        (WidgetTester tester) async {
          when(
            () => boulderRepository.find('foo'),
          ).thenAnswer((_) async => fakeBoulder);
          when(
            () => boulderRepository.findBy(
              queryParams: any(named: 'queryParams'),
            ),
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
            () => boulderRepository.find('foo'),
          ).thenAnswer((_) async => fakeBoulder);
          when(
            () => boulderRepository.findBy(
              queryParams: any(named: 'queryParams'),
            ),
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

      testWidgets(
        '''
Given a ContributeBoulderFormView is displayed after tapping on Contribuer ListTile
And the form contains a message
When I click on Annuler and open again the dialog,
Then the previous message appears
''',
        (WidgetTester tester) async {
          when(
            () => boulderRepository.find('foo'),
          ).thenAnswer((_) async => fakeBoulder);
          when(
            () => boulderRepository.findBy(
              queryParams: any(named: 'queryParams'),
            ),
          ).thenAnswer(
            (_) async => PaginatedCollection(
              items: [fakeBoulder.copyWith(name: 'boulder associated')],
              totalItems: 1,
            ),
          );

          await pumpWidget(tester);

          await tester.tap(find.widgetWithText(ListTile, 'Contribuer'));

          await tester.pump();

          await tester.enterText(find.byType(ReactiveTextField<String>), 'foo');
          await tester.pump();

          await tester.tap(
            find.descendant(
              of: find.byType(ContributeBoulderFormView),
              matching: find.widgetWithText(TextButton, 'Annuler'),
            ),
          );

          await tester.pump();

          expect(find.byType(ContributeBoulderFormView), findsNothing);

          await tester.tap(find.widgetWithText(ListTile, 'Contribuer'));

          await tester.pump();

          expect(
            find.widgetWithText(ReactiveTextField<String>, 'foo'),
            findsOneWidget,
          );
        },
      );

      testWidgets(
        '''
Given the form is invalid,
When I submit it,
Then the message field displays a error message
''',
        (WidgetTester tester) async {
          when(
            () => boulderRepository.find('foo'),
          ).thenAnswer((_) async => fakeBoulder);
          when(
            () => boulderRepository.findBy(
              queryParams: any(named: 'queryParams'),
            ),
          ).thenAnswer(
            (_) async => PaginatedCollection(
              items: [fakeBoulder.copyWith(name: 'boulder associated')],
              totalItems: 1,
            ),
          );

          await pumpWidget(tester);

          await tester.tap(find.widgetWithText(ListTile, 'Contribuer'));

          await tester.pump();

          await tester.tap(
            find.descendant(
              of: find.byType(ContributeBoulderFormView),
              matching: find.widgetWithText(TextButton, 'Envoyer'),
            ),
          );

          await tester.pump();

          expect(
            find.widgetWithText(
              ReactiveTextField<String>,
              'Ce champ est obligatoire',
            ),
            findsOneWidget,
          );
        },
      );

      testWidgets(
        '''
Given the form is valid and I submit it,
If the repository returns an error,
Then a error message is displayed
''',
        (WidgetTester tester) async {
          when(
            () => boulderRepository.find('foo'),
          ).thenAnswer((_) async => fakeBoulder);
          when(
            () => boulderRepository.findBy(
              queryParams: any(named: 'queryParams'),
            ),
          ).thenAnswer(
            (_) async => PaginatedCollection(
              items: [fakeBoulder.copyWith(name: 'boulder associated')],
              totalItems: 1,
            ),
          );
          when(
            () => boulderFeedbackRepository.create(
              const BoulderFeedback(boulder: fakeBoulder, message: 'foo'),
            ),
          ).thenReturn(TaskEither.left(const UnknownException(message: 'bar')));

          await pumpWidget(tester);

          await tester.tap(find.widgetWithText(ListTile, 'Contribuer'));

          await tester.pump();

          await tester.enterText(find.byType(ReactiveTextField<String>), 'foo');
          await tester.pump();

          await tester.tap(
            find.descendant(
              of: find.byType(ContributeBoulderFormView),
              matching: find.widgetWithText(TextButton, 'Envoyer'),
            ),
          );

          await tester.pump();

          expect(
            find.descendant(
              of: find.byType(SnackBar),
              matching: find.text('Une erreur est survenue'),
            ),
            findsOneWidget,
          );

          expect(
            find.descendant(
              of: find.byType(ContributeBoulderFormView),
              matching: find.byType(AlertDialog),
            ),
            findsOneWidget,
          );
        },
      );

      testWidgets(
        '''
Given the form is valid and I submit it,
If the repository returns a successful response,
Then a success message is displayed
And the ContributeBoulderFormView disappears
''',
        (WidgetTester tester) async {
          when(
            () => boulderRepository.find('foo'),
          ).thenAnswer((_) async => fakeBoulder);
          when(
            () => boulderRepository.findBy(
              queryParams: any(named: 'queryParams'),
            ),
          ).thenAnswer(
            (_) async => PaginatedCollection(
              items: [fakeBoulder.copyWith(name: 'boulder associated')],
              totalItems: 1,
            ),
          );
          when(
            () => boulderFeedbackRepository.create(
              const BoulderFeedback(boulder: fakeBoulder, message: 'foo'),
            ),
          ).thenAnswer(
            (_) => TaskEither.tryCatch(() async {
              await Future<void>.delayed(const Duration(seconds: 1));
            }, (_, __) => const UnknownException(message: 'foo')),
          );

          await pumpWidget(tester);

          await tester.tap(find.widgetWithText(ListTile, 'Contribuer'));

          await tester.pump();

          await tester.enterText(find.byType(ReactiveTextField<String>), 'foo');
          await tester.pump();

          expect(
            tester
                .widget<TextButton>(
                  find.descendant(
                    of: find.byType(ContributeBoulderFormView),
                    matching: find.widgetWithText(TextButton, 'Annuler'),
                  ),
                )
                .enabled,
            isTrue,
          );

          expect(
            tester
                .widget<TextButton>(
                  find.descendant(
                    of: find.byType(ContributeBoulderFormView),
                    matching: find.widgetWithText(TextButton, 'Envoyer'),
                  ),
                )
                .enabled,
            isTrue,
          );

          await tester.tap(
            find.descendant(
              of: find.byType(ContributeBoulderFormView),
              matching: find.widgetWithText(TextButton, 'Envoyer'),
            ),
          );

          await tester.pump();
          expect(find.byType(CircularProgressIndicator), findsOneWidget);

          expect(
            tester
                .widget<TextButton>(
                  find.descendant(
                    of: find.byType(ContributeBoulderFormView),
                    matching: find.widgetWithText(TextButton, 'Annuler'),
                  ),
                )
                .enabled,
            isFalse,
          );

          expect(
            tester
                .widget<TextButton>(
                  find.descendant(
                    of: find.byType(ContributeBoulderFormView),
                    matching: find.widgetWithText(TextButton, 'Envoyer'),
                  ),
                )
                .enabled,
            isFalse,
          );

          await tester.pump(const Duration(seconds: 1));

          expect(
            find.descendant(
              of: find.byType(SnackBar),
              matching: find.text('Merci, votre message a été envoyé'),
            ),
            findsOneWidget,
          );

          expect(
            find.descendant(
              of: find.byType(ContributeBoulderFormView),
              matching: find.byType(AlertDialog),
            ),
            findsNothing,
          );
        },
      );
    });
  });
}
