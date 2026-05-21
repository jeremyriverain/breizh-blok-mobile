import 'package:breizh_blok_mobile/data/data_sources/remote/extensions/dio_extension.dart';
import 'package:breizh_blok_mobile/data/data_sources/remote/model/paginated_collection.dart';
import 'package:breizh_blok_mobile/domain/entities/boulder_geo_point/boulder_geo_point.dart';
import 'package:breizh_blok_mobile/domain/entities/domain_exception/domain_exception.dart';
import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';

class RemoteBoulderGeoPointDataSource {
  RemoteBoulderGeoPointDataSource({required this.dio});

  final Dio dio;

  TaskEither<DomainException, List<BoulderGeoPoint>> findAll() {
    return TaskEither.tryCatch(
      () async {
        final response = await dio.get<Map<String, Object?>>(
          '/boulders',
          queryParameters: {
            'itemsPerPage': '0',
            'groups[]': 'Boulder:map:v2',
          },
        );

        if (response.statusCode != 200) {
          throw Exception(
            'response is not successfull. status code ${response.statusCode}',
          );
        }

        final data = response.data;
        if (data == null) {
          throw Exception(
            'data is null !',
          );
        }

        final paginatedCollection = PaginatedCollection.fromApi(
          data,
          (_) => throw Exception('no item should be returned'),
        );

        final numPages = (paginatedCollection.totalItems / 1000).ceil();

        final responses = await Future.wait(
          List.generate(
            numPages,
            (index) => dio
                .get<List<dynamic>>(
                  '/boulders',
                  queryParameters: {
                    'page': '${index + 1}',
                    'itemsPerPage': '1000',
                    'groups[]': 'Boulder:map:v2',
                  },
                  options: Options(headers: {'Accept': 'application/json'}),
                )
                .then((r) {
                  return r.data
                      ?.map<BoulderGeoPoint>(
                        (i) =>
                            BoulderGeoPoint.fromJson(i as Map<String, dynamic>),
                      )
                      .toList();
                }),
          ),
          eagerError: true,
        );

        return responses
            .whereType<List<BoulderGeoPoint>>()
            .expand<BoulderGeoPoint>((x) => x)
            .toList();
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
