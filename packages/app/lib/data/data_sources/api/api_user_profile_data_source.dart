import 'package:breizh_blok_api_generated/breizh_blok_api_generated.dart' as a;
import 'package:breizh_blok_mobile/data/data_sources/api/extensions/dio_extension.dart';
import 'package:breizh_blok_mobile/data/mappers/api/api_user_profile_mapper.dart';
import 'package:breizh_blok_mobile/domain/entities/domain_exception/domain_exception.dart';
import 'package:breizh_blok_mobile/domain/entities/user/user.dart';
import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';

class ApiUserProfileDataSource {
  ApiUserProfileDataSource({required a.AuthZeroUserApi api})
    : _mapper = const ApiUserProfileMapper(),
      _api = api;

  final ApiUserProfileMapper _mapper;
  final a.AuthZeroUserApi _api;

  TaskEither<DomainException, User?> get(String id) {
    return TaskEither.tryCatch(
      () {
        return _api
            .apiUsersIdGet(
              id: id,
            )
            .then((res) {
              final user = res.data?.user;
              if (user != null) {
                return _mapper.toDomainFromUserRead(user);
              }

              return null;
            });
      },
      (e, _) {
        if (e is DioException) {
          return e.convertToDomainException;
        }
        return UnknownException(message: e.toString());
      },
    );
  }
}
