import 'package:bloc_test/bloc_test.dart';
import 'package:breizh_blok_mobile/data/repositories/boulder/boulder_repository.dart';
import 'package:breizh_blok_mobile/ui/boulder/view_models/boulder_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mocks.dart';
import '../../../test_utils.dart';

void main() {
  group('BoulderViewModel', () {
    late BoulderRepository repository;

    setUp(() {
      repository = MockBoulderRepository();
    });

    blocTest<BoulderViewModel, BoulderStates>(
      'when it initializes, then it fetches the boulder',
      setUp: () {
        when(() => repository.find('foo')).thenAnswer((_) async => fakeBoulder);
      },
      build: () => BoulderViewModel(repository: repository, id: 'foo'),
      expect: () => [
        const BoulderLoading(),
        const BoulderStates.ok(boulder: fakeBoulder),
      ],
    );

    blocTest<BoulderViewModel, BoulderStates>(
      'the state is in error when the network call fails',
      setUp: () {
        when(() => repository.find('foo')).thenThrow(Exception('foo'));
      },
      build: () => BoulderViewModel(repository: repository, id: 'foo'),
      expect: () => [
        const BoulderLoading(),
        isA<BoulderError>().having(
          (e) => e.error.toString(),
          'error',
          'Exception: foo',
        ),
      ],
    );

    blocTest<BoulderViewModel, BoulderStates>(
      'when boulder is requested, then it fetches the boulder',
      setUp: () {
        when(() => repository.find('foo')).thenAnswer((_) async => fakeBoulder);
      },
      build: () => BoulderViewModel(repository: repository, id: 'foo'),
      act: (bloc) => bloc.add(const BoulderEvents.requested()),
      expect: () => [
        const BoulderLoading(),
        const BoulderStates.ok(boulder: fakeBoulder),
        const BoulderLoading(),
        const BoulderStates.ok(boulder: fakeBoulder),
      ],
    );
  });
}
