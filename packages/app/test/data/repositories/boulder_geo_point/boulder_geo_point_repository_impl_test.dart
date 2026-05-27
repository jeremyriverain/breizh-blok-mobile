import 'package:breizh_blok_mobile/data/data_sources/local/local_boulder_geo_point_data_source.dart';
import 'package:breizh_blok_mobile/data/data_sources/remote/remote_boulder_geo_point_data_source.dart';
import 'package:breizh_blok_mobile/data/repositories/boulder_geo_point/boulder_geo_point_repository_impl.dart';
import 'package:breizh_blok_mobile/domain/entities/domain_exception/domain_exception.dart';
import 'package:breizh_blok_mobile/domain/repositories/boulder_geo_point_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mocks.dart';
import '../../../test_utils.dart';

void main() {
  group('BoulderGeoPointRepositoryImpl', () {
    late LocalBoulderGeoPointDataSource localDataSource;
    late RemoteBoulderGeoPointDataSource remoteDataSource;
    late BoulderGeoPointRepository repository;

    setUp(() {
      localDataSource = MockLocalBoulderGeroPointDataSource();
      remoteDataSource = MockRemoteBoulderGeoPointDataSource();
      repository = BoulderGeoPointRepositoryImpl(
        remoteDataSource: remoteDataSource,
        localDataSource: localDataSource,
      );
    });
    group('watchAll', () {
      test('watch from local data source', () async {
        when(
          () => localDataSource.watchAll(),
        ).thenAnswer((_) => Stream.value([fakeBoulderGeoPoint]));
        await expectLater(
          repository.watchAll,
          emits([fakeBoulderGeoPoint]),
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
        'Then the stream of boulder geo points does not change',
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
            TaskEither.right([fakeBoulderGeoPoint, fakeBoulderGeoPoint2]),
          );

          when(
            () => localDataSource.seed([
              fakeBoulderGeoPoint,
              fakeBoulderGeoPoint2,
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
              fakeBoulderGeoPoint,
              fakeBoulderGeoPoint2,
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
        'Given findAll returns geo points '
        'Then the seed method of local data source is called',
        () async {
          when(
            () => remoteDataSource.findAll(),
          ).thenReturn(
            TaskEither.right([fakeBoulderGeoPoint, fakeBoulderGeoPoint2]),
          );

          when(
            () => localDataSource.seed([
              fakeBoulderGeoPoint,
              fakeBoulderGeoPoint2,
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
              fakeBoulderGeoPoint,
              fakeBoulderGeoPoint2,
            ]),
          ).called(1);

          verify(
            () => localDataSource.watchAll(),
          ).called(1);

          verifyNoMoreInteractions(localDataSource);
        },
      );

      test(
        'Given findAll returns geo points '
        'And the local data are identical to the retrieved geo points '
        'Then the seed method is not called',
        () async {
          when(
            () => remoteDataSource.findAll(),
          ).thenReturn(
            TaskEither.right([fakeBoulderGeoPoint, fakeBoulderGeoPoint2]),
          );

          when(
            () => localDataSource.watchAll(),
          ).thenAnswer(
            (_) => Stream.fromIterable([
              [fakeBoulderGeoPoint, fakeBoulderGeoPoint2],
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
