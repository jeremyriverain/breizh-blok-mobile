// ignore_for_file: avoid_print, avoid_dynamic_calls, lines_longer_than_80_chars

import 'dart:convert';

import 'package:breizh_blok_mobile/config/env.dart';
import 'package:breizh_blok_mobile/data/data_sources/api/api_client.dart';
import 'package:breizh_blok_mobile/data/data_sources/api/model/api_order_param.dart';
import 'package:breizh_blok_mobile/data/data_sources/api/model/iri_parser.dart';
import 'package:breizh_blok_mobile/data/data_sources/local/app_database.dart';
import 'package:breizh_blok_mobile/data/repositories/boulder/boulder_repository.dart';
import 'package:breizh_blok_mobile/data/repositories/department/department_repository.dart';
import 'package:breizh_blok_mobile/data/repositories/grade/grade_repository.dart';
import 'package:breizh_blok_mobile/data/repositories/municipality/municipality_repository.dart';
import 'package:breizh_blok_mobile/domain/entities/boulder/boulder.dart';
import 'package:breizh_blok_mobile/service_locator/locale.dart';
import 'package:breizh_blok_mobile/service_locator/service_locator.dart';
import 'package:breizh_blok_mobile/services/share_content/share_content_service.dart';
import 'package:breizh_blok_mobile/setup_app.dart';
import 'package:breizh_blok_mobile/ui/core/widgets/boulder_list_builder_tile.dart';
import 'package:breizh_blok_mobile/ui/core/widgets/line_boulder_image.dart';
import 'package:breizh_blok_mobile/ui/core/widgets/map_launcher_button.dart';
import 'package:breizh_blok_mobile/ui/core/widgets/share_button.dart';
import 'package:breizh_blok_mobile/ui/my_app.dart';
import 'package:breizh_blok_mobile/ui/terms_of_use/view_models/terms_of_use_view_model.dart';
import 'package:drift/drift.dart'
    show StringExpressionOperators, driftRuntimeOptions;
import 'package:drift/native.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:integration_test/integration_test.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';
import 'package:mixpanel_flutter/mixpanel_flutter.dart';
import 'package:mocktail/mocktail.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../test/mocks.dart';

