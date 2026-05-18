import 'package:breizh_blok_mobile/data/data_sources/remote/dio/create_dio.dart';
import 'package:breizh_blok_mobile/data/data_sources/remote/remote_boulder_feedback_data_source.dart';
import 'package:breizh_blok_mobile/data/data_sources/remote/remote_user_profile_data_source.dart';
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

@Riverpod(keepAlive: true)
Dio dio(Ref ref) {
  return createDio(
    auth: ref.watch(authProvider),
    locale: ref.watch(myLocaleProvider),
  );
}

@Riverpod(keepAlive: true)
BoulderFeedbackRepository boulderFeedbackRepository(Ref ref) {
  return BoulderFeedbackRepositoryImpl(
    apiDataSource: RemoteBoulderFeedbackDataSource(
      dio: ref.watch(dioProvider),
    ),
  );
}

@Riverpod(keepAlive: true)
RemoteConfigRepository remoteConfigRepository(Ref ref) {
  return RemoteConfigRepositoryImpl(
    firebaseRemoteConfig: ref.watch(firebaseRemoteConfigProvider),
  );
}

@Riverpod(keepAlive: true)
UserProfileRepository userProfileRepository(Ref ref) {
  return UserProfileRepositoryImpl(
    apiDataSource: RemoteUserProfileDataSource(
      dio: ref.watch(dioProvider),
    ),
  );
}
