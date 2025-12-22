import 'package:breizh_blok_mobile/domain/entities/domain_exception/domain_exception.dart';
import 'package:breizh_blok_mobile/domain/entities/user/user.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class UserProfileRepository {
  TaskEither<DomainException, User?> get(String id);
}
