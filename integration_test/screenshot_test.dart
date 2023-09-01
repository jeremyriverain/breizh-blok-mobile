// ignore_for_file: avoid_print

import 'package:breizh_blok_mobile/blocs/map_permission_bloc.dart';
import 'package:breizh_blok_mobile/blocs/terms_of_use_bloc.dart';
import 'package:breizh_blok_mobile/components/boulder_list_tile.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:breizh_blok_mobile/main.dart' as app;

void main() async {
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    await binding.convertFlutterSurfaceToImage();
  });

  runApplication({required WidgetTester tester}) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(TermsOfUseBloc.termsOfUseAcceptanceKey, true);
    final mapPermissionBloc = MapPermissionBloc();
    mapPermissionBloc.add(RequestPermissionEvent(hasDenied: true));
    await app.main(mapPermissionBloc: mapPermissionBloc);
    await tester.pumpAndSettle();
  }

  testWidgets('screenshots', (WidgetTester tester) async {
    await runApplication(tester: tester);

    // homepage
    await binding.takeScreenshot('1_homepage-list-view');

    await tester.tap(find.text('Carte'));
    await tester.pumpAndSettle();
    await Future.delayed(const Duration(seconds: 10));
    await binding.takeScreenshot('2_homepage-map-view');

    await tester.tap(find.text('Index'));
    await tester.pumpAndSettle();
    await binding.takeScreenshot('3_homepage-index-view');

    // municipality details
    await tester.tap(find.text('Kerlouan'));
    await tester.pumpAndSettle();
    await binding.takeScreenshot('4_municipality-list-view');

    // boulder area details
    await tester.tap(find.text('Liste des secteurs'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Cremiou'));
    await tester.pumpAndSettle();
    await binding.takeScreenshot('5_boulder-area-list-view');

    await tester.tap(find.text('Description'));
    await tester.pumpAndSettle();
    await binding.takeScreenshot('6_boulder-area-description-view');

    await tester.tap(find.text('Carte'));
    await tester.pumpAndSettle(const Duration(seconds: 5));
    await binding.takeScreenshot('7_boulder-area-map-view');

    await tester.tap(find.text('Blocs'));
    await tester.pumpAndSettle();
    await tester.tap(find.byType(BoulderListTile).first);
    await tester.pumpAndSettle();
    await binding.takeScreenshot('8_boulder-details');
  });
}
