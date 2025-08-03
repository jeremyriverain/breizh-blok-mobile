import 'package:breizh_blok_mobile/domain/repositories/boulder_feedback_repository.dart';
import 'package:breizh_blok_mobile/ui/boulder/widgets/contribute/contribute_boulder_map_screen.dart';
import 'package:breizh_blok_mobile/ui/boulder/widgets/contribute/contribute_boulder_screen.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';

import '../../../../mocks.dart';
import '../../../../test_utils.dart';
import '../../../../widget_test_utils.dart';

void main() {
  group('ContributeBoulderScreen', () {
    late BoulderFeedbackRepository boulderFeedbackRepository;

    setUp(() {
      boulderFeedbackRepository = MockBoulderFeedbackRepository();
      GetIt.I.registerSingleton(boulderFeedbackRepository);
    });

    testWidgets(
      '''
Given I tap on "Affiner l'emplacement du bloc"
Then I go to ContributeBoulderMapScreen
''',
      (tester) async {
        await tester.myPumpWidget(
          widget: const ContributeBoulderScreen(boulder: fakeBoulder),
        );

        await tester.pump();

        await tester.tap(find.text("Affiner l'emplacement du bloc"));
        await tester.pumpAndSettle();

        expect(find.byType(ContributeBoulderMapScreen), findsOneWidget);
      },
    );
  });
}
