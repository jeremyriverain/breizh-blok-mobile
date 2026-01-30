import 'package:breizh_blok_mobile/domain/entities/domain_exception/domain_exception.dart';
import 'package:breizh_blok_mobile/domain/repositories/remote_config_repository.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:fpdart/fpdart.dart';

class RemoteConfigRepositoryImpl implements RemoteConfigRepository {
  RemoteConfigRepositoryImpl({required this.firebaseRemoteConfig});

  final FirebaseRemoteConfig firebaseRemoteConfig;

  @override
  Either<DomainException, String?> getString(String key) {
    return Either.tryCatch(
      () {
        final value = firebaseRemoteConfig.getString(key);
        if (value.isEmpty) {
          return null;
        }
        return value;
      },
      (error, _) {
        return DomainException.unknown(message: error.toString());
      },
    );
  }
}
