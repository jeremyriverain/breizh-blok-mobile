import 'package:breizh_blok_mobile/data/data_sources/remote/remote_boulder_geo_point_data_source.dart';
import 'package:breizh_blok_mobile/domain/entities/boulder_geo_point/boulder_geo_point.dart';
import 'package:breizh_blok_mobile/domain/entities/domain_exception/domain_exception.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mocks.dart';

void main() {
  group('RemoteBoulderGeoPointDataSource', () {
    late Dio dio;

    late RemoteBoulderGeoPointDataSource dataSource;

    setUp(() {
      dio = MockDio();
      dataSource = RemoteBoulderGeoPointDataSource(dio: dio);
    });
    group('findAll', () {
      test(
        'throws Exception if exception is thrown while retrieving pagination',
        () async {
          when(
            () => dio.get<Map<String, Object?>>(
              '/boulders',
              queryParameters: {
                'itemsPerPage': '0',
                'groups[]': 'Boulder:map:v2',
              },
            ),
          ).thenThrow(Exception('foo'));
          final result = await dataSource.findAll().run();
          expect(result.isLeft(), isTrue);
          verify(
            () => dio.get<Map<String, Object?>>(
              '/boulders',
              queryParameters: {
                'itemsPerPage': '0',
                'groups[]': 'Boulder:map:v2',
              },
            ),
          ).called(1);
          verifyNoMoreInteractions(dio);

          expect(
            result.getLeft().toNullable(),
            isA<UnknownException>().having(
              (e) => e.message,
              'message',
              equals('Exception: foo'),
            ),
          );
        },
      );

      test(
        'throws Exception '
        'if status code is not 200 while retrieving pagination',
        () async {
          when(
            () => dio.get<Map<String, Object?>>(
              '/boulders',
              queryParameters: {
                'itemsPerPage': '0',
                'groups[]': 'Boulder:map:v2',
              },
            ),
          ).thenAnswer(
            (_) async =>
                Response(requestOptions: RequestOptions(), statusCode: 302),
          );
          final result = await dataSource.findAll().run();
          expect(result.isLeft(), isTrue);
          verify(
            () => dio.get<Map<String, Object?>>(
              '/boulders',
              queryParameters: {
                'itemsPerPage': '0',
                'groups[]': 'Boulder:map:v2',
              },
            ),
          ).called(1);
          verifyNoMoreInteractions(dio);

          expect(
            result.getLeft().toNullable(),
            isA<UnknownException>().having(
              (e) => e.message,
              'message',
              equals('Exception: response is not successfull. status code 302'),
            ),
          );
        },
      );

      test(
        'throws Exception '
        'if data is null while retrieving pagination',
        () async {
          when(
            () => dio.get<Map<String, Object?>>(
              '/boulders',
              queryParameters: {
                'itemsPerPage': '0',
                'groups[]': 'Boulder:map:v2',
              },
            ),
          ).thenAnswer(
            (_) async =>
                Response(requestOptions: RequestOptions(), statusCode: 200),
          );
          final result = await dataSource.findAll().run();
          expect(result.isLeft(), isTrue);
          verify(
            () => dio.get<Map<String, Object?>>(
              '/boulders',
              queryParameters: {
                'itemsPerPage': '0',
                'groups[]': 'Boulder:map:v2',
              },
            ),
          ).called(1);
          verifyNoMoreInteractions(dio);

          expect(
            result.getLeft().toNullable(),
            isA<UnknownException>().having(
              (e) => e.message,
              'message',
              equals('Exception: data is null !'),
            ),
          );
        },
      );

      test(
        'throws Exception '
        'if pagination retrieved is incorrect',
        () async {
          when(
            () => dio.get<Map<String, Object?>>(
              '/boulders',
              queryParameters: {
                'itemsPerPage': '0',
                'groups[]': 'Boulder:map:v2',
              },
            ),
          ).thenAnswer(
            (_) async => Response(
              requestOptions: RequestOptions(),
              statusCode: 200,
              data: {'foo': 'bar'},
            ),
          );
          final result = await dataSource.findAll().run();
          expect(result.isLeft(), isTrue);
          verify(
            () => dio.get<Map<String, Object?>>(
              '/boulders',
              queryParameters: {
                'itemsPerPage': '0',
                'groups[]': 'Boulder:map:v2',
              },
            ),
          ).called(1);
          verifyNoMoreInteractions(dio);

          expect(
            result.getLeft().toNullable(),
            isA<UnknownException>().having(
              (e) => e.message,
              'message',
              contains('not a subtype'),
            ),
          );
        },
      );

      test(
        'throws Exception '
        'if pagination retrieved an item although we expect 0 item',
        () async {
          when(
            () => dio.get<Map<String, Object?>>(
              '/boulders',
              queryParameters: {
                'itemsPerPage': '0',
                'groups[]': 'Boulder:map:v2',
              },
            ),
          ).thenAnswer(
            (_) async => Response(
              requestOptions: RequestOptions(),
              statusCode: 200,
              data: {
                'hydra:totalItems': 10,
                'hydra:member': [
                  {'foo': 'bar'},
                ],
              },
            ),
          );
          final result = await dataSource.findAll().run();
          expect(result.isLeft(), isTrue);
          verify(
            () => dio.get<Map<String, Object?>>(
              '/boulders',
              queryParameters: {
                'itemsPerPage': '0',
                'groups[]': 'Boulder:map:v2',
              },
            ),
          ).called(1);
          verifyNoMoreInteractions(dio);

          expect(
            result.getLeft().toNullable(),
            isA<UnknownException>().having(
              (e) => e.message,
              'message',
              equals('Exception: no item should be returned'),
            ),
          );
        },
      );

      test(
        'no further API calls are made if total items is equal to 0',
        () async {
          when(
            () => dio.get<Map<String, Object?>>(
              '/boulders',
              queryParameters: {
                'itemsPerPage': '0',
                'groups[]': 'Boulder:map:v2',
              },
            ),
          ).thenAnswer(
            (_) async => Response(
              requestOptions: RequestOptions(),
              statusCode: 200,
              data: {
                'hydra:totalItems': 0,
                'hydra:member': [],
              },
            ),
          );
          final result = await dataSource.findAll().run();
          expect(result.isRight(), isTrue);
          verify(
            () => dio.get<Map<String, Object?>>(
              '/boulders',
              queryParameters: {
                'itemsPerPage': '0',
                'groups[]': 'Boulder:map:v2',
              },
            ),
          ).called(1);
          verifyNoMoreInteractions(dio);

          expect(
            result.getRight().toNullable(),
            equals(const []),
          );
        },
      );

      test(
        'return boulder geo points of one page',
        () async {
          when(
            () => dio.get<Map<String, Object?>>(
              '/boulders',
              queryParameters: {
                'itemsPerPage': '0',
                'groups[]': 'Boulder:map:v2',
              },
            ),
          ).thenAnswer(
            (_) async => Response(
              requestOptions: RequestOptions(),
              statusCode: 200,
              data: {
                'hydra:totalItems': 1,
                'hydra:member': [],
              },
            ),
          );

          when(
            () => dio.get<List<dynamic>>(
              '/boulders',
              queryParameters: {
                'page': '1',
                'itemsPerPage': '1000',
                'groups[]': 'Boulder:map:v2',
              },
              options: any(named: 'options'),
            ),
          ).thenAnswer(
            (_) async => Response(
              requestOptions: RequestOptions(),
              statusCode: 200,
              data: [
                {'id': 5, 'lat': '48.66637', 'lng': '-4.3761749', 'areaId': 3},
              ],
            ),
          );
          final result = await dataSource.findAll().run();
          expect(result.isRight(), isTrue);
          verify(
            () => dio.get<Map<String, Object?>>(
              '/boulders',
              queryParameters: {
                'itemsPerPage': '0',
                'groups[]': 'Boulder:map:v2',
              },
            ),
          ).called(1);
          verify(
            () => dio.get<List<dynamic>>(
              '/boulders',
              queryParameters: {
                'page': '1',
                'itemsPerPage': '1000',
                'groups[]': 'Boulder:map:v2',
              },
              options: any(named: 'options'),
            ),
          ).called(1);
          verifyNoMoreInteractions(dio);

          expect(
            result.getRight().toNullable(),
            equals(const [
              BoulderGeoPoint(id: 5, lat: 48.66637, lng: -4.3761749, areaId: 3),
            ]),
          );
        },
      );

      test(
        'return boulder geo points from two pages '
        'if totalItems exceeds the threshold',
        () async {
          when(
            () => dio.get<Map<String, Object?>>(
              '/boulders',
              queryParameters: {
                'itemsPerPage': '0',
                'groups[]': 'Boulder:map:v2',
              },
            ),
          ).thenAnswer(
            (_) async => Response(
              requestOptions: RequestOptions(),
              statusCode: 200,
              data: {
                'hydra:totalItems': 1001,
                'hydra:member': [],
              },
            ),
          );

          when(
            () => dio.get<List<dynamic>>(
              '/boulders',
              queryParameters: {
                'page': '1',
                'itemsPerPage': '1000',
                'groups[]': 'Boulder:map:v2',
              },
              options: any(named: 'options'),
            ),
          ).thenAnswer(
            (_) async => Response(
              requestOptions: RequestOptions(),
              statusCode: 200,
              data: [
                {'id': 5, 'lat': '48.66637', 'lng': '-4.3761749', 'areaId': 3},
              ],
            ),
          );
          when(
            () => dio.get<List<dynamic>>(
              '/boulders',
              queryParameters: {
                'page': '2',
                'itemsPerPage': '1000',
                'groups[]': 'Boulder:map:v2',
              },
              options: any(named: 'options'),
            ),
          ).thenAnswer(
            (_) async => Response(
              requestOptions: RequestOptions(),
              statusCode: 200,
              data: [
                {'id': 6, 'lat': '48', 'lng': '-4', 'areaId': 4},
              ],
            ),
          );
          final result = await dataSource.findAll().run();
          expect(result.isRight(), isTrue);
          verify(
            () => dio.get<Map<String, Object?>>(
              '/boulders',
              queryParameters: {
                'itemsPerPage': '0',
                'groups[]': 'Boulder:map:v2',
              },
            ),
          ).called(1);
          verify(
            () => dio.get<List<dynamic>>(
              '/boulders',
              queryParameters: {
                'page': '1',
                'itemsPerPage': '1000',
                'groups[]': 'Boulder:map:v2',
              },
              options: any(named: 'options'),
            ),
          ).called(1);
          verify(
            () => dio.get<List<dynamic>>(
              '/boulders',
              queryParameters: {
                'page': '2',
                'itemsPerPage': '1000',
                'groups[]': 'Boulder:map:v2',
              },
              options: any(named: 'options'),
            ),
          ).called(1);
          verifyNoMoreInteractions(dio);

          expect(
            result.getRight().toNullable(),
            equals(const [
              BoulderGeoPoint(id: 5, lat: 48.66637, lng: -4.3761749, areaId: 3),
              BoulderGeoPoint(id: 6, lat: 48, lng: -4, areaId: 4),
            ]),
          );
        },
      );

      test(
        'return left result '
        'if any of the further API calls throws an exception',
        () async {
          when(
            () => dio.get<Map<String, Object?>>(
              '/boulders',
              queryParameters: {
                'itemsPerPage': '0',
                'groups[]': 'Boulder:map:v2',
              },
            ),
          ).thenAnswer(
            (_) async => Response(
              requestOptions: RequestOptions(),
              statusCode: 200,
              data: {
                'hydra:totalItems': 1001,
                'hydra:member': [],
              },
            ),
          );

          when(
            () => dio.get<List<dynamic>>(
              '/boulders',
              queryParameters: {
                'page': '1',
                'itemsPerPage': '1000',
                'groups[]': 'Boulder:map:v2',
              },
              options: any(named: 'options'),
            ),
          ).thenAnswer(
            (_) async => Response(
              requestOptions: RequestOptions(),
              statusCode: 200,
              data: [
                {'id': 5, 'lat': '48.66637', 'lng': '-4.3761749', 'areaId': 3},
              ],
            ),
          );
          when(
            () => dio.get<List<dynamic>>(
              '/boulders',
              queryParameters: {
                'page': '2',
                'itemsPerPage': '1000',
                'groups[]': 'Boulder:map:v2',
              },
              options: any(named: 'options'),
            ),
          ).thenThrow(
            Exception('foo bar'),
          );
          final result = await dataSource.findAll().run();
          expect(result.isLeft(), isTrue);
          verify(
            () => dio.get<Map<String, Object?>>(
              '/boulders',
              queryParameters: {
                'itemsPerPage': '0',
                'groups[]': 'Boulder:map:v2',
              },
            ),
          ).called(1);
          verify(
            () => dio.get<List<dynamic>>(
              '/boulders',
              queryParameters: {
                'page': '1',
                'itemsPerPage': '1000',
                'groups[]': 'Boulder:map:v2',
              },
              options: any(named: 'options'),
            ),
          ).called(1);
          verify(
            () => dio.get<List<dynamic>>(
              '/boulders',
              queryParameters: {
                'page': '2',
                'itemsPerPage': '1000',
                'groups[]': 'Boulder:map:v2',
              },
              options: any(named: 'options'),
            ),
          ).called(1);
          verifyNoMoreInteractions(dio);

          expect(
            result.getLeft().toNullable(),
            isA<UnknownException>().having(
              (e) => e.message,
              'message',
              equals('Exception: foo bar'),
            ),
          );
        },
      );
    });
  });
}
