import 'package:breizh_blok_api_generated/breizh_blok_api_generated.dart'
    as breizh_blok_api;
import 'package:breizh_blok_mobile/data/data_sources/api/api_boulder_feedback_data_source.dart';
import 'package:breizh_blok_mobile/domain/entities/domain_exception/domain_exception.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mocks.dart';
import '../../../test_utils.dart';

void main() {
  late breizh_blok_api.BoulderFeedbackApi api;
  late breizh_blok_api.BoulderFeedbackJsonldReadBoulderFeedbackRead
  fakeResponse;
  late ApiBoulderFeedbackDataSource dataSource;

  setUp(() {
    api = MockBreizhBlokApiBoulderFeedbackApi();
    fakeResponse = MockBreizhBlokApiBoulderFeedbackJsonldBoulderFeedbackRead();
    dataSource = ApiBoulderFeedbackDataSource(dio: MockDio());
  });

  group('ApiBoulderFeedackDataSource', () {
    group('create', () {
      test('create boulder feedback successfully', () async {
        when(
          () => api.apiBoulderFeedbacksPost(
            boulderFeedbackWriteBoulderFeedbackWrite:
                breizh_blok_api.BoulderFeedbackWriteBoulderFeedbackWrite((
                  builder,
                ) {
                  builder
                    ..message = fakeBoulderFeedback.message
                    ..boulder = fakeBoulderFeedback.boulder.iri;
                }),
          ),
        ).thenAnswer(
          (_) async =>
              Response(data: fakeResponse, requestOptions: RequestOptions()),
        );

        final result = await dataSource.create(fakeBoulderFeedback).run();
        expect(result.isRight(), isTrue);

        verify(
          () => api.apiBoulderFeedbacksPost(
            boulderFeedbackWriteBoulderFeedbackWrite:
                breizh_blok_api.BoulderFeedbackWriteBoulderFeedbackWrite((
                  builder,
                ) {
                  builder
                    ..message = fakeBoulderFeedback.message
                    ..boulder = fakeBoulderFeedback.boulder.iri;
                }),
          ),
        ).called(1);
        verifyNoMoreInteractions(api);
      });

      test('Given the API throws DioException with status code equal to 422 '
          'Then an UnprocessableEntityException is returned', () async {
        when(
          () => api.apiBoulderFeedbacksPost(
            boulderFeedbackWriteBoulderFeedbackWrite:
                breizh_blok_api.BoulderFeedbackWriteBoulderFeedbackWrite((
                  builder,
                ) {
                  builder
                    ..message = fakeBoulderFeedback.message
                    ..boulder = fakeBoulderFeedback.boulder.iri;
                }),
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
          () => api.apiBoulderFeedbacksPost(
            boulderFeedbackWriteBoulderFeedbackWrite:
                breizh_blok_api.BoulderFeedbackWriteBoulderFeedbackWrite((
                  builder,
                ) {
                  builder
                    ..message = fakeBoulderFeedback.message
                    ..boulder = fakeBoulderFeedback.boulder.iri;
                }),
          ),
        ).called(1);
        verifyNoMoreInteractions(api);
      });

      test('Given the API throws an unknown DioException  '
          'Then an UnknownException is returned', () async {
        when(
          () => api.apiBoulderFeedbacksPost(
            boulderFeedbackWriteBoulderFeedbackWrite:
                breizh_blok_api.BoulderFeedbackWriteBoulderFeedbackWrite((
                  builder,
                ) {
                  builder
                    ..message = fakeBoulderFeedback.message
                    ..boulder = fakeBoulderFeedback.boulder.iri;
                }),
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
          () => api.apiBoulderFeedbacksPost(
            boulderFeedbackWriteBoulderFeedbackWrite:
                breizh_blok_api.BoulderFeedbackWriteBoulderFeedbackWrite((
                  builder,
                ) {
                  builder
                    ..message = fakeBoulderFeedback.message
                    ..boulder = fakeBoulderFeedback.boulder.iri;
                }),
          ),
        ).called(1);
        verifyNoMoreInteractions(api);
      });

      test('Given the API throws an unknown Exception  '
          'Then an UnknownException is returned', () async {
        when(
          () => api.apiBoulderFeedbacksPost(
            boulderFeedbackWriteBoulderFeedbackWrite:
                breizh_blok_api.BoulderFeedbackWriteBoulderFeedbackWrite((
                  builder,
                ) {
                  builder
                    ..message = fakeBoulderFeedback.message
                    ..boulder = fakeBoulderFeedback.boulder.iri;
                }),
          ),
        ).thenAnswer((_) async => throw Exception('foo'));

        final result = await dataSource.create(fakeBoulderFeedback).run();
        expect(result.isLeft(), isTrue);
        expect(result.getLeft().toNullable(), isA<UnknownException>());

        verify(
          () => api.apiBoulderFeedbacksPost(
            boulderFeedbackWriteBoulderFeedbackWrite:
                breizh_blok_api.BoulderFeedbackWriteBoulderFeedbackWrite((
                  builder,
                ) {
                  builder
                    ..message = fakeBoulderFeedback.message
                    ..boulder = fakeBoulderFeedback.boulder.iri;
                }),
          ),
        ).called(1);
        verifyNoMoreInteractions(api);
      });
    });
  });
}
