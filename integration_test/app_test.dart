// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:breizh_blok_mobile/app_http_client.dart';
import 'package:breizh_blok_mobile/blocs/map_permission_bloc.dart';
import 'package:breizh_blok_mobile/blocs/terms_of_use_bloc.dart';
import 'package:breizh_blok_mobile/components/boulder_details_associated_item.dart';
import 'package:breizh_blok_mobile/components/boulder_list_tile.dart';
import 'package:breizh_blok_mobile/components/line_boulder_image.dart';
import 'package:breizh_blok_mobile/components/map_launcher_button.dart';
import 'package:breizh_blok_mobile/components/municipality_details_boulder_area_item.dart';
import 'package:breizh_blok_mobile/database/app_database.dart';
import 'package:breizh_blok_mobile/main.dart' as app;
import 'package:breizh_blok_mobile/models/boulder.dart';
import 'package:breizh_blok_mobile/repositories/boulder_repository.dart';
import 'package:breizh_blok_mobile/repositories/department_repository.dart';
import 'package:breizh_blok_mobile/repositories/grade_repository.dart';
import 'package:breizh_blok_mobile/repositories/municipality_repository.dart';
import 'package:drift/drift.dart'
    show StringExpressionOperators, Value, driftRuntimeOptions;
import 'package:drift/native.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:integration_test/integration_test.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

