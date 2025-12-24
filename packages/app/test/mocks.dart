import 'package:breizh_blok_analytics/breizh_blok_analytics.dart';
import 'package:breizh_blok_api_generated/breizh_blok_api_generated.dart'
    as breizh_blok_api;
import 'package:breizh_blok_auth/breizh_blok_auth.dart';
import 'package:breizh_blok_mobile/data/data_sources/api/api_boulder_feedback_data_source.dart';
import 'package:breizh_blok_mobile/data/data_sources/api/api_client.dart';
import 'package:breizh_blok_mobile/data/data_sources/local/app_database.dart';
import 'package:breizh_blok_mobile/data/data_sources/local/model/image_boulder_cache.dart';
import 'package:breizh_blok_mobile/data/repositories/boulder/boulder_repository.dart';
import 'package:breizh_blok_mobile/data/repositories/boulder_area/boulder_area_repository.dart';
import 'package:breizh_blok_mobile/data/repositories/boulder_marker/boulder_marker_repository.dart';
import 'package:breizh_blok_mobile/data/repositories/department/department_repository.dart';
import 'package:breizh_blok_mobile/data/repositories/downloaded_boulder_repository/downloaded_boulder_repository.dart';
import 'package:breizh_blok_mobile/data/repositories/municipality/municipality_repository.dart';
import 'package:breizh_blok_mobile/domain/repositories/boulder_feedback_repository.dart';
import 'package:breizh_blok_share_content/breizh_blok_share_content.dart';
import 'package:breizh_blok_url_launcher/breizh_blok_url_launcher.dart';
import 'package:dio/dio.dart' hide Response;
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/src/foundation/diagnostics.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:location/location.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart' hide Response;
import 'package:mocktail/mocktail.dart';
import 'package:upgrader/upgrader.dart';

class MockApiBoulderFeedbackDataSource extends Mock
    implements ApiBoulderFeedbackDataSource {}

class MockApiClient extends Mock implements ApiClient {}

class MockAppDatabase extends Mock implements AppDatabase {}

class MockAuth extends Mock implements Auth {}

class MockBoulderAreaRepository extends Mock implements BoulderAreaRepository {}

class MockBoulderFeedbackRepository extends Mock
    implements BoulderFeedbackRepository {}

class MockBoulderRepository extends Mock implements BoulderRepository {}

class MockBoulderMarkerRepository extends Mock
    implements BoulderMarkerRepository {}

class MockBreizhBlokApiBoulderFeedbackApi extends Mock
    implements breizh_blok_api.BoulderFeedbackApi {}

class MockBreizhBlokApiAuthZeroUserApi extends Mock
    implements breizh_blok_api.AuthZeroUserApi {}

class MockBreizhBlokApiBoulderFeedbackJsonldBoulderFeedbackRead extends Mock
    implements breizh_blok_api.BoulderFeedbackJsonldBoulderFeedbackRead {}

class MockCacheManager extends Mock implements CacheManager {}

class MockDepartmentRepository extends Mock implements DepartmentRepository {}

class MockDio extends Mock implements Dio {}

class MockDownloadedBoulderRepository extends Mock
    implements DownloadedBoulderRepository {}

class MockErrorInterceptorHandler extends Mock
    implements ErrorInterceptorHandler {}

class MockFirebaseRemoteConfig extends Mock implements FirebaseRemoteConfig {}

class MockImageBoulderCache extends Mock implements ImageBoulderCache {}

class MockLocation extends Mock implements Location {}

class MockMapboxMap extends Mock implements MapboxMap {}

class MockAnalytics extends Mock implements Analytics {}

class MockMunicipalityRepository extends Mock
    implements MunicipalityRepository {}

class MockRequestInterceptorHandler extends Mock
    implements RequestInterceptorHandler {}

class MockShareContent extends Mock implements ShareContent {}

class MockStatefulNavigationShell extends Mock
    implements StatefulNavigationShell {
  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return super.toString();
  }
}

class MockStyleManager extends Mock implements StyleManager {}

class MockTitleMeta extends Mock implements TitleMeta {}

class MockUpgrader extends Mock implements Upgrader {}

class MockUpgraderStore extends Mock implements UpgraderStore {}

class MockUrlLauncher extends Mock implements UrlLauncher {}

Upgrader mockUpgrader() {
  final Upgrader upgrader = MockUpgrader();

  final upgraderState = UpgraderState(
    client: MockClient((_) async => Response('', 404)),
    upgraderOS: MockUpgraderOS(),
  );

  when(upgrader.initialize).thenAnswer((_) async => true);
  when(() => upgrader.state).thenReturn(
    upgraderState,
  );

  when(() => upgrader.stateStream).thenAnswer(
    (_) => Stream.value(
      upgraderState,
    ),
  );

  return upgrader;
}
