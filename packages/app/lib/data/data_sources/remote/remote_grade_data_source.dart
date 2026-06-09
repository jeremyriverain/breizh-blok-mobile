import 'package:breizh_blok_mobile/data/data_sources/remote/extensions/dio_extension.dart';
import 'package:breizh_blok_mobile/data/data_sources/remote/model/api_order_param.dart';
import 'package:breizh_blok_mobile/data/data_sources/remote/model/paginated_collection.dart';
import 'package:breizh_blok_mobile/domain/entities/domain_exception/domain_exception.dart';
import 'package:breizh_blok_mobile/domain/entities/grade/grade.dart';
import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';

class RemoteGradeDataSource {
  RemoteGradeDataSource({required this._dio});

  final Dio _dio;

  TaskEither<DomainException, List<Grade>> findAll() {
    return TaskEither.tryCatch(
      () async {
        final response = await _dio.get<Map<String, Object?>>(
          '/grades',
          queryParameters: {
            'exists[boulders]': ['true'],
            'pagination': ['false'],
            'order[name]': [kAscendantDirection],
          },
        );

        if (response.statusCode != 200) {
          throw Exception(
            'response is not successful. status code ${response.statusCode}',
          );
        }

        final data = response.data;
        if (data == null) {
          throw Exception(
            'data is null !',
          );
        }

        return PaginatedCollection<Grade>.fromApi(
          data,
          Grade.fromJson,
        ).items;
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