void main() async {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  final defaultBoulderQueryParams = {
    kIdOrderParam: [kDescendantDirection],
  };

  final database = AppDatabase(NativeDatabase.memory());
  final httpClient = ApiClient(database: database);
  final auth = MockAuth();

  late ShareContentService shareContentService;
  late Mixpanel mixpanel;
  late SharedPreferences sharedPreferences;

  Future<void> clearDatabase(AppDatabase database) async {
    await database.transaction(() async {
      for (final table in database.allTables) {
        await database.delete(table).go();
      }
    });
  }

  setUp(() async {
    shareContentService = MockShareContentService();
    mixpanel = MockMixpanel();

    when(() => shareContentService.share(any())).thenAnswer((_) async {
      return const ShareResult('foo', ShareResultStatus.success);
    });

    when(
      () => mixpanel.track(any(), properties: any(named: 'properties')),
    ).thenAnswer((_) async => () {}());

    when(() => auth.credentials).thenReturn(ValueNotifier(null));

    sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setBool(
      TermsOfUseViewModel.termsOfUseAcceptanceKey,
      true,
    );
    await sharedPreferences.setString(kLocalePrefs, 'fr');
    await clearDatabase(database);
    await GetIt.I.reset();
  });

  driftRuntimeOptions.dontWarnAboutMultipleDatabases = true;

  Future<void> runApplication({required WidgetTester tester}) async {
    SentryWidgetsFlutterBinding.ensureInitialized();
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    MapboxOptions.setAccessToken(Env.mapboxToken);

    await setupApp(
      mixpanel: mixpanel,
    );

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          authProvider.overrideWith((_) => auth),
          appDatabaseProvider.overrideWith((_) => database),
          shareContentServiceProvider.overrideWith((_) => shareContentService),
          sharedPreferencesProvider.overrideWith((_) => sharedPreferences),
          myLocaleProvider.overrideWithBuild((_, _) => const Locale('fr')),
        ],
        child: const MyApp(),
      ),
    );
    await tester.pumpAndSettle();
  }

  Future<void> closeFilterModal(WidgetTester tester) async {
    await tester.tapAt(const Offset(10, 10));
    await tester.pumpAndSettle();
  }

  Future<void> sortByLabel({
    required WidgetTester tester,
    required String label,
  }) async {
    await tester.tap(find.byKey(const Key('sort-button')));
    await tester.pumpAndSettle();

    await tester.tap(find.text(label));
    await tester.pumpAndSettle();
  }

  testWidgets('page viewed are tracked', (WidgetTester tester) async {
    // prior to test, I fetch boulders to retrieve a reference
    // and assert boulders details dynamically
    final boulderRepository = BoulderRepository(httpClient: httpClient);
    final bouldersResponse = await boulderRepository.findBy(
      queryParams: defaultBoulderQueryParams,
    );
    final boulderReference = bouldersResponse.items[0];

    await runApplication(tester: tester);

    // tap on the first tile and show details
    await tester.tap(find.byType(BoulderListBuilderTile).first);
    await tester.pumpAndSettle();

    await tester.tap(find.byType(BackButton).first);
    await tester.pumpAndSettle();

    verify(
      () => mixpanel.track(
        'page_viewed',
        properties: {'path': '/', 'navigationType': 'push'},
      ),
    ).called(1);

    verify(
      () => mixpanel.track(
        'page_viewed',
        properties: {
          'path': '/boulders/${boulderReference.id}',
          'navigationType': 'push',
        },
      ),
    ).called(1);

    verify(
      () => mixpanel.track(
        'page_viewed',
        properties: {'path': '/', 'navigationType': 'pop'},
      ),
    ).called(1);
  });

  testWidgets('i can switch between english and french', (
    WidgetTester tester,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    expect(prefs.getString(kLocalePrefs), equals('fr'));

    await runApplication(tester: tester);
    await tester.tap(find.text('Mon profil').first);
    await tester.pumpAndSettle();

    expect(find.widgetWithText(DropdownMenu<String>, 'Langage'), findsAny);

    await tester.tap(find.byType(DropdownMenu<String>));
    await tester.pumpAndSettle();

    await tester.tap(find.text('English').last);
    await tester.pumpAndSettle();

    expect(find.widgetWithText(DropdownMenu<String>, 'Langage'), findsNothing);
    expect(find.widgetWithText(DropdownMenu<String>, 'Language'), findsAny);

    expect(prefs.getString(kLocalePrefs), equals('en'));
  });

  testWidgets('requests are persisted to a local database', (tester) async {
    final storedRequests = await database.select(database.dbRequests).get();
    expect(storedRequests.length, 0);

    await runApplication(tester: tester);

    final bouldersRequest =
        await (database.select(database.dbRequests)..where(
              (tbl) =>
                  tbl.requestPath.like('/boulders?order%5Bid%5D=desc&page=1'),
            ))
            .getSingle();

    final boulders = parseBoulders(bouldersRequest.responseBody).items;
    expect(boulders[0].iri, contains('/boulders/'));

    final boulderRequest =
        await (database.select(database.dbRequests)
              ..where((tbl) => tbl.requestPath.equals(boulders[0].iri)))
            .getSingleOrNull();

    final boulderReference = boulders[0];
    print('ref boulder: ${boulderReference.name}');
    print(boulderReference.iri);
    expect(boulderRequest, isNull);
    await tester.tap(find.byType(BoulderListBuilderTile).first);

    await tester.pumpAndSettle();

    final boulderRequestAfterShowingDetails =
        await (database.select(database.dbRequests)
              ..where((tbl) => tbl.requestPath.equals(boulderReference.iri)))
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

  testWidgets('I list boulders and show details about them', (
    WidgetTester tester,
  ) async {
    // prior to test, I fetch boulders to retrieve a reference
    // and assert boulders details dynamically
    final boulderRepository = BoulderRepository(httpClient: httpClient);
    final bouldersResponse = await boulderRepository.findBy(
      queryParams: defaultBoulderQueryParams,
    );
    final boulderReference = bouldersResponse.items[0];

    expect(boulderReference, isNot(null));

    await runApplication(tester: tester);

    expect(
      find.textContaining(RegExp(r'^\d+ blocs'), findRichText: true),
      findsOneWidget,
    );
    expect(
      find.textContaining(boulderReference.name, findRichText: true),
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
        'Commune: ${boulderReference.rock.boulderArea.municipality?.name}',
        findRichText: true,
      ),
      findsWidgets,
    );

    expect(find.byType(LineBoulderImage), findsWidgets);

    // SHOW PAGE

    // tap on the first tile and show details
    await tester.tap(find.byType(BoulderListBuilderTile).first);

    await tester.pumpAndSettle();

    await tester.tap(find.byType(ShareButton).first);

    await tester.pumpAndSettle();

    verify(
      () => shareContentService.share(
        any(
          that: isA<String>().having(
            (e) => e,
            'text',
            endsWith('https://breizh-blok.fr/boulders/${boulderReference.id}'),
          ),
        ),
      ),
    ).called(1);

    expect(
      find.text(boulderReference.name, findRichText: true),
      findsOneWidget,
    );

    if (boulderReference.lineBoulders.isNotEmpty) {
      expect(find.byType(LineBoulderImage), findsWidgets);

      await tester.tap(find.byType(LineBoulderImage).first);

      await tester.pumpAndSettle();

      expect(find.byType(PhotoViewGallery), findsOneWidget);

      expect(
        find.text('Image 1/${boulderReference.lineBoulders.length}'),
        findsOneWidget,
      );

      await tester.tap(find.byTooltip("Fermer la galerie d'images"));

      await tester.pumpAndSettle();
    }

    await tester.scrollUntilVisible(
      find.textContaining('Secteur'),
      200,
      scrollable: find.descendant(
        of: find.byKey(const Key('boulder-details-list-view')),
        matching: find.byType(Scrollable),
      ),
    );

    expect(
      find.textContaining(boulderReference.rock.boulderArea.name),
      findsOneWidget,
    );

    expect(
      find.textContaining(
        boulderReference.rock.boulderArea.municipality?.name ?? 'foo',
      ),
      findsOneWidget,
    );
  });

  testWidgets('it shows an alert dialog containing terms of use', (
    WidgetTester tester,
  ) async {
    await tester.runAsync(() async {
      // test code here
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool(TermsOfUseViewModel.termsOfUseAcceptanceKey, false);
      await runApplication(tester: tester);
      await expectLater(find.byKey(const Key('terms-of-use')), findsOneWidget);
    });
  });

  testWidgets('search for a boulder, view details', (
    WidgetTester tester,
  ) async {
    await runApplication(tester: tester);
    const searchedBoulder = 'retaretapas';
    await tester.enterText(
      find.byKey(const Key('search-boulders')),
      searchedBoulder,
    );
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pumpAndSettle();

    expect(find.text(searchedBoulder), findsOneWidget);

    await tester.tap(find.byType(BoulderListBuilderTile).first);

    expect(find.text(searchedBoulder), findsOneWidget);
  });

  testWidgets('filter by grade', (WidgetTester tester) async {
    final gradeRepository = GradeRepository(httpClient: httpClient);
    final gradesResponse = await gradeRepository.findAll();

    await runApplication(tester: tester);
    await tester.tap(find.text('Filtrer'));

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
    final leftTarget = tester
        .getTopLeft(find.byType(SfRangeSlider))
        .translate(20, 16);
    final rightTarget = tester
        .getTopRight(find.byType(SfRangeSlider))
        .translate(-20, 16);

    await tester.dragFrom(
      rightTarget,
      Offset(-(leftTarget.dx + rightTarget.dx) / 2, 0),
    );
    await tester.pumpAndSettle();

    final maxGradeWidget =
        tester
                .element(find.byKey(const Key('boulder-list-grade-max')).first)
                .widget
            as Text;

    final maxGrade = maxGradeWidget.textSpan?.toPlainText() ?? '';
    final selectedGrade = maxGrade.replaceFirst('max: ', '');

    expect(selectedGrade.length, greaterThan(0));

    await tester.dragFrom(
      leftTarget,
      Offset((leftTarget.dx + rightTarget.dx) / 2, 0),
    );
    await tester.pumpAndSettle();
    final minGradeWidget =
        tester
                .element(find.byKey(const Key('boulder-list-grade-min')).first)
                .widget
            as Text;

    final minGrade = minGradeWidget.textSpan?.toPlainText() ?? '';

    print('min grade: $minGrade, max grade: $maxGrade');

    expect(selectedGrade, equals(minGrade.replaceFirst('Cotation min: ', '')));

    await closeFilterModal(tester);
    await tester.pumpAndSettle();

    final gradeFinder = find.textContaining(
      '($selectedGrade)',
      findRichText: true,
    );

    expect(gradeFinder, findsWidgets);

    print('found elements: ${gradeFinder.evaluate().length}');
    expect(
      gradeFinder.evaluate().length,
      equals(find.byType(BoulderListBuilderTile).evaluate().length),
    );
  });

  testWidgets('sort boulders', (WidgetTester tester) async {
    BoulderListBuilderTile getBoulderListTileAt(int index) {
      return find
              .byWidgetPredicate(
                (Widget widget) => widget is BoulderListBuilderTile,
              )
              .evaluate()
              .elementAt(index)
              .widget
          as BoulderListBuilderTile;
    }

    final boulderRepository = BoulderRepository(httpClient: httpClient);
    final mostRecentBoulders = await boulderRepository.findBy(
      queryParams: defaultBoulderQueryParams,
    );
    final easiestBoulders = await boulderRepository.findBy(
      queryParams: {
        kGradeOrderParam: [kAscendantDirection],
      },
    );
    final hardestBoulders = await boulderRepository.findBy(
      queryParams: {
        kGradeOrderParam: [kDescendantDirection],
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
    await sortByLabel(tester: tester, label: 'Les plus faciles');

    final firstEasiest = getBoulderListTileAt(0);
    expect(firstEasiest.boulder.iri, equals(easiestBoulders.items[0].iri));

    final secondEasiest = getBoulderListTileAt(1);
    expect(secondEasiest.boulder.iri, equals(easiestBoulders.items[1].iri));

    // checks the first and second boulders are the hardest ones
    await sortByLabel(tester: tester, label: 'Les plus difficiles');

    final firstHardest = getBoulderListTileAt(0);
    expect(firstHardest.boulder.iri, equals(hardestBoulders.items[0].iri));

    final secondHardest = getBoulderListTileAt(1);
    expect(secondHardest.boulder.iri, equals(hardestBoulders.items[1].iri));
  });

  testWidgets(
    '''
  can quickly go to the top of the screen if I scroll,
  by clicking on the "scroll to to the top" button''',
    (WidgetTester tester) async {
      await runApplication(tester: tester);
      const keyBackToTopButton = Key('boulder-list-back-to-top-button');
      const keyBoulderListResult = Key('boulder-list-result');
      expect(find.byKey(keyBackToTopButton).evaluate().length, equals(0));

      expect(find.byKey(keyBoulderListResult).evaluate().length, equals(1));

      await tester.drag(
        find.byKey(const Key('boulder-list-builder-list-view')),
        const Offset(0, -500),
      );
      await tester.pump();

      expect(find.byKey(keyBackToTopButton).evaluate().length, equals(1));

      expect(find.byKey(keyBoulderListResult).evaluate().length, equals(0));

      await tester.tap(find.byKey(keyBackToTopButton));
      await tester.pumpAndSettle();

      expect(find.byKey(keyBackToTopButton).evaluate().length, equals(0));

      expect(find.byKey(keyBoulderListResult).evaluate().length, equals(1));
    },
  );

  testWidgets('I go to the municipality details page from the boulder details page', (
    WidgetTester tester,
  ) async {
    // prior to test, I fetch boulders to retrieve a reference
    // and assert boulders details dynamically

    final boulderRepository = BoulderRepository(httpClient: httpClient);
    final bouldersResponse = await boulderRepository.findBy(
      queryParams: defaultBoulderQueryParams,
    );
    final boulderReference = bouldersResponse.items[0];

    expect(boulderReference, isNot(null));
    await runApplication(tester: tester);
    // tap on the first tile and show details
    await tester.tap(find.byType(BoulderListBuilderTile).first);
    await tester.pumpAndSettle();

    await tester.scrollUntilVisible(
      find.byKey(const Key('boulder-area-details-link')),
      200,
      scrollable: find.descendant(
        of: find.byKey(const Key('boulder-details-list-view')),
        matching: find.byType(Scrollable),
      ),
    );

    await tester.tap(find.byKey(const Key('municipality-details-link')).first);
    await tester.pumpAndSettle();

    print(
      'municipality ref => ${boulderReference.rock.boulderArea.municipality?.name}',
    );
    expect(
      find.descendant(
        of: find.byKey(const Key('municipality-details-app-bar')),
        matching: find.textContaining(
          boulderReference.rock.boulderArea.municipality?.name ?? 'foo',
          findRichText: true,
        ),
      ),
      findsOneWidget,
    );

    find
      ..widgetWithText(Tab, 'Secteurs')
      ..widgetWithText(Tab, 'Carte');

    final municipalityRepository = MunicipalityRepository(
      httpClient: httpClient,
    );
    print(
      'municipality IRI: ${boulderReference.rock.boulderArea.municipality?.iri}',
    );
    final municipalityReference = await municipalityRepository.find(
      boulderReference.rock.boulderArea.municipality?.id ??
          'foo'.replaceAll('/municipalities/', ''),
    );
    expect(municipalityReference.iri, isNotNull);
    await boulderRepository.findBy(queryParams: defaultBoulderQueryParams);

    await tester.tap(find.byType(ShareButton).first);

    await tester.pumpAndSettle();

    verify(
      () => shareContentService.share(
        any(
          that: isA<String>().having(
            (e) => e,
            'text',
            endsWith(
              'https://breizh-blok.fr/municipalities/${IriParser.id(municipalityReference.iri)}',
            ),
          ),
        ),
      ),
    ).called(1);

    await tester.tap(find.textContaining('Carte').first);
    await tester.pumpAndSettle();
    expect(find.byType(MapWidget), findsOneWidget);
  });

  testWidgets(
    'I go to the boulder area details page from the boulder details page',
    (WidgetTester tester) async {
      // prior to test, I fetch boulders to retrieve a reference
      // and assert boulders details dynamically
      final boulderRepository = BoulderRepository(httpClient: httpClient);
      final bouldersResponse = await boulderRepository.findBy(
        queryParams: defaultBoulderQueryParams,
      );
      final boulderReference = bouldersResponse.items[0];

      expect(boulderReference, isNot(null));
      await runApplication(tester: tester);
      // tap on the first tile and show details
      await tester.tap(find.byType(BoulderListBuilderTile).first);
      await tester.pumpAndSettle();

      await tester.scrollUntilVisible(
        find.byKey(const Key('boulder-area-details-link')),
        100,
        scrollable: find.descendant(
          of: find.byKey(const Key('boulder-details-list-view')),
          matching: find.byType(Scrollable),
        ),
      );
      await tester.pumpAndSettle();

      await tester.tap(
        find.byKey(const Key('boulder-area-details-link')).first,
      );
      await tester.pumpAndSettle();

      print('boulder area ref => ${boulderReference.rock.boulderArea.name}');

      expect(
        find.byKey(const Key('boulder-area-details-app-bar')),
        findsOneWidget,
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

      await tester.tap(find.byType(ShareButton).first);

      await tester.pumpAndSettle();

      verify(
        () => shareContentService.share(
          any(
            that: isA<String>().having(
              (e) => e,
              'text',
              endsWith(
                'https://breizh-blok.fr/boulder-areas/${IriParser.id(boulderReference.rock.boulderArea.iri)}',
              ),
            ),
          ),
        ),
      ).called(1);

      await tester.tap(find.textContaining('Description').first);
      await tester.pumpAndSettle();

      expect(find.byType(BarChart), findsOneWidget);

      await tester.tap(find.textContaining('Carte').first);
      await tester.pumpAndSettle();

      expect(find.byType(MapLauncherButton), findsOneWidget);
      expect(find.byType(MapWidget), findsOneWidget);
    },
  );

  testWidgets('sort boulders from boulder area details page', (
    WidgetTester tester,
  ) async {
    // prior to test, I fetch boulders to retrieve a reference
    // and assert boulders details dynamically
    BoulderListBuilderTile getBoulderListTileAt(CommonFinders find, int index) {
      return find
              .byWidgetPredicate(
                (Widget widget) => widget is BoulderListBuilderTile,
              )
              .evaluate()
              .elementAt(index)
              .widget
          as BoulderListBuilderTile;
    }

    Future<void> sortByLabel({required String label}) async {
      await tester.tap(find.byKey(const Key('sort-button')));
      await tester.pumpAndSettle();

      await tester.tap(find.text(label));
      await tester.pumpAndSettle();
    }

    final boulderRepository = BoulderRepository(httpClient: httpClient);
    final bouldersResponse = await boulderRepository.findBy(
      queryParams: defaultBoulderQueryParams,
    );
    final boulderReference = bouldersResponse.items[0];

    expect(boulderReference, isNot(null));
    await runApplication(tester: tester);
    // tap on the first tile and show details
    await tester.tap(find.byType(BoulderListBuilderTile).first);
    await tester.pumpAndSettle();

    await tester.scrollUntilVisible(
      find.byKey(const Key('boulder-area-details-link')),
      200,
      scrollable: find.descendant(
        of: find.byKey(const Key('boulder-details-list-view')),
        matching: find.byType(Scrollable),
      ),
    );
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const Key('boulder-area-details-link')).first);
    await tester.pumpAndSettle();

    print('boulder area ref => ${boulderReference.rock.boulderArea.name}');

    final boulderAreaQueryParam = {
      'rock.boulderArea.id[]': [
        boulderReference.rock.boulderArea.iri.replaceAll('/boulder_areas/', ''),
      ],
    };

    final mostRecentBoulders = await boulderRepository.findBy(
      queryParams: {...defaultBoulderQueryParams, ...boulderAreaQueryParam},
    );
    final easiestBoulders = await boulderRepository.findBy(
      queryParams: {
        kGradeOrderParam: [kAscendantDirection],
        ...boulderAreaQueryParam,
      },
    );
    final hardestBoulders = await boulderRepository.findBy(
      queryParams: {
        kGradeOrderParam: [kDescendantDirection],
        ...boulderAreaQueryParam,
      },
    );

    final firstMostRecent = getBoulderListTileAt(find, 0);
    expect(
      firstMostRecent.boulder.iri,
      equals(mostRecentBoulders.items[0].iri),
    );

    final secondMostRecent = getBoulderListTileAt(find, 1);
    expect(
      secondMostRecent.boulder.iri,
      equals(mostRecentBoulders.items[1].iri),
    );

    // checks the first and second boulders are the easiest ones
    await sortByLabel(label: 'Les plus faciles');

    final firstEasiest = getBoulderListTileAt(find, 0);
    expect(firstEasiest.boulder.iri, equals(easiestBoulders.items[0].iri));

    final secondEasiest = getBoulderListTileAt(find, 1);
    expect(secondEasiest.boulder.iri, equals(easiestBoulders.items[1].iri));

    // checks the first and second boulders are the hardest ones
    await sortByLabel(label: 'Les plus difficiles');

    final firstHardest = getBoulderListTileAt(find, 0);
    expect(firstHardest.boulder.iri, equals(hardestBoulders.items[0].iri));

    final secondHardest = getBoulderListTileAt(find, 1);
    expect(secondHardest.boulder.iri, equals(hardestBoulders.items[1].iri));
  });

  testWidgets('go to index view and select a municipality', (
    WidgetTester tester,
  ) async {
    final departmentRepository = DepartmentRepository(httpClient: httpClient);
    final departmentsResponse = await departmentRepository.findAll();
    final departmentReference = departmentsResponse.items[0];
    print('department reference: ${departmentReference.name}');

    final municipalityReference = departmentReference.municipalities[0];
    print('municipality reference: ${municipalityReference.name}');

    await runApplication(tester: tester);
    await tester.tap(find.text('Sites').first);
    await tester.pumpAndSettle();

    expect(find.text('Communes'), findsOneWidget);
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
      ..widgetWithText(Tab, 'Secteurs')
      ..widgetWithText(Tab, 'Carte');
  });
}
