import 'package:breizh_blok_mobile/data/data_sources/local/local_grade_data_source.dart';
import 'package:breizh_blok_mobile/data/data_sources/remote/remote_grade_data_source.dart';
import 'package:breizh_blok_mobile/data/repositories/grade/grade_repository_impl.dart';
import 'package:breizh_blok_mobile/domain/entities/domain_exception/domain_exception.dart';
import 'package:breizh_blok_mobile/domain/repositories/grade_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mocks.dart';
import '../../../test_utils.dart';

void main() {
  group('GradeRepositoryImpl', () {
    late LocalGradeDataSource localDataSource;
    late RemoteGradeDataSource remoteDataSource;
    late GradeRepository repository;

    setUp(() {
      localDataSource = MockLocalGradeDataSource();
      remoteDataSource = MockRemoteGradeDataSource();
      repository = GradeRepositoryImpl(
        remoteDataSource: remoteDataSource,
        localDataSource: localDataSource,
      );
    });
    group('watchAll', () {
      test('watch from local data source', () async {
        when(
          () => localDataSource.watchAll(),
        ).thenAnswer((_) => Stream.value([fakeGrade6a]));
        await expectLater(
          repository.watchAll,
          emits([fakeGrade6a]),
        );

        verify(
          localDataSource.watchAll,
        ).called(1);
        verifyNoMoreInteractions(localDataSource);
      });
    });

    group('findAll', () {
      test(
        'Given findAll throw Exception '
        'Then the stream of grades does not change',
        () async {
          when(
            () => remoteDataSource.findAll(),
          ).thenReturn(TaskEither.left(const UnknownException(message: 'bar')));

          final result = await repository.findAll().run();

          expect(result.isLeft(), isTrue);

          verify(
            () => remoteDataSource.findAll(),
          ).called(1);

          verifyNoMoreInteractions(remoteDataSource);

          verifyZeroInteractions(localDataSource);
        },
      );

      test(
        'when seed method of local data source throws an error',

        () async {
          when(
            () => remoteDataSource.findAll(),
          ).thenReturn(
            TaskEither.right([fakeGrade6a, fakeGrade6b]),
          );

          when(
            () => localDataSource.seed([
              fakeGrade6a,
              fakeGrade6b,
            ]),
          ).thenThrow(Exception('foo'));

          when(
            () => localDataSource.watchAll(),
          ).thenAnswer((_) => Stream.value([]));

          final result = await repository.findAll().run();

          expect(result.isLeft(), isTrue);

          verify(
            () => remoteDataSource.findAll(),
          ).called(1);

          verifyNoMoreInteractions(remoteDataSource);

          verify(
            () => localDataSource.seed([
              fakeGrade6a,
              fakeGrade6b,
            ]),
          ).called(1);

          verify(
            () => localDataSource.watchAll(),
          ).called(1);

          verifyNoMoreInteractions(localDataSource);

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
        'Given findAll returns grades '
        'Then the seed method of local data source is called',
        () async {
          when(
            () => remoteDataSource.findAll(),
          ).thenReturn(
            TaskEither.right([fakeGrade6a, fakeGrade6b]),
          );

          when(
            () => localDataSource.seed([
              fakeGrade6a,
              fakeGrade6b,
            ]),
          ).thenAnswer((_) => Future.value());

          when(
            () => localDataSource.watchAll(),
          ).thenAnswer((_) => Stream.value([]));

          final result = await repository.findAll().run();

          expect(result.isRight(), isTrue);

          verify(
            () => remoteDataSource.findAll(),
          ).called(1);

          verifyNoMoreInteractions(remoteDataSource);

          verify(
            () => localDataSource.seed([
              fakeGrade6a,
              fakeGrade6b,
            ]),
          ).called(1);

          verify(
            () => localDataSource.watchAll(),
          ).called(1);

          verifyNoMoreInteractions(localDataSource);
        },
      );

      test(
        'Given findAll returns grades '
        'And the local data are identical to the retrieved grades '
        'Then the seed method is not called',
        () async {
          when(
            () => remoteDataSource.findAll(),
          ).thenReturn(
            TaskEither.right([fakeGrade6a, fakeGrade6b]),
          );

          when(
            () => localDataSource.watchAll(),
          ).thenAnswer(
            (_) => Stream.fromIterable([
              [fakeGrade6a, fakeGrade6b],
            ]),
          );

          final result = await repository.findAll().run();

          expect(result.isRight(), isTrue);

          verify(
            () => remoteDataSource.findAll(),
          ).called(1);

          verifyNoMoreInteractions(remoteDataSource);

          verify(
            () => localDataSource.watchAll(),
          ).called(1);

          verifyNoMoreInteractions(localDataSource);
        },
      );
    });
  });
}
