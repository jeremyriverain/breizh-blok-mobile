import 'package:bloc_test/bloc_test.dart';
import 'package:breizh_blok_mobile/data/repositories/boulder_area/boulder_area_repository.dart';
import 'package:breizh_blok_mobile/ui/download/view_models/downloaded_boulder_area_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../test_utils.dart';
@GenerateNiceMocks([MockSpec<BoulderAreaRepository>()])
import 'downloaded_boulder_area_view_model_test.mocks.dart';

void main() {
  group('DownloadedBoulderAreaViewModel', () {
    late BoulderAreaRepository repository;

    setUp(() {
      repository = MockBoulderAreaRepository();
    });

    blocTest<DownloadedBoulderAreaViewModel, DownloadedBoulderAreaStates>(
      'when it initializes, then it fetches the boulder',
      setUp: () {
        when(
          repository.find('foo', offlineFirst: true),
        ).thenAnswer((_) async => fakeBoulderArea);
      },
      build:
          () =>
              DownloadedBoulderAreaViewModel(repository: repository, id: 'foo'),
      expect:
          () => [
            const DownloadedBoulderAreaLoading(),
            const DownloadedBoulderAreaStates.ok(boulderArea: fakeBoulderArea),
          ],
    );

    blocTest<DownloadedBoulderAreaViewModel, DownloadedBoulderAreaStates>(
      'the state is in error when the network call fails',
      setUp: () {
        when(
          repository.find('foo', offlineFirst: true),
        ).thenThrow(Exception('foo'));
      },
      build:
          () =>
              DownloadedBoulderAreaViewModel(repository: repository, id: 'foo'),
      expect:
          () => [
            const DownloadedBoulderAreaLoading(),
            isA<DownloadedBoulderAreaError>().having(
              (e) => e.error.toString(),
              'error',
              'Exception: foo',
            ),
          ],
    );

    blocTest<DownloadedBoulderAreaViewModel, DownloadedBoulderAreaStates>(
      'when boulder is requested, then it fetches the boulder',
      setUp: () {
        when(
          repository.find('foo', offlineFirst: true),
        ).thenAnswer((_) async => fakeBoulderArea);
      },
      build:
          () =>
              DownloadedBoulderAreaViewModel(repository: repository, id: 'foo'),
      act: (bloc) => bloc.add(const DownloadedBoulderAreaEvents.requested()),
      expect:
          () => [
            const DownloadedBoulderAreaLoading(),
            const DownloadedBoulderAreaStates.ok(boulderArea: fakeBoulderArea),
            const DownloadedBoulderAreaLoading(),
            const DownloadedBoulderAreaStates.ok(boulderArea: fakeBoulderArea),
          ],
    );
  });
}
