import 'package:breizh_blok_mobile/data/data_sources/api/extensions/dio_extension.dart';
import 'package:breizh_blok_mobile/domain/entities/domain_exception/domain_exception.dart';
import 'package:breizh_blok_mobile/domain/entities/user/user.dart';
import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';

class ApiUserProfileDataSource {
  ApiUserProfileDataSource({required this.dio});

  final Dio dio;

  TaskEither<DomainException, User?> get(String id) {
    return TaskEither.tryCatch(
      () {
        return dio
            .get<Map<String, Object?>>(
              '/users/$id',
            )
            .then((res) {
              final userData = res.data?['user'];
              if (userData != null && userData is Map<String, dynamic>) {
                return User.fromJson(userData);
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
