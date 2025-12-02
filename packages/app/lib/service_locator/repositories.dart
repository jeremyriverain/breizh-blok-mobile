import 'package:breizh_blok_mobile/data/data_sources/api/api_boulder_feedback_data_source.dart';
import 'package:breizh_blok_mobile/data/repositories/boulder_feedback/boulder_feedback_repository_impl.dart';
import 'package:breizh_blok_mobile/data/repositories/remote_config/remote_config_repository_impl.dart';
import 'package:breizh_blok_mobile/domain/repositories/boulder_feedback_repository.dart';
import 'package:breizh_blok_mobile/domain/repositories/remote_config_repository.dart';
import 'package:breizh_blok_mobile/service_locator/firebase.dart';
import 'package:breizh_blok_mobile/service_locator/service_locator.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'repositories.g.dart';

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
RemoteConfigRepository remoteConfigRepository(Ref ref) {
  return RemoteConfigRepositoryImpl(
    firebaseRemoteConfig: ref.watch(firebaseRemoteConfigProvider),
  );
}
