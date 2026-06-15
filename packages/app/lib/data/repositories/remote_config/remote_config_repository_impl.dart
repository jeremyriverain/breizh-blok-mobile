import 'package:breizh_blok_mobile/domain/entities/domain_exception/domain_exception.dart';
import 'package:breizh_blok_mobile/domain/repositories/remote_config_repository.dart';
import 'package:fpdart/fpdart.dart';

class RemoteConfigRepositoryImpl implements RemoteConfigRepository {
  RemoteConfigRepositoryImpl();

  @override
  Either<DomainException, String?> getString(String key) {
    return Either.tryCatch(
      () {
        return '2.20.0';
      },
      (error, _) {
        return DomainException.unknown(message: error.toString());
      },
    );
  }
}