void main() async {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  final defaultBoulderQueryParams = {
    'order[id]': ['desc'],
  };

  final database = AppDatabase(NativeDatabase.memory());
  final httpClient = AppHttpClient(database: database);

  Future<void> clearDatabase(AppDatabase database) async {
    await database.transaction(() async {
      for (final table in database.allTables) {
        await database.delete(table).go();
      }
    });
  }

  setUp(() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(TermsOfUseBloc.termsOfUseAcceptanceKey, true);
    await clearDatabase(database);
  });

  driftRuntimeOptions.dontWarnAboutMultipleDatabases = true;

  Future<void> restoreFlutterError(Future<void> Function() call) async {
    final originalOnError = FlutterError.onError!;
    await call();
    final overriddenOnError = FlutterError.onError!;

    // restore FlutterError.onError
    FlutterError.onError = (FlutterErrorDetails details) {
      if (overriddenOnError != originalOnError) overriddenOnError(details);
      originalOnError(details);
    };
  }

  Future<void> runApplication({required WidgetTester tester}) async {
    await restoreFlutterError(() async {
      final mapPermissionBloc = MapPermissionBloc()
        ..add(RequestPermissionEvent(hasDenied: true));
      await app.main(
        mapPermissionBloc: mapPermissionBloc,
        database: database,
      );
      await tester.pumpAndSettle();
    });
  }

  Future<void> closeFilterModal(WidgetTester tester) async {
    await tester.tapAt(const Offset(10, 10));
    await tester.pumpAndSettle();
  }

  testWidgets('I list boulders and show details about them',
      (WidgetTester tester) async {
    // prior to test, I fetch boulders to retrieve a reference
    // and assert boulders details dynamically
    final boulderRepository = BoulderRepository(
      httpClient: httpClient,
    );
    final bouldersResponse = await boulderRepository.findBy(
      queryParams: defaultBoulderQueryParams,
    );
    final boulderReference = bouldersResponse.items[0];

    expect(boulderReference, isNot(null));

    final prefs = await SharedPreferences.getInstance();
    print(prefs.getBool(TermsOfUseBloc.termsOfUseAcceptanceKey));

    await runApplication(tester: tester);

    expect(
      find.textContaining(RegExp(r'^\d+ blocs'), findRichText: true),
      findsOneWidget,
    );
    expect(
      find.text(
        '${boulderReference.name} (${boulderReference.grade?.name})',
        findRichText: true,
      ),
      findsWidgets,
    );

    expect(
      find.text(
        'Secteur: ${boulderReference.rock.boulderArea.name}',
        findRichText: true,
      ),
      findsWidgets,
    );

    expect(
      find.text(
        'Commune: ${boulderReference.rock.boulderArea.municipality.name}',
        findRichText: true,
      ),
      findsWidgets,
    );

    expect(
      find.byType(LineBoulderImage),
      findsWidgets,
    );

    // SHOW PAGE

    // tap on the first tile and show details
    await tester.tap(find.byType(BoulderListTile).first);

    await tester.pumpAndSettle();

    expect(
      find.text(
        boulderReference.name,
        findRichText: true,
      ),
      findsOneWidget,
    );

    if (boulderReference.lineBoulders.isNotEmpty) {
      expect(
        find.byType(LineBoulderImage),
        findsWidgets,
      );

      await tester.tap(find.byType(LineBoulderImage).first);

      await tester.pumpAndSettle();

      expect(find.byType(PhotoViewGallery), findsOneWidget);

      expect(
        find.text('Image 1/${boulderReference.lineBoulders.length}'),
        findsOneWidget,
      );

      await tester.tap(find.byTooltip("Quitter la galerie d'images"));

      await tester.pumpAndSettle();
    }

    await tester.scrollUntilVisible(
      find.textContaining('Secteur'),
      200,
      scrollable: find.descendant(
        of: find.byKey(
          const Key('boulder-details-list-view'),
        ),
        matching: find.byType(Scrollable),
      ),
    );

    expect(
      find.textContaining(
        boulderReference.rock.boulderArea.name,
      ),
      findsOneWidget,
    );

    expect(
      find.textContaining(
        boulderReference.rock.boulderArea.municipality.name,
      ),
      findsOneWidget,
    );
  });

  testWidgets('it shows an alert dialog containing terms of use',
      (WidgetTester tester) async {
    await tester.runAsync(() async {
      // test code here
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool(TermsOfUseBloc.termsOfUseAcceptanceKey, false);
      await runApplication(tester: tester);
      await expectLater(
        find.byKey(const Key('terms-of-use')),
        findsOneWidget,
      );
    });
  });

  testWidgets('it shows a map when I click on the appropriate tab',
      (WidgetTester tester) async {
    await runApplication(tester: tester);
    // tap on the Map tab
    await tester.tap(find.text('Carte'));
    await tester.pumpAndSettle();

    expect(
      find.byType(GoogleMap),
      findsOneWidget,
    );
  });

  testWidgets(
      'search for a boulder, view details, and select an associated boulder',
      (WidgetTester tester) async {
    await runApplication(tester: tester);
    const searchedBoulder = 'retaretapas';
    await tester.enterText(
      find.byKey(const Key('search-boulders')),
      searchedBoulder,
    );
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pumpAndSettle();

    expect(find.text(searchedBoulder), findsOneWidget);

    await tester.tap(find.byType(BoulderListTile).first);

    expect(find.text(searchedBoulder), findsOneWidget);
    await tester.pumpAndSettle();

    final sameRockTitleSection = find.text('Blocs sur le même rocher');

    await tester.scrollUntilVisible(
      // WORKAROUND TO SCROLL TO THE BOTTOM
      find.textContaining('Cotation'),
      300,
      scrollable: find.descendant(
        of: find.byKey(
          const Key('boulder-details-list-view'),
        ),
        matching: find.byType(Scrollable),
      ),
    );

    await tester.scrollUntilVisible(
      sameRockTitleSection,
      300,
    );

    await tester.pumpAndSettle();

    expect(sameRockTitleSection, findsOneWidget);

    expect(find.byType(BoulderDetailsAssociatedItem), findsWidgets);
  });

  testWidgets('filter by grade', (WidgetTester tester) async {
    final gradeRepository = GradeRepository(httpClient: httpClient);
    final gradesResponse =
        await gradeRepository.findWithBouldersOrderedByName();

    await runApplication(tester: tester);
    await tester.tap(
      find.text('Filtrer'),
    );

    await tester.pumpAndSettle();

    final firstGrade = gradesResponse.items[0];
    final lastGrade = gradesResponse.items[gradesResponse.totalItems - 1];

    print(
      'initial grade range expected: ${firstGrade.name} -> ${lastGrade.name}',
    );
    expect(
      find.textContaining(
        'Cotation min: ${gradesResponse.items[0].name}',
        findRichText: true,
      ),
      findsOneWidget,
    );

    expect(
      find.textContaining(
        'max: ${gradesResponse.items[gradesResponse.totalItems - 1].name}',
        findRichText: true,
      ),
      findsOneWidget,
    );

    await tester.pumpAndSettle();

    // Get the bounds of the track by finding the slider edges and translating
    // inwards by the overlay radius.
    // inspired from https://github.com/flutter/flutter/blob/master/packages/flutter/test/material/range_slider_test.dart
    final leftTarget =
        tester.getTopLeft(find.byType(SfRangeSlider)).translate(20, 16);
    final rightTarget =
        tester.getTopRight(find.byType(SfRangeSlider)).translate(-20, 16);

    await tester.dragFrom(
      rightTarget,
      Offset(-(leftTarget.dx + rightTarget.dx) / 2, 0),
    );
    await tester.pumpAndSettle();

    final maxGradeWidget = tester
        .element(find.byKey(const Key('boulder-list-grade-max')).first)
        .widget as Text;

    final maxGrade = maxGradeWidget.textSpan?.toPlainText() ?? '';
    final selectedGrade = maxGrade.replaceFirst('max: ', '');

    expect(selectedGrade.length, greaterThan(0));

    await tester.dragFrom(
      leftTarget,
      Offset((leftTarget.dx + rightTarget.dx) / 2, 0),
    );
    await tester.pumpAndSettle();
    final minGradeWidget = tester
        .element(find.byKey(const Key('boulder-list-grade-min')).first)
        .widget as Text;

    final minGrade = minGradeWidget.textSpan?.toPlainText() ?? '';

    print('min grade: $minGrade, max grade: $maxGrade');

    expect(
      selectedGrade,
      equals(
        minGrade.replaceFirst('Cotation min: ', ''),
      ),
    );

    await closeFilterModal(tester);
    await tester.pumpAndSettle();

    final gradeFinder =
        find.textContaining('($selectedGrade)', findRichText: true);

    expect(gradeFinder, findsWidgets);

    print('found elements: ${gradeFinder.evaluate().length}');
    expect(
      gradeFinder.evaluate().length,
      equals(find.byType(BoulderListTile).evaluate().length),
    );
  });

  testWidgets('sort boulders', (WidgetTester tester) async {
    BoulderListTile getBoulderListTileAt(int index) {
      return find
          .byWidgetPredicate((Widget widget) => widget is BoulderListTile)
          .evaluate()
          .elementAt(index)
          .widget as BoulderListTile;
    }

    Future<void> sortByLabel({required String label}) async {
      await tester.tap(find.byKey(const Key('sort-button')));
      await tester.pumpAndSettle();

      await tester.tap(find.text(label));
      await tester.pumpAndSettle();
    }

    final boulderRepository = BoulderRepository(
      httpClient: httpClient,
    );
    final mostRecentBoulders = await boulderRepository.findBy(
      queryParams: defaultBoulderQueryParams,
    );
    final easiestBoulders = await boulderRepository.findBy(
      queryParams: {
        'order[grade.name]': ['asc'],
      },
    );
    final hardestBoulders = await boulderRepository.findBy(
      queryParams: {
        'order[grade.name]': ['desc'],
      },
    );

    await runApplication(tester: tester);
    // checks the first and second boulders are the most recent
    final firstMostRecent = getBoulderListTileAt(0);
    expect(
      firstMostRecent.boulder.iri,
      equals(mostRecentBoulders.items[0].iri),
    );

    final secondMostRecent = getBoulderListTileAt(1);
    expect(
      secondMostRecent.boulder.iri,
      equals(mostRecentBoulders.items[1].iri),
    );

    // checks the first and second boulders are the easiest ones
    await sortByLabel(label: 'Les plus faciles');

    final firstEasiest = getBoulderListTileAt(0);
    expect(firstEasiest.boulder.iri, equals(easiestBoulders.items[0].iri));

    final secondEasiest = getBoulderListTileAt(1);
    expect(secondEasiest.boulder.iri, equals(easiestBoulders.items[1].iri));

    // checks the first and second boulders are the hardest ones
    await sortByLabel(label: 'Les plus difficiles');

    final firstHardest = getBoulderListTileAt(0);
    expect(firstHardest.boulder.iri, equals(hardestBoulders.items[0].iri));

    final secondHardest = getBoulderListTileAt(1);
    expect(secondHardest.boulder.iri, equals(hardestBoulders.items[1].iri));
  });

  testWidgets('''
can quickly go to the top of the screen if I scroll,
by clicking on the "scroll to to the top" button''',
      (WidgetTester tester) async {
    await runApplication(tester: tester);
    const keyBackToTopButton = Key('boulder-list-back-to-top-button');
    const keyBoulderListResult = Key('boulder-list-result');
    expect(
      find.byKey(keyBackToTopButton).evaluate().length,
      equals(0),
    );

    expect(
      find.byKey(keyBoulderListResult).evaluate().length,
      equals(1),
    );

    await tester.drag(
      find.byKey(const Key('boulder-list-builder-list-view')),
      const Offset(0, -500),
    );
    await tester.pump();

    expect(
      find.byKey(keyBackToTopButton).evaluate().length,
      equals(1),
    );

    expect(
      find.byKey(keyBoulderListResult).evaluate().length,
      equals(0),
    );

    await tester.tap(find.byKey(keyBackToTopButton));
    await tester.pumpAndSettle();

    expect(
      find.byKey(keyBackToTopButton).evaluate().length,
      equals(0),
    );

    expect(
      find.byKey(keyBoulderListResult).evaluate().length,
      equals(1),
    );
  });

  testWidgets(
      'I go to the municipality details page from the boulder details page',
      (WidgetTester tester) async {
    // prior to test, I fetch boulders to retrieve a reference
    // and assert boulders details dynamically

    final boulderRepository = BoulderRepository(
      httpClient: httpClient,
    );
    final bouldersResponse =
        await boulderRepository.findBy(queryParams: defaultBoulderQueryParams);
    final boulderReference = bouldersResponse.items[0];

    expect(boulderReference, isNot(null));
    await runApplication(tester: tester);
    // tap on the first tile and show details
    await tester.tap(find.byType(BoulderListTile).first);
    await tester.pumpAndSettle();

    await tester.scrollUntilVisible(
      find.byKey(
        const Key(
          'boulder-area-details-link',
        ),
      ),
      200,
      scrollable: find.descendant(
        of: find.byKey(
          const Key('boulder-details-list-view'),
        ),
        matching: find.byType(Scrollable),
      ),
    );

    await tester.tap(
      find.byKey(const Key('municipality-details-link')).first,
    );
    await tester.pumpAndSettle();

    print(
      // ignore: lines_longer_than_80_chars
      'municipality ref => ${boulderReference.rock.boulderArea.municipality.name}',
    );
    expect(
      find.descendant(
        of: find.byKey(const Key('municipality-details-app-bar')),
        matching: find.textContaining(
          boulderReference.rock.boulderArea.municipality.name,
          findRichText: true,
        ),
      ),
      findsOneWidget,
    );

    find
      ..widgetWithText(Tab, 'Liste des secteurs')
      ..widgetWithText(Tab, 'Carte');

    final municipalityRepository = MunicipalityRepository(
      httpClient: httpClient,
    );
    print(
      'municipality IRI: ${boulderReference.rock.boulderArea.municipality.iri}',
    );
    final municipalityReference = await municipalityRepository.find(
      boulderReference.rock.boulderArea.municipality.iri.replaceAll(
        '/municipalities/',
        '',
      ),
    );
    expect(municipalityReference.iri, isNotNull);
    await boulderRepository.findBy(queryParams: defaultBoulderQueryParams);

    final boulderAreasWithBoulders = municipalityReference.boulderAreas
        .where((element) => element.numberOfBoulders! > 0);
    print('boulder areas length: ${boulderAreasWithBoulders.length}');

    var i = 0;
    for (i = 0; i < boulderAreasWithBoulders.length; i++) {
      print(boulderAreasWithBoulders.elementAt(i));
      final expectedElement = find.byWidgetPredicate(
        (Widget widget) =>
            widget is MunicipalityDetailsBoulderAreaItem &&
            widget.key ==
                Key(
                  boulderAreasWithBoulders.elementAt(i).iri,
                ),
      );
      await tester.scrollUntilVisible(
        expectedElement,
        300,
        scrollable: find.descendant(
          of: find.byKey(
            const Key('municipality-details-list-view'),
          ),
          matching: find.byType(Scrollable),
        ),
      );
      expect(
        expectedElement,
        findsOneWidget,
      );
    }

    expect(
      i,
      boulderAreasWithBoulders.length,
    );

    final lastBoulderArea = boulderAreasWithBoulders.last;
    print('last boulder area: ${lastBoulderArea.name}');
    expect(
      find.descendant(
        of: find.byType(ListTile),
        matching: find.textContaining(lastBoulderArea.name),
      ),
      findsOneWidget,
    );

    await tester.tap(find.textContaining('Carte').first);
    await tester.pumpAndSettle();

    expect(
      find.byType(GoogleMap),
      findsOneWidget,
    );
  });

  testWidgets(
      'I go to the boulder area details page from the boulder details page',
      (WidgetTester tester) async {
    // prior to test, I fetch boulders to retrieve a reference
    // and assert boulders details dynamically
    final boulderRepository = BoulderRepository(
      httpClient: httpClient,
    );
    final bouldersResponse =
        await boulderRepository.findBy(queryParams: defaultBoulderQueryParams);
    final boulderReference = bouldersResponse.items[0];

    expect(boulderReference, isNot(null));
    await runApplication(tester: tester);
    // tap on the first tile and show details
    await tester.tap(find.byType(BoulderListTile).first);
    await tester.pumpAndSettle();

    await tester.scrollUntilVisible(
      find.byKey(
        const Key(
          'boulder-area-details-link',
        ),
      ),
      200,
      scrollable: find.descendant(
        of: find.byKey(
          const Key('boulder-details-list-view'),
        ),
        matching: find.byType(Scrollable),
      ),
    );
    await tester.pumpAndSettle();

    await tester.tap(
      find.byKey(const Key('boulder-area-details-link')).first,
    );
    await tester.pumpAndSettle();

    print(
      'boulder area ref => ${boulderReference.rock.boulderArea.name}',
    );

    expect(
      find.descendant(
        of: find.byKey(const Key('boulder-area-details-app-bar')),
        matching: find.textContaining(
          boulderReference.rock.boulderArea.name,
          findRichText: true,
        ),
      ),
      findsOneWidget,
    );

    expect(
      find.text(
        'Secteur: ${boulderReference.rock.boulderArea.name}',
        findRichText: true,
      ),
      findsWidgets,
    );

    await tester.tap(find.textContaining('Carte').first);
    await tester.pumpAndSettle();

    expect(
      find.byType(GoogleMap),
      findsOneWidget,
    );

    expect(find.byType(MapLauncherButton), findsOneWidget);

    await tester.tap(find.textContaining('Description').first);
    await tester.pumpAndSettle();

    expect(
      find.byType(BarChart),
      findsOneWidget,
    );
  });

  testWidgets('sort boulders from boulder area details page',
      (WidgetTester tester) async {
    // prior to test, I fetch boulders to retrieve a reference
    // and assert boulders details dynamically
    BoulderListTile getBoulderListTileAt(int index) {
      return find
          .byWidgetPredicate((Widget widget) => widget is BoulderListTile)
          .evaluate()
          .elementAt(index)
          .widget as BoulderListTile;
    }

    Future<void> sortByLabel({required String label}) async {
      await tester.tap(find.byKey(const Key('sort-button')));
      await tester.pumpAndSettle();

      await tester.tap(find.text(label));
      await tester.pumpAndSettle();
    }

    final boulderRepository = BoulderRepository(
      httpClient: httpClient,
    );
    final bouldersResponse =
        await boulderRepository.findBy(queryParams: defaultBoulderQueryParams);
    final boulderReference = bouldersResponse.items[0];

    expect(boulderReference, isNot(null));
    await runApplication(tester: tester);
    // tap on the first tile and show details
    await tester.tap(find.byType(BoulderListTile).first);
    await tester.pumpAndSettle();

    await tester.scrollUntilVisible(
      find.byKey(
        const Key(
          'boulder-area-details-link',
        ),
      ),
      200,
      scrollable: find.descendant(
        of: find.byKey(
          const Key('boulder-details-list-view'),
        ),
        matching: find.byType(Scrollable),
      ),
    );
    await tester.pumpAndSettle();

    await tester.tap(
      find.byKey(const Key('boulder-area-details-link')).first,
    );
    await tester.pumpAndSettle();

    print(
      'boulder area ref => ${boulderReference.rock.boulderArea.name}',
    );

    final boulderAreaQueryParam = {
      'rock.boulderArea.id[]': [
        boulderReference.rock.boulderArea.iri.replaceAll('/boulder_areas/', ''),
      ],
    };

    final mostRecentBoulders = await boulderRepository.findBy(
      queryParams: {
        ...defaultBoulderQueryParams,
        ...boulderAreaQueryParam,
      },
    );
    final easiestBoulders = await boulderRepository.findBy(
      queryParams: {
        'order[grade.name]': ['asc'],
        ...boulderAreaQueryParam,
      },
    );
    final hardestBoulders = await boulderRepository.findBy(
      queryParams: {
        'order[grade.name]': ['desc'],
        ...boulderAreaQueryParam,
      },
    );

    final firstMostRecent = getBoulderListTileAt(0);
    expect(
      firstMostRecent.boulder.iri,
      equals(mostRecentBoulders.items[0].iri),
    );

    final secondMostRecent = getBoulderListTileAt(1);
    expect(
      secondMostRecent.boulder.iri,
      equals(mostRecentBoulders.items[1].iri),
    );

    // checks the first and second boulders are the easiest ones
    await sortByLabel(label: 'Les plus faciles');

    final firstEasiest = getBoulderListTileAt(0);
    expect(firstEasiest.boulder.iri, equals(easiestBoulders.items[0].iri));

    final secondEasiest = getBoulderListTileAt(1);
    expect(secondEasiest.boulder.iri, equals(easiestBoulders.items[1].iri));

    // checks the first and second boulders are the hardest ones
    await sortByLabel(label: 'Les plus difficiles');

    final firstHardest = getBoulderListTileAt(0);
    expect(firstHardest.boulder.iri, equals(hardestBoulders.items[0].iri));

    final secondHardest = getBoulderListTileAt(1);
    expect(secondHardest.boulder.iri, equals(hardestBoulders.items[1].iri));
  });

  testWidgets('go to index view and select a municipality',
      (WidgetTester tester) async {
    final departmentRepository = DepartmentRepository(
      httpClient: httpClient,
    );
    final departmentsResponse = await departmentRepository.findAll();
    final departmentReference = departmentsResponse.items[0];
    print('department reference: ${departmentReference.name}');

    final municipalityReference = departmentReference.municipalities[0];
    print('municipality reference: ${municipalityReference.name}');

    await runApplication(tester: tester);
    await tester.tap(find.text('Index').first);
    await tester.pumpAndSettle();

    expect(find.text('Communes répertoriées'), findsOneWidget);
    expect(find.text(departmentReference.name), findsOneWidget);
    expect(find.text(municipalityReference.name), findsOneWidget);

    await tester.tap(find.text(municipalityReference.name).first);
    await tester.pumpAndSettle();

    expect(
      find.descendant(
        of: find.byKey(const Key('municipality-details-app-bar')),
        matching: find.textContaining(
          municipalityReference.name,
          findRichText: true,
        ),
      ),
      findsOneWidget,
    );

    find
      ..widgetWithText(Tab, 'Liste des secteurs')
      ..widgetWithText(Tab, 'Carte');
  });

  testWidgets('requests are persisted to a local database', (tester) async {
    final storedRequests = await database.select(database.dbRequests).get();
    expect(storedRequests.length, 0);

    await runApplication(tester: tester);

    final bouldersRequest = await (database.select(database.dbRequests)
          ..where(
            (tbl) =>
                tbl.requestPath.like('/boulders?order%5Bid%5D=desc&page=1'),
          ))
        .getSingle();

    final boulders = parseBoulders(bouldersRequest.responseBody).items;
    expect(
      boulders[0].iri,
      contains('/boulders/'),
    );

    final boulderRequest = await (database.select(database.dbRequests)
          ..where(
            (tbl) => tbl.requestPath.equals(boulders[0].iri),
          ))
        .getSingleOrNull();

    final boulderReference = boulders[0];
    print('ref boulder: ${boulderReference.name}');
    print(boulderReference.iri);
    expect(boulderRequest, isNull);
    await tester.tap(find.byType(BoulderListTile).first);

    await tester.pumpAndSettle();

    final boulderRequestAfterShowingDetails =
        await (database.select(database.dbRequests)
              ..where(
                (tbl) => tbl.requestPath.equals(boulderReference.iri),
              ))
            .getSingleOrNull();
    expect(
      boulderRequestAfterShowingDetails?.requestPath,
      equals(boulderReference.iri),
    );

    final jsonBoulder =
        jsonDecode(boulderRequestAfterShowingDetails?.responseBody ?? '')
            as Map<String, dynamic>;
    expect(Boulder.fromJson(jsonBoulder).name, boulderReference.name);
  });

  testWidgets('i can download boulder areas', (WidgetTester tester) async {
    var dbBoulderAreas = await database.select(database.dbBoulderAreas).get();
    expect(dbBoulderAreas.length, 0);
    await runApplication(tester: tester);
    await tester.tap(find.text('Téléchargements').first);
    await tester.pumpAndSettle();

    expect(find.text('Secteurs téléchargés'), findsOneWidget);
    expect(find.text('Aucun secteur téléchargé'), findsOneWidget);

    await tester.tap(find.text('Index').first);
    await tester.pumpAndSettle();

    final departmentRepository = DepartmentRepository(
      httpClient: httpClient,
    );
    final departmentsResponse = await departmentRepository.findAll();
    final departmentReference = departmentsResponse.items[0];
    print('department reference: ${departmentReference.name}');

    final municipalityReference = departmentReference.municipalities[0];
    print('municipality reference: ${municipalityReference.name}');

    final boulderAreaReference = municipalityReference.boulderAreas[0];
    print('boulder area reference: ${boulderAreaReference.name}');

    await tester.tap(find.text(municipalityReference.name).first);
    await tester.pumpAndSettle();
    await tester.tap(find.text(boulderAreaReference.name).first);
    await tester.pumpAndSettle();

    await tester.tap(find.text('TÉLÉCHARGER').first);

    // download a boulder area takes time
    await tester.pump(
      const Duration(
        seconds: 3,
      ),
    );

    expect(find.text('TÉLÉCHARGER ✅'), findsOneWidget);

    final navigator = (tester.state(find.byType(Navigator)) as NavigatorState)
      ..pop();
    await tester.pumpAndSettle();
    navigator.pop();
    await tester.pumpAndSettle();

    await tester.tap(find.text('Téléchargements').first);
    await tester.pumpAndSettle();

    expect(
      find.descendant(
        of: find.byKey(Key(boulderAreaReference.iri)),
        matching: find.textContaining(
          boulderAreaReference.name,
          findRichText: true,
        ),
      ),
      findsOneWidget,
    );

    expect(
      find.descendant(
        of: find.byKey(Key(boulderAreaReference.iri)),
        matching: find.textContaining(
          municipalityReference.name,
          findRichText: true,
        ),
      ),
      findsOneWidget,
    );

    dbBoulderAreas = await (database.select(database.dbBoulderAreas)
          ..where(
            (tbl) => tbl.iri.equals(boulderAreaReference.iri),
          ))
        .get();

    expect(dbBoulderAreas.length, 1);
    expect(dbBoulderAreas[0].iri, boulderAreaReference.iri);
    expect(
      dbBoulderAreas[0].boulders,
      '/boulders?order%5Bid%5D=desc&pagination=false&rock.boulderArea.id%5B%5D=${boulderAreaReference.iri.replaceAll('/boulder_areas/', '')}',
    );

    final dbRequest = await (database.select(database.dbRequests)
          ..where(
            (tbl) => tbl.requestPath.equals(dbBoulderAreas[0].boulders!),
          ))
        .getSingle();

    final firstBoulderName =
        // ignore: avoid_dynamic_calls
        jsonDecode(dbRequest.responseBody)['hydra:member'][0]['name'] as String;

    print('first boulder name: $firstBoulderName');
    await (database.update(database.dbRequests)
          ..where((t) => t.requestPath.equals(dbRequest.requestPath)))
        .write(
      DbRequestsCompanion(
        responseBody: Value(
          dbRequest.responseBody.replaceFirst(
            RegExp('"name":"$firstBoulderName"'),
            '"name":"Breath of the wild"',
          ),
        ),
      ),
    );

    await tester.tap(find.textContaining(boulderAreaReference.name).first);
    await tester.pumpAndSettle();

    expect(
      find.descendant(
        of: find.byKey(const Key('boulder-area-details-app-bar')),
        matching: find.textContaining(
          boulderAreaReference.name,
          findRichText: true,
        ),
      ),
      findsOneWidget,
    );

    // check the initial boulder list comes from the database
    expect(
      find.textContaining(
        'Breath of the wild',
        findRichText: true,
      ),
      findsOneWidget,
    );

    navigator.pop();
    await tester.pumpAndSettle();

    await tester.pump(
      const Duration(
        seconds: 3,
      ),
    );

    await tester.tap(find.textContaining(boulderAreaReference.name).first);
    await tester.pumpAndSettle();

    // check the boulder list has been refreshed
    expect(
      find.textContaining(
        firstBoulderName,
        findRichText: true,
      ),
      findsOneWidget,
    );
  });
}
