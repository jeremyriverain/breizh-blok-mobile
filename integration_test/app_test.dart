// ignore_for_file: avoid_print

import 'package:breizh_blok_mobile/blocs/map_permission_bloc.dart';
import 'package:breizh_blok_mobile/blocs/terms_of_use_bloc.dart';
import 'package:breizh_blok_mobile/components/boulder_details_associated_item.dart';
import 'package:breizh_blok_mobile/components/map_launcher_button.dart';
import 'package:breizh_blok_mobile/components/municipality_details_boulder_area_item.dart';
import 'package:breizh_blok_mobile/models/department.dart';
import 'package:breizh_blok_mobile/models/municipality.dart';
import 'package:breizh_blok_mobile/repositories/department_repository.dart';
import 'package:breizh_blok_mobile/repositories/municipality_repository.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:integration_test/integration_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:breizh_blok_mobile/main.dart' as app;
import 'package:breizh_blok_mobile/repositories/boulder_repository.dart';
import 'package:breizh_blok_mobile/components/line_boulder_image.dart';
import 'package:breizh_blok_mobile/components/boulder_list_tile.dart';
import 'package:breizh_blok_mobile/models/boulder.dart';
import 'package:breizh_blok_mobile/models/collection_items.dart';
import 'package:breizh_blok_mobile/models/grade.dart';
import 'package:breizh_blok_mobile/repositories/grade_repository.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

