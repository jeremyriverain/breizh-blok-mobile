import 'package:breizh_blok_mobile/data/data_sources/remote/remote_boulder_geo_point_data_source.dart';
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
    });
  });
}
