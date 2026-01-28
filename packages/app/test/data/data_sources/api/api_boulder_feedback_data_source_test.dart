import 'package:breizh_blok_mobile/data/data_sources/api/api_boulder_feedback_data_source.dart';
import 'package:breizh_blok_mobile/domain/entities/domain_exception/domain_exception.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mocks.dart';
import '../../../test_utils.dart';

void main() {
  late Dio dio;

  late ApiBoulderFeedbackDataSource dataSource;

  setUp(() {
    dio = MockDio();
    dataSource = ApiBoulderFeedbackDataSource(dio: dio);
  });

  group('ApiBoulderFeedackDataSource', () {
    group('create', () {
      test('create boulder feedback successfully', () async {
        when(
          () => dio.post<void>(
            '/boulder_feedbacks',
            data: fakeBoulderFeedback.toJson(),
          ),
        ).thenAnswer(
          (_) async => Response(requestOptions: RequestOptions()),
        );

        final result = await dataSource.create(fakeBoulderFeedback).run();
        expect(result.isRight(), isTrue);

        verify(
          () => dio.post<void>(
            '/boulder_feedbacks',
            data: fakeBoulderFeedback.toJson(),
          ),
        ).called(1);
        verifyNoMoreInteractions(dio);
      });

      test('Given the API throws DioException with status code equal to 422 '
          'Then an UnprocessableEntityException is returned', () async {
        when(
          () => dio.post<void>(
            '/boulder_feedbacks',
            data: fakeBoulderFeedback.toJson(),
          ),
        ).thenAnswer(
          (_) async => throw DioException(
            requestOptions: RequestOptions(),
            response: Response(
              requestOptions: RequestOptions(),
              statusCode: 422,
            ),
          ),
        );

        final result = await dataSource.create(fakeBoulderFeedback).run();
        expect(result.isLeft(), isTrue);
        expect(
          result.getLeft().toNullable(),
          isA<UnprocessableEntityException>(),
        );

        verify(
          () => dio.post<void>(
            '/boulder_feedbacks',
            data: fakeBoulderFeedback.toJson(),
          ),
        ).called(1);
        verifyNoMoreInteractions(dio);
      });

      test('Given the API throws an unknown DioException  '
          'Then an UnknownException is returned', () async {
        when(
          () => dio.post<void>(
            '/boulder_feedbacks',
            data: fakeBoulderFeedback.toJson(),
          ),
        ).thenAnswer(
          (_) async => throw DioException(
            requestOptions: RequestOptions(),
            response: Response(requestOptions: RequestOptions()),
          ),
        );

        final result = await dataSource.create(fakeBoulderFeedback).run();
        expect(result.isLeft(), isTrue);
        expect(result.getLeft().toNullable(), isA<UnknownException>());

        verify(
          () => dio.post<void>(
            '/boulder_feedbacks',
            data: fakeBoulderFeedback.toJson(),
          ),
        ).called(1);
        verifyNoMoreInteractions(dio);
      });

      test('Given the API throws an unknown Exception  '
          'Then an UnknownException is returned', () async {
        when(
          () => dio.post<void>(
            '/boulder_feedbacks',
            data: fakeBoulderFeedback.toJson(),
          ),
        ).thenAnswer((_) async => throw Exception('foo'));

        final result = await dataSource.create(fakeBoulderFeedback).run();
        expect(result.isLeft(), isTrue);
        expect(result.getLeft().toNullable(), isA<UnknownException>());

        verify(
          () => dio.post<void>(
            '/boulder_feedbacks',
            data: fakeBoulderFeedback.toJson(),
          ),
        ).called(1);
        verifyNoMoreInteractions(dio);
      });
    });
  });
}
