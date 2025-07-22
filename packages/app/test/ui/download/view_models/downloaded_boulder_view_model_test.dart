import 'package:bloc_test/bloc_test.dart';
import 'package:breizh_blok_mobile/data/repositories/downloaded_boulder_repository/downloaded_boulder_repository.dart';
import 'package:breizh_blok_mobile/ui/download/view_models/downloaded_boulder_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mocks.dart';
import '../../../test_utils.dart';

void main() {
  group('DownloadedBoulderViewModel', () {
    late DownloadedBoulderRepository repository;

    setUp(() {
      repository = MockDownloadedBoulderRepository();
    });

    blocTest<DownloadedBoulderViewModel, DownloadedBoulderStates>(
      'when it initializes, then it fetches the boulder',
      setUp: () {
        when(
          () => repository.find(
            boulderAreaIri: '/boulder_areas/foo',
            boulderId: 'foo',
          ),
        ).thenAnswer((_) async => fakeBoulder);
      },
      build:
          () => DownloadedBoulderViewModel(
            repository: repository,
            boulderAreaIri: '/boulder_areas/foo',
            boulderId: 'foo',
          ),
      expect:
          () => [
            const DownloadedBoulderLoading(),
            const DownloadedBoulderStates.ok(boulder: fakeBoulder),
          ],
    );

    blocTest<DownloadedBoulderViewModel, DownloadedBoulderStates>(
      'the state is in error when the network call fails',
      setUp: () {
        when(
          () => repository.find(
            boulderAreaIri: '/boulder_areas/foo',
            boulderId: 'foo',
          ),
        ).thenThrow(Exception('foo'));
      },
      build:
          () => DownloadedBoulderViewModel(
            repository: repository,
            boulderAreaIri: '/boulder_areas/foo',
            boulderId: 'foo',
          ),
      expect:
          () => [
            const DownloadedBoulderLoading(),
            isA<DownloadedBoulderError>().having(
              (e) => e.error.toString(),
              'error',
              'Exception: foo',
            ),
          ],
    );

    blocTest<DownloadedBoulderViewModel, DownloadedBoulderStates>(
      'when boulder is requested, then it fetches the boulder',
      setUp: () {
        when(
          () => repository.find(
            boulderAreaIri: '/boulder_areas/foo',
            boulderId: 'foo',
          ),
        ).thenAnswer((_) async => fakeBoulder);
      },
      build:
          () => DownloadedBoulderViewModel(
            repository: repository,
            boulderAreaIri: '/boulder_areas/foo',
            boulderId: 'foo',
          ),
      act: (bloc) => bloc.add(const DownloadedBoulderEvents.requested()),
      expect:
          () => [
            const DownloadedBoulderLoading(),
            const DownloadedBoulderStates.ok(boulder: fakeBoulder),
            const DownloadedBoulderLoading(),
            const DownloadedBoulderStates.ok(boulder: fakeBoulder),
          ],
    );
  });
}
