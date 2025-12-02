import 'package:breizh_blok_mobile/service_locator/repositories.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'firebase.g.dart';

@riverpod
FirebaseRemoteConfig firebaseRemoteConfig(Ref ref) {
  return FirebaseRemoteConfig.instance;
}

@riverpod
RemoteConfigSettings remoteConfigSettings(Ref ref) {
  return RemoteConfigSettings(
    fetchTimeout: const Duration(seconds: 5),
    minimumFetchInterval: const Duration(hours: 1),
  );
}

@riverpod
Future<bool?> initializeFirebase(Ref ref) async {
  final remoteConfig = ref.watch(firebaseRemoteConfigProvider);
  await remoteConfig.setConfigSettings(
    ref.watch(remoteConfigSettingsProvider),
  );

  final subscription = remoteConfig.onConfigUpdated.listen((event) async {});

  ref.onDispose(subscription.cancel);

  remoteConfig.fetch().ignore();

  return remoteConfig.activate();
}
