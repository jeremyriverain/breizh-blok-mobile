import 'package:breizh_blok_mobile/domain/entities/domain_exception/domain_exception.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class RemoteConfigRepository {
  Either<DomainException, String?> getString(String key);
}
