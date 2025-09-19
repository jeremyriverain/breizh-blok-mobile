import 'package:breizh_blok_mobile/service_locator/service_locator.dart';
import 'package:breizh_blok_mobile/ui/core/widgets/main_navigation_bar.dart';
import 'package:breizh_blok_url_launcher/breizh_blok_url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:go_router/go_router.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mocks.dart';
import '../../../widget_test_utils.dart';

void main() {
  group('MainNavigationBar', () {
    group('support menu item', () {
      late StatefulNavigationShell statefulNavigationShell;
      late UrlLauncher urlLauncher;

      setUp(() {
        statefulNavigationShell = MockStatefulNavigationShell();
        urlLauncher = MockUrlLauncher();
      });
      testWidgets(
        '''
Given I click on "Soutenir"
Then I am redirected to sponsoring website
''',
        (tester) async {
          when(() => statefulNavigationShell.currentIndex).thenReturn(0);

          when(
            () => urlLauncher.openUrl(
              Uri.parse('https://buymeacoffee.com/breizhblok'),
            ),
          ).thenReturn(TaskEither<LaunchUrlException, bool>.of(true));
          await tester.myPumpWidget(
            overrides: [urlLauncherProvider.overrideWith((_) => urlLauncher)],
            widget: MainNavigationBar(navigationShell: statefulNavigationShell),
          );

          await tester.pump();

          expect(find.byType(NavigationDestination), findsNWidgets(5));

          await tester.tap(
            find.widgetWithText(NavigationDestination, 'Soutenir'),
          );

          await tester.pump();

          verify(
            () => urlLauncher.openUrl(
              Uri.parse('https://buymeacoffee.com/breizhblok'),
            ),
          ).called(1);
        },
      );
    });
  });
}
