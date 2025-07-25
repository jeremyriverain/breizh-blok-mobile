import 'package:breizh_blok_api_generated/breizh_blok_api_generated.dart'
    as breizh_blok_api;
import 'package:breizh_blok_auth/breizh_blok_auth.dart';
import 'package:breizh_blok_mobile/data/data_sources/api/api_boulder_feedback_data_source.dart';
import 'package:breizh_blok_mobile/data/data_sources/api/api_client.dart';
import 'package:breizh_blok_mobile/data/data_sources/local/app_database.dart';
import 'package:breizh_blok_mobile/data/data_sources/local/model/image_boulder_cache.dart';
import 'package:breizh_blok_mobile/data/repositories/boulder/boulder_repository.dart';
import 'package:breizh_blok_mobile/data/repositories/boulder_area/boulder_area_repository.dart';
import 'package:breizh_blok_mobile/data/repositories/boulder_feedback/boulder_feedback_repository.dart';
import 'package:breizh_blok_mobile/data/repositories/boulder_marker/boulder_marker_repository.dart';
import 'package:breizh_blok_mobile/data/repositories/department/department_repository.dart';
import 'package:breizh_blok_mobile/data/repositories/downloaded_boulder_repository/downloaded_boulder_repository.dart';
import 'package:breizh_blok_mobile/data/repositories/municipality/municipality_repository.dart';
import 'package:breizh_blok_mobile/services/share_content/share_content_service.dart';
import 'package:dio/dio.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';
import 'package:mixpanel_flutter/mixpanel_flutter.dart';
import 'package:mocktail/mocktail.dart';

class MockApiBoulderFeedbackDataSource extends Mock
    implements ApiBoulderFeedbackDataSource {}

class MockApiClient extends Mock implements ApiClient {}

class MockAppDatabase extends Mock implements AppDatabase {}

class MockAuth extends Mock implements Auth {}

class MockBoulderAreaRepository extends Mock implements BoulderAreaRepository {}

class MockBoulderRepository extends Mock implements BoulderRepository {}

class MockBoulderMarkerRepository extends Mock
    implements BoulderMarkerRepository {}

class MockBreizhBlokApiBoulderFeedbackApi extends Mock
    implements breizh_blok_api.BoulderFeedbackApi {}

class MockBreizhBlokApiBoulderFeedbackJsonldBoulderFeedbackRead extends Mock
    implements breizh_blok_api.BoulderFeedbackJsonldBoulderFeedbackRead {}

class MockCacheManager extends Mock implements CacheManager {}

class MockDepartmentRepository extends Mock implements DepartmentRepository {}

class MockDio extends Mock implements Dio {}

class MockDownloadedBoulderRepository extends Mock
    implements DownloadedBoulderRepository {}

class MockErrorInterceptorHandler extends Mock
    implements ErrorInterceptorHandler {}

class MockBoulderFeedbackRepository extends Mock
    implements BoulderFeedbackRepository {}

class MockImageBoulderCache extends Mock implements ImageBoulderCache {}

class MockMapboxMap extends Mock implements MapboxMap {}

class MockMixpanel extends Mock implements Mixpanel {}

class MockMunicipalityRepository extends Mock
    implements MunicipalityRepository {}

class MockRequestInterceptorHandler extends Mock
    implements RequestInterceptorHandler {}

class MockShareContentService extends Mock implements ShareContentService {}

class MockStyleManager extends Mock implements StyleManager {}

class MockTitleMeta extends Mock implements TitleMeta {}
