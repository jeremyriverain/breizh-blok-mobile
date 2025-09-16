import 'dart:io';

import 'package:breizh_blok_api_generated/breizh_blok_api_generated.dart'
    as api;
import 'package:breizh_blok_auth/breizh_blok_auth.dart';
import 'package:breizh_blok_mobile/data/data_sources/api/api_boulder_feedback_data_source.dart';
import 'package:breizh_blok_mobile/data/data_sources/api/api_client.dart';
import 'package:breizh_blok_mobile/data/data_sources/api/dio/create_dio.dart';
import 'package:breizh_blok_mobile/data/data_sources/local/app_database.dart';
import 'package:breizh_blok_mobile/data/repositories/boulder_feedback/boulder_feedback_repository_impl.dart';
import 'package:breizh_blok_mobile/domain/repositories/boulder_feedback_repository.dart';
import 'package:breizh_blok_mobile/services/share_content/share_content_service.dart';
import 'package:breizh_blok_mobile/services/share_content/share_content_service_impl.dart';
import 'package:breizh_blok_mobile/ui/locale/view_models/locale_view_model.dart';
import 'package:breizh_blok_url_launcher/breizh_blok_url_launcher.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:location/location.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'service_locator.g.dart';

@riverpod
ApiClient apiClient(Ref ref) {
  return ApiClient(database: ref.watch(appDatabaseProvider));
}

@riverpod
AppDatabase appDatabase(Ref ref) {
  return AppDatabase(
    LazyDatabase(() async {
      final dbFolder = await getApplicationDocumentsDirectory();
      final file = File(p.join(dbFolder.path, 'db.sqlite'));
      return NativeDatabase.createInBackground(file);
    }),
  );
}

@riverpod
Auth auth(Ref ref) {
  throw Exception();
}

@riverpod
BoulderFeedbackRepository boulderFeedbackRepository(Ref ref) {
  final breizhBlokApi = ref.watch(breizhBlokApiProvider);
  return BoulderFeedbackRepositoryImpl(
    apiDataSource: ApiBoulderFeedbackDataSource(
      api: breizhBlokApi.getBoulderFeedbackApi(),
    ),
  );
}

@riverpod
api.BreizhBlokApiGenerated breizhBlokApi(Ref ref) {
  return api.BreizhBlokApiGenerated(
    dio: createDio(auth: ref.watch(authProvider)),
  );
}

@riverpod
LocaleViewModel localeViewModel(Ref ref) {
  final sharedPreferences = ref.watch(sharedPreferencesProvider);
  return LocaleViewModel.create(sharedPreferences);
}

@riverpod
Location location(Ref ref) {
  return Location();
}

@riverpod
ShareContentService shareContentService(Ref ref) {
  return ShareContentServiceImpl();
}

@riverpod
SharedPreferences sharedPreferences(Ref ref) {
  throw Exception();
}

@riverpod
UrlLauncher urlLauncher(Ref ref) {
  return BreizhBlokUrlLauncher.createUrlLauncher();
}
