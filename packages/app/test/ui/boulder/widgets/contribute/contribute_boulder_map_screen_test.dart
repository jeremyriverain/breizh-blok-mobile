import 'package:breizh_blok_mobile/domain/repositories/boulder_feedback_repository.dart';
import 'package:breizh_blok_mobile/ui/boulder/forms/contribute_boulder_location_form.dart';
import 'package:breizh_blok_mobile/ui/boulder/view_models/contribute_boulder_map_view_model.dart';
import 'package:breizh_blok_mobile/ui/boulder/widgets/contribute/contribute_boulder_map_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';

import '../../../../mocks.dart';
import '../../../../test_utils.dart';
import '../../../../widget_test_utils.dart';

void main() {
  late BoulderFeedbackRepository boulderFeedbackRepository;
  late ContributeBoulderMapViewModel viewModel;

  setUp(() {
    boulderFeedbackRepository = MockBoulderFeedbackRepository();
    GetIt.I.registerSingleton(boulderFeedbackRepository);
    viewModel = ContributeBoulderMapViewModel(
      form: ContributeBoulderLocationForm(
        latitude: fakeBoulder.rock.location.latitude,
        longitude: fakeBoulder.rock.location.longitude,
      ),
      boulderFeedbackRepository: GetIt.I<BoulderFeedbackRepository>(),
      boulder: fakeBoulder,
    );
  });
  group('ContributeBoulderMapScreen', () {
    testWidgets('display initial latitude and longitude', (tester) async {
      expect(
        fakeBoulder.rock.location.latitude,
        isNot(equals(fakeBoulder.rock.location.longitude)),
      );

      await tester.myPumpWidget(
        widget: ContributeBoulderMapScreen(viewModel: viewModel),
      );

      await tester.pump();

      expect(
        find.descendant(
          of: find.ancestor(
            of: find.text('Latitude'),
            matching: find.byType(Column),
          ),
          matching: find.text(fakeBoulder.rock.location.latitude.toString()),
        ),
        findsOneWidget,
      );

      expect(
        find.descendant(
          of: find.ancestor(
            of: find.text('Longitude'),
            matching: find.byType(Column),
          ),
          matching: find.text(fakeBoulder.rock.location.longitude.toString()),
        ),
        findsOneWidget,
      );
    });

    testWidgets('submit button is initially disabled', (tester) async {
      await tester.myPumpWidget(
        widget: ContributeBoulderMapScreen(viewModel: viewModel),
      );

      await tester.pump();
      expect(
        tester
            .widget<FilledButton>(
              find.widgetWithText(FilledButton, "Valider l'emplacement"),
            )
            .enabled,
        isFalse,
      );
    });
  });
}
