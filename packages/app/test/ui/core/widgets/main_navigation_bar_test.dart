import 'package:breizh_blok_mobile/services/url_launcher/url_launcher.dart';
import 'package:breizh_blok_mobile/services/url_launcher/url_launcher_impl.dart';
import 'package:breizh_blok_mobile/ui/core/widgets/main_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mocks.dart';
import '../../../widget_test_utils.dart';

void main() {
  group('MainNavigationBar', () {
    group('support menu item', () {
      late StatefulNavigationShell statefulNavigationShell;
      late LaunchUrl launchUrl;
      late UrlLauncher urlLauncher;

      setUp(() {
        statefulNavigationShell = MockStatefulNavigationShell();
        launchUrl = MockLaunchUrl().call;
        urlLauncher = UrlLauncherImpl(launchUrl: launchUrl);
      });
      testWidgets(
        '''
Given I click on "Soutenir"
Then I am redirected to sponsoring website
''',
        (tester) async {
          GetIt.I.registerLazySingleton<UrlLauncher>(
            () => urlLauncher,
          );
          when(() => statefulNavigationShell.currentIndex).thenReturn(0);
          await tester.myPumpWidget(
            widget: MainNavigationBar(navigationShell: statefulNavigationShell),
          );

          await tester.pump();

          expect(find.byType(NavigationDestination), findsNWidgets(5));

          await tester.tap(
            find.widgetWithText(NavigationDestination, 'Soutenir'),
          );

          await tester.pump();

          verify(
            () => launchUrl.call(
              Uri.parse('https://buymeacoffee.com/breizhblok'),
            ),
          ).called(1);
        },
      );
    });
  });
}
