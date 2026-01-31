import 'package:breizh_blok_mobile/data/data_sources/api/api_boulder_feedback_data_source.dart';
import 'package:breizh_blok_mobile/data/data_sources/api/api_user_profile_data_source.dart';
import 'package:breizh_blok_mobile/data/data_sources/api/dio/create_dio.dart';
import 'package:breizh_blok_mobile/data/repositories/boulder_feedback/boulder_feedback_repository_impl.dart';
import 'package:breizh_blok_mobile/data/repositories/remote_config/remote_config_repository_impl.dart';
import 'package:breizh_blok_mobile/data/repositories/user_profile/user_profile_repository_impl.dart';
import 'package:breizh_blok_mobile/domain/repositories/boulder_feedback_repository.dart';
import 'package:breizh_blok_mobile/domain/repositories/remote_config_repository.dart';
import 'package:breizh_blok_mobile/domain/repositories/user_profile_repository.dart';
import 'package:breizh_blok_mobile/service_locator/firebase.dart';
import 'package:breizh_blok_mobile/service_locator/locale.dart';
import 'package:breizh_blok_mobile/service_locator/service_locator.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'repositories.g.dart';

@riverpod
Dio dio(Ref ref) {
  return createDio(
    auth: ref.watch(authProvider),
    locale: ref.watch(myLocaleProvider),
  );
}

@riverpod
BoulderFeedbackRepository boulderFeedbackRepository(Ref ref) {
  return BoulderFeedbackRepositoryImpl(
    apiDataSource: ApiBoulderFeedbackDataSource(
      dio: ref.watch(dioProvider),
    ),
  );
}

@riverpod
RemoteConfigRepository remoteConfigRepository(Ref ref) {
  return RemoteConfigRepositoryImpl(
    firebaseRemoteConfig: ref.watch(firebaseRemoteConfigProvider),
  );
}

@riverpod
UserProfileRepository userProfileRepository(Ref ref) {
  return UserProfileRepositoryImpl(
    apiDataSource: ApiUserProfileDataSource(
      dio: ref.watch(dioProvider),
    ),
  );
}
