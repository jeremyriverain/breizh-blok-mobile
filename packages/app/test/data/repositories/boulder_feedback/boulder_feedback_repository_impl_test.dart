import 'package:breizh_blok_mobile/data/data_sources/api/api_boulder_feedback_data_source.dart';
import 'package:breizh_blok_mobile/data/repositories/boulder_feedback/boulder_feedback_repository.dart';
import 'package:breizh_blok_mobile/data/repositories/boulder_feedback/boulder_feedback_repository_impl.dart';
import 'package:breizh_blok_mobile/domain/entities/domain_exception/domain_exception.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mocks.dart';
import '../../../test_utils.dart';

void main() {
  late ApiBoulderFeedbackDataSource apiDataSource;
  late BoulderFeedbackRepository repository;

  setUp(() {
    apiDataSource = MockApiBoulderFeedbackDataSource();
    repository = BoulderFeedbackRepositoryImpl(apiDataSource: apiDataSource);
  });
  group('BoulderFeedbackRepositoryImpl', () {
    group('create', () {
      test('Given the api data source process request successfully '
          'Then the repository returns void', () async {
        when(
          () => apiDataSource.create(fakeBoulderFeedback),
        ).thenReturn(TaskEither<DomainException, void>.right(() {}()));

        final result = await repository.create(fakeBoulderFeedback).run();
        expect(result.isRight(), isTrue);

        verify(() => apiDataSource.create(fakeBoulderFeedback)).called(1);
        verifyNoMoreInteractions(apiDataSource);
      });

      test('Given the api data source returns DomainException '
          'Then the DomainException is propagated', () async {
        when(() => apiDataSource.create(fakeBoulderFeedback)).thenReturn(
          TaskEither<DomainException, void>.left(
            const UnprocessableEntityException(),
          ),
        );

        final result = await repository.create(fakeBoulderFeedback).run();
        expect(result.isLeft(), isTrue);
        expect(
          result.getLeft().toNullable(),
          isA<UnprocessableEntityException>(),
        );

        verify(() => apiDataSource.create(fakeBoulderFeedback)).called(1);
        verifyNoMoreInteractions(apiDataSource);
      });
    });
  });
}
