import 'package:breizh_blok_mobile/data/data_sources/remote/model/api_order_param.dart';
import 'package:breizh_blok_mobile/data/data_sources/remote/remote_grade_data_source.dart';
import 'package:breizh_blok_mobile/domain/entities/domain_exception/domain_exception.dart';
import 'package:breizh_blok_mobile/domain/entities/grade/grade.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mocks.dart';

void main() {
  group('RemoteGradeDataSource', () {
    late Dio dio;

    late RemoteGradeDataSource dataSource;

    setUp(() {
      dio = MockDio();
      dataSource = RemoteGradeDataSource(dio: dio);
    });
    group('findAll', () {
      test(
        'throws Exception if exception is thrown while retrieving pagination',
        () async {
          when(
            () => dio.get<Map<String, Object?>>(
              '/grades',
              queryParameters: {
                'exists[boulders]': ['true'],
                'pagination': ['false'],
                'order[name]': [kAscendantDirection],
              },
            ),
          ).thenThrow(Exception('foo'));
          final result = await dataSource.findAll().run();
          expect(result.isLeft(), isTrue);
          verify(
            () => dio.get<Map<String, Object?>>(
              '/grades',
              queryParameters: {
                'exists[boulders]': ['true'],
                'pagination': ['false'],
                'order[name]': [kAscendantDirection],
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
        'throws Exception if DioException',
        () async {
          when(
            () => dio.get<Map<String, Object?>>(
              '/grades',
              queryParameters: {
                'exists[boulders]': ['true'],
                'pagination': ['false'],
                'order[name]': [kAscendantDirection],
              },
            ),
          ).thenThrow(
            DioException(
              requestOptions: RequestOptions(),
            ),
          );
          final result = await dataSource.findAll().run();
          expect(result.isLeft(), isTrue);
          verify(
            () => dio.get<Map<String, Object?>>(
              '/grades',
              queryParameters: {
                'exists[boulders]': ['true'],
                'pagination': ['false'],
                'order[name]': [kAscendantDirection],
              },
            ),
          ).called(1);
          verifyNoMoreInteractions(dio);

          expect(
            result.getLeft().toNullable(),
            isA<UnknownException>().having(
              (e) => e.message,
              'message',
              equals('status code: null, path: null'),
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
              '/grades',
              queryParameters: {
                'exists[boulders]': ['true'],
                'pagination': ['false'],
                'order[name]': [kAscendantDirection],
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
              '/grades',
              queryParameters: {
                'exists[boulders]': ['true'],
                'pagination': ['false'],
                'order[name]': [kAscendantDirection],
              },
            ),
          ).called(1);
          verifyNoMoreInteractions(dio);

          expect(
            result.getLeft().toNullable(),
            isA<UnknownException>().having(
              (e) => e.message,
              'message',
              equals('Exception: response is not successful. status code 302'),
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
              '/grades',
              queryParameters: {
                'exists[boulders]': ['true'],
                'pagination': ['false'],
                'order[name]': [kAscendantDirection],
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
              '/grades',
              queryParameters: {
                'exists[boulders]': ['true'],
                'pagination': ['false'],
                'order[name]': [kAscendantDirection],
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
        'return grades',
        () async {
          when(
            () => dio.get<Map<String, Object?>>(
              '/grades',
              queryParameters: {
                'exists[boulders]': ['true'],
                'pagination': ['false'],
                'order[name]': [kAscendantDirection],
              },
            ),
          ).thenAnswer(
            (_) async => Response(
              requestOptions: RequestOptions(),
              statusCode: 200,
              data: {
                'hydra:totalItems': 2,
                'hydra:member': [
                  {'@id': '/grades/2', '@type': 'Grade', 'name': '5'},
                  {'@id': '/grades/3', '@type': 'Grade', 'name': '5+'},
                ],
              },
            ),
          );

          final result = await dataSource.findAll().run();
          expect(result.isRight(), isTrue);
          verify(
            () => dio.get<Map<String, Object?>>(
              '/grades',
              queryParameters: {
                'exists[boulders]': ['true'],
                'pagination': ['false'],
                'order[name]': [kAscendantDirection],
              },
            ),
          ).called(1);
          verifyNoMoreInteractions(dio);

          expect(
            result.getRight().toNullable(),
            equals(const [
              Grade(iri: '/grades/2', name: '5'),
              Grade(iri: '/grades/3', name: '5+'),
            ]),
          );
        },
      );
    });
  });
}
