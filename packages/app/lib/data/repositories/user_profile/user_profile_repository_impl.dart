import 'package:breizh_blok_mobile/data/data_sources/api/api_user_profile_data_source.dart';
import 'package:breizh_blok_mobile/domain/entities/domain_exception/domain_exception.dart';
import 'package:breizh_blok_mobile/domain/entities/user/user.dart';
import 'package:breizh_blok_mobile/domain/repositories/user_profile_repository.dart';
import 'package:fpdart/fpdart.dart';

class UserProfileRepositoryImpl implements UserProfileRepository {
  UserProfileRepositoryImpl({required ApiUserProfileDataSource apiDataSource})
    : _apiDataSource = apiDataSource;

  final ApiUserProfileDataSource _apiDataSource;

  @override
  TaskEither<DomainException, User?> get(String id) {
    return _apiDataSource.get(id);
  }
}
