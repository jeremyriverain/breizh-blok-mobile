import 'package:breizh_blok_api_generated/breizh_blok_api_generated.dart';
import 'package:breizh_blok_mobile/data/data_sources/api/api_user_profile_data_source.dart';
import 'package:breizh_blok_mobile/domain/entities/domain_exception/domain_exception.dart';
import 'package:breizh_blok_mobile/domain/entities/user/user.dart';
import 'package:built_collection/built_collection.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mocks.dart';

void main() {
  group('ApiUserProfileDataSource', () {
    late AuthZeroUserApi api;
    late ApiUserProfileDataSource dataSource;

    setUp(() {
      api = MockBreizhBlokApiAuthZeroUserApi();
      dataSource = ApiUserProfileDataSource(api: api);
    });
    group('get', () {
      test(
        '''
Given the API responds successfully
Then a User is returned''',
        () async {
          when(() => api.apiUsersIdGet(id: 'foo')).thenAnswer(
            (_) async => Response(
              data: AuthZeroUserJsonldAuthZeroUserRead((builder) {
                builder.user.roles = ListBuilder<String>(['ROLE_FOO']);
              }),
              requestOptions: RequestOptions(),
            ),
          );

          final response = await dataSource.get('foo').run();

          expect(response.isRight(), isTrue);
          expect(
            response.getOrElse((_) => null),
            equals(const User(roles: ['ROLE_FOO'])),
          );

          verify(() => api.apiUsersIdGet(id: 'foo')).called(1);
          verifyNoMoreInteractions(api);
        },
      );

      test(
        '''
Given the API throws an error
Then the exception is properly handled''',
        () async {
          when(() => api.apiUsersIdGet(id: 'foo')).thenThrow(Exception('foo'));

          final response = await dataSource.get('foo').run();

          expect(response.isRight(), isFalse);
          expect(
            response.getLeft(),
            isA<Option<DomainException>>().having(
              (e) => e.toNullable(),
              'error',
              isA<UnknownException>().having(
                (e) => e.message,
                'message',
                'Exception: foo',
              ),
            ),
          );

          verify(() => api.apiUsersIdGet(id: 'foo')).called(1);
          verifyNoMoreInteractions(api);
        },
      );

      test(
        '''
Given the API throws a DioException
Then the exception is properly handled''',
        () async {
          when(() => api.apiUsersIdGet(id: 'foo')).thenThrow(
            DioException(
              requestOptions: RequestOptions(),
              response: Response(
                requestOptions: RequestOptions(),
                statusCode: 422,
              ),
            ),
          );

          final result = await dataSource.get('foo').run();

          expect(result.isLeft(), isTrue);
          expect(
            result.getLeft().toNullable(),
            isA<UnprocessableEntityException>(),
          );

          verify(() => api.apiUsersIdGet(id: 'foo')).called(1);
          verifyNoMoreInteractions(api);
        },
      );
    });
  });
}