void main() async {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  final Map<String, List<String>> defaultBoulderQueryParams = {
    'order[id]': ['desc']
  };

  setUp(() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(TermsOfUseBloc.termsOfUseAcceptanceKey, true);
  });

  runApplication({required WidgetTester tester}) async {
    final mapPermissionBloc = MapPermissionBloc();
    mapPermissionBloc.add(RequestPermissionEvent(hasDenied: true));
    await app.main(mapPermissionBloc: mapPermissionBloc);
    await tester.pumpAndSettle();
  }

  Future<void> closeFilterModal(WidgetTester tester) async {
    await tester.tapAt(const Offset(10, 10));
    await tester.pumpAndSettle();
  }

  group('end to end test -', () {
    testWidgets('I list boulders and show details about them',
        (WidgetTester tester) async {
      // prior to test, I fetch boulders to retrieve a reference
      // and assert boulders details dynamically
      BoulderRepository boulderRepository = BoulderRepository();
      CollectionItems<Boulder> bouldersResponse = await boulderRepository
          .findBy(queryParams: defaultBoulderQueryParams);
      Boulder boulderReference = bouldersResponse.items[0];

      expect(boulderReference, isNot(null));

      final prefs = await SharedPreferences.getInstance();
      print(prefs.getBool(TermsOfUseBloc.termsOfUseAcceptanceKey));

      await runApplication(tester: tester);

      expect(find.textContaining(RegExp(r'^\d+ blocs'), findRichText: true),
          findsOneWidget);
      expect(
        find.text(
          "${boulderReference.name} (${boulderReference.grade?.name})",
          findRichText: true,
        ),
        findsWidgets,
      );

      expect(
        find.text(
          "Secteur: ${boulderReference.rock.boulderArea.name}",
          findRichText: true,
        ),
        findsWidgets,
      );

      expect(
        find.text(
          "Commune: ${boulderReference.rock.boulderArea.municipality.name}",
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
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setBool(TermsOfUseBloc.termsOfUseAcceptanceKey, false);
        await runApplication(tester: tester);
        expectLater(
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
      const String searchedBoulder = 'retaretapas';
      await tester.enterText(
          find.byKey(const Key('search-boulders')), searchedBoulder);
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
        300.0,
      );

      await tester.pumpAndSettle();

      expect(sameRockTitleSection, findsOneWidget);

      expect(find.byType(BoulderDetailsAssociatedItem), findsWidgets);
    });

    testWidgets('filter by grade', (WidgetTester tester) async {
      GradeRepository gradeRepository = GradeRepository();
      CollectionItems<Grade> gradesResponse =
          await gradeRepository.findWithBouldersOrderedByName();

      await runApplication(tester: tester);
      await tester.tap(
        find.text('Filtrer'),
      );

      await tester.pumpAndSettle();

      final Grade firstGrade = gradesResponse.items[0];
      final Grade lastGrade =
          gradesResponse.items[gradesResponse.totalItems - 1];

      print(
          'initial grade range expected: ${firstGrade.name} -> ${lastGrade.name}');
      expect(
          find.textContaining('Cotation min: ${gradesResponse.items[0].name}',
              findRichText: true),
          findsOneWidget);

      expect(
          find.textContaining(
              'max: ${gradesResponse.items[gradesResponse.totalItems - 1].name}',
              findRichText: true),
          findsOneWidget);

      await tester.pumpAndSettle();

      // Get the bounds of the track by finding the slider edges and translating
      // inwards by the overlay radius.
      // inspired from https://github.com/flutter/flutter/blob/master/packages/flutter/test/material/range_slider_test.dart
      final Offset leftTarget =
          tester.getTopLeft(find.byType(SfRangeSlider)).translate(20, 16);
      final Offset rightTarget =
          tester.getTopRight(find.byType(SfRangeSlider)).translate(-20, 16);

      await tester.dragFrom(
          rightTarget, Offset(-(leftTarget.dx + rightTarget.dx) / 2, 0));
      await tester.pumpAndSettle();

      final maxGradeWidget = tester
          .element(find.byKey(const Key('boulder-list-grade-max')).first)
          .widget as Text;

      final String maxGrade = maxGradeWidget.textSpan?.toPlainText() ?? '';
      final String selectedGrade = maxGrade.replaceFirst('max: ', '');

      expect(selectedGrade.length, greaterThan(0));

      await tester.dragFrom(
          leftTarget, Offset((leftTarget.dx + rightTarget.dx) / 2, 0));
      await tester.pumpAndSettle();
      final minGradeWidget = tester
          .element(find.byKey(const Key('boulder-list-grade-min')).first)
          .widget as Text;

      final String minGrade = minGradeWidget.textSpan?.toPlainText() ?? '';

      print('min grade: $minGrade, max grade: $maxGrade');

      expect(
        selectedGrade,
        equals(
          minGrade.replaceFirst('Cotation min: ', ''),
        ),
      );

      await closeFilterModal(tester);
      await tester.pumpAndSettle();

      final Finder gradeFinder =
          find.textContaining('($selectedGrade)', findRichText: true);

      expect(gradeFinder, findsWidgets);

      print('found elements: ${gradeFinder.evaluate().length}');
      expect(gradeFinder.evaluate().length,
          equals(find.byType(BoulderListTile).evaluate().length));
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
        await tester.tap(find.byKey(const Key('boulder-list-sort-button')));
        await tester.pumpAndSettle();

        await tester.tap(find.text(label));
        await tester.pumpAndSettle();
      }

      BoulderRepository boulderRepository = BoulderRepository();
      final CollectionItems<Boulder> mostRecentBoulders =
          await boulderRepository.findBy(
        queryParams: defaultBoulderQueryParams,
      );
      final CollectionItems<Boulder> easiestBoulders =
          await boulderRepository.findBy(
        queryParams: {
          'order[grade.name]': ['asc']
        },
      );
      final CollectionItems<Boulder> hardestBoulders =
          await boulderRepository.findBy(
        queryParams: {
          'order[grade.name]': ['desc']
        },
      );

      await runApplication(tester: tester);
      // checks the first and second boulders are the most recent
      final BoulderListTile firstMostRecent = getBoulderListTileAt(0);
      expect(
          firstMostRecent.boulder.iri, equals(mostRecentBoulders.items[0].iri));

      final BoulderListTile secondMostRecent = getBoulderListTileAt(1);
      expect(secondMostRecent.boulder.iri,
          equals(mostRecentBoulders.items[1].iri));

      // checks the first and second boulders are the easiest ones
      await sortByLabel(label: 'Les plus faciles');

      final BoulderListTile firstEasiest = getBoulderListTileAt(0);
      expect(firstEasiest.boulder.iri, equals(easiestBoulders.items[0].iri));

      final BoulderListTile secondEasiest = getBoulderListTileAt(1);
      expect(secondEasiest.boulder.iri, equals(easiestBoulders.items[1].iri));

      // checks the first and second boulders are the hardest ones
      await sortByLabel(label: 'Les plus difficiles');

      final BoulderListTile firstHardest = getBoulderListTileAt(0);
      expect(firstHardest.boulder.iri, equals(hardestBoulders.items[0].iri));

      final BoulderListTile secondHardest = getBoulderListTileAt(1);
      expect(secondHardest.boulder.iri, equals(hardestBoulders.items[1].iri));
    });
  });

  testWidgets(
      'can quickly go to the top of the screen if I scroll, by clicking on the "scroll to to the top" button',
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

    await tester.drag(find.byKey(const Key('boulder-list-builder-list-view')),
        const Offset(0.0, -500));
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

    BoulderRepository boulderRepository = BoulderRepository();
    CollectionItems<Boulder> bouldersResponse =
        await boulderRepository.findBy(queryParams: defaultBoulderQueryParams);
    Boulder boulderReference = bouldersResponse.items[0];

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
        ));

    await tester.tap(
      find.byKey(const Key('municipality-details-link')).first,
    );
    await tester.pumpAndSettle();

    print(
      "municpality ref => ${boulderReference.rock.boulderArea.municipality.name}",
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

    find.widgetWithText(Tab, 'Liste des secteurs');
    find.widgetWithText(Tab, 'Carte');

    MunicipalityRepository municipalityRepository = MunicipalityRepository();
    print(
        'municipality IRI: ${boulderReference.rock.boulderArea.municipality.iri}');
    Municipality municipalityReference = await municipalityRepository.find(
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
    BoulderRepository boulderRepository = BoulderRepository();
    CollectionItems<Boulder> bouldersResponse =
        await boulderRepository.findBy(queryParams: defaultBoulderQueryParams);
    Boulder boulderReference = bouldersResponse.items[0];

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
        ));

    await tester.tap(
      find.byKey(const Key('boulder-area-details-link')).first,
    );
    await tester.pumpAndSettle();

    print(
      "boulder area ref => ${boulderReference.rock.boulderArea.name}",
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
        "Secteur: ${boulderReference.rock.boulderArea.name}",
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
      await tester.tap(find.byKey(const Key('boulder-list-sort-button')));
      await tester.pumpAndSettle();

      await tester.tap(find.text(label));
      await tester.pumpAndSettle();
    }

    BoulderRepository boulderRepository = BoulderRepository();
    CollectionItems<Boulder> bouldersResponse =
        await boulderRepository.findBy(queryParams: defaultBoulderQueryParams);
    Boulder boulderReference = bouldersResponse.items[0];

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
        ));

    await tester.tap(
      find.byKey(const Key('boulder-area-details-link')).first,
    );
    await tester.pumpAndSettle();

    print(
      "boulder area ref => ${boulderReference.rock.boulderArea.name}",
    );

    final Map<String, List<String>> boulderAreaQueryParam = {
      'rock.boulderArea.id[]': [
        boulderReference.rock.boulderArea.iri.replaceAll('/boulder_areas/', ''),
      ]
    };

    final CollectionItems<Boulder> mostRecentBoulders =
        await boulderRepository.findBy(
      queryParams: {
        ...defaultBoulderQueryParams,
        ...boulderAreaQueryParam,
      },
    );
    final CollectionItems<Boulder> easiestBoulders =
        await boulderRepository.findBy(
      queryParams: {
        'order[grade.name]': ['asc'],
        ...boulderAreaQueryParam,
      },
    );
    final CollectionItems<Boulder> hardestBoulders =
        await boulderRepository.findBy(
      queryParams: {
        'order[grade.name]': ['desc'],
        ...boulderAreaQueryParam,
      },
    );

    final BoulderListTile firstMostRecent = getBoulderListTileAt(0);
    expect(
        firstMostRecent.boulder.iri, equals(mostRecentBoulders.items[0].iri));

    final BoulderListTile secondMostRecent = getBoulderListTileAt(1);
    expect(
        secondMostRecent.boulder.iri, equals(mostRecentBoulders.items[1].iri));

    // checks the first and second boulders are the easiest ones
    await sortByLabel(label: 'Les plus faciles');

    final BoulderListTile firstEasiest = getBoulderListTileAt(0);
    expect(firstEasiest.boulder.iri, equals(easiestBoulders.items[0].iri));

    final BoulderListTile secondEasiest = getBoulderListTileAt(1);
    expect(secondEasiest.boulder.iri, equals(easiestBoulders.items[1].iri));

    // checks the first and second boulders are the hardest ones
    await sortByLabel(label: 'Les plus difficiles');

    final BoulderListTile firstHardest = getBoulderListTileAt(0);
    expect(firstHardest.boulder.iri, equals(hardestBoulders.items[0].iri));

    final BoulderListTile secondHardest = getBoulderListTileAt(1);
    expect(secondHardest.boulder.iri, equals(hardestBoulders.items[1].iri));
  });

  testWidgets('go to index view and select a municipality',
      (WidgetTester tester) async {
    final DepartmentRepository departmentRepository = DepartmentRepository();
    CollectionItems<Department> departmentsResponse =
        await departmentRepository.findAll();
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

    find.widgetWithText(Tab, 'Liste des secteurs');
    find.widgetWithText(Tab, 'Carte');
  });
}
