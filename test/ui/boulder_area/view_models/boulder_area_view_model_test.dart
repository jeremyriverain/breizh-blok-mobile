import 'package:bloc_test/bloc_test.dart';
import 'package:breizh_blok_mobile/data/repositories/boulder_area/boulder_area_repository.dart';
import 'package:breizh_blok_mobile/ui/boulder_area/view_models/boulder_area_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../test_utils.dart';
@GenerateNiceMocks([MockSpec<BoulderAreaRepository>()])
import 'boulder_area_view_model_test.mocks.dart';

void main() {
  group('BoulderAreaViewModel', () {
    late BoulderAreaRepository repository;

    setUp(() {
      repository = MockBoulderAreaRepository();
    });

    blocTest<BoulderAreaViewModel, BoulderAreaStates>(
      'when it initializes, then it fetches the boulder area',
      setUp: () {
        when(repository.find('foo')).thenAnswer((_) async => fakeBoulderArea);
      },
      build: () => BoulderAreaViewModel(repository: repository, id: 'foo'),
      expect:
          () => [
            const BoulderAreaLoading(),
            const BoulderAreaStates.ok(boulderArea: fakeBoulderArea),
          ],
    );

    blocTest<BoulderAreaViewModel, BoulderAreaStates>(
      'the state is in error when the network call fails',
      setUp: () {
        when(repository.find('foo')).thenThrow(Exception('foo'));
      },
      build: () => BoulderAreaViewModel(repository: repository, id: 'foo'),
      expect:
          () => [
            const BoulderAreaLoading(),
            isA<BoulderAreaError>().having(
              (e) => e.error.toString(),
              'error',
              'Exception: foo',
            ),
          ],
    );

    blocTest<BoulderAreaViewModel, BoulderAreaStates>(
      'when boulder area is requested, then it fetches the boulder area',
      setUp: () {
        when(repository.find('foo')).thenAnswer((_) async => fakeBoulderArea);
      },
      build: () => BoulderAreaViewModel(repository: repository, id: 'foo'),
      act: (bloc) => bloc.add(const BoulderAreaEvents.requested()),
      expect:
          () => [
            const BoulderAreaLoading(),
            const BoulderAreaStates.ok(boulderArea: fakeBoulderArea),
            const BoulderAreaLoading(),
            const BoulderAreaStates.ok(boulderArea: fakeBoulderArea),
          ],
    );
  });
}
