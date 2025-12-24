import 'package:breizh_blok_mobile/data/data_sources/api/api_user_profile_data_source.dart';
import 'package:breizh_blok_mobile/data/repositories/user_profile/user_profile_repository_impl.dart';
import 'package:breizh_blok_mobile/domain/entities/domain_exception/domain_exception.dart';
import 'package:breizh_blok_mobile/domain/entities/user/user.dart';
import 'package:breizh_blok_mobile/domain/repositories/user_profile_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mocks.dart';

void main() {
  late ApiUserProfileDataSource apiDataSource;
  late UserProfileRepository repository;

  setUp(() {
    apiDataSource = MockApiUserProfileDataSource();
    repository = UserProfileRepositoryImpl(apiDataSource: apiDataSource);
  });
  group('UserProfileRepositoryImpl', () {
    group('get', () {
      test('Given the api data source process request successfully '
          'Then the repository returns a User', () async {
        when(
          () => apiDataSource.get('foo'),
        ).thenReturn(TaskEither<DomainException, User?>.right(const User()));

        final result = await repository.get('foo').run();
        expect(result.isRight(), isTrue);

        verify(() => apiDataSource.get('foo')).called(1);
        verifyNoMoreInteractions(apiDataSource);
      });

      test('Given the api data source returns DomainException '
          'Then the DomainException is propagated', () async {
        when(() => apiDataSource.get('foo')).thenReturn(
          TaskEither<DomainException, User?>.left(
            const UnprocessableEntityException(),
          ),
        );

        final result = await repository.get('foo').run();
        expect(result.isLeft(), isTrue);
        expect(
          result.getLeft().toNullable(),
          isA<UnprocessableEntityException>(),
        );

        verify(() => apiDataSource.get('foo')).called(1);
        verifyNoMoreInteractions(apiDataSource);
      });
    });
  });
}
