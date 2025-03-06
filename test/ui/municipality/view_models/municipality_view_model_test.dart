import 'package:bloc_test/bloc_test.dart';
import 'package:breizh_blok_mobile/data/repositories/municipality/municipality_repository.dart';
import 'package:breizh_blok_mobile/ui/municipality/view_models/municipality_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../test_utils.dart';
@GenerateNiceMocks([MockSpec<MunicipalityRepository>()])
import 'municipality_view_model_test.mocks.dart';

void main() {
  group('MunicipalityViewModel', () {
    late MunicipalityRepository repository;

    setUp(() {
      repository = MockMunicipalityRepository();
    });

    blocTest<MunicipalityViewModel, MunicipalityStates>(
      'when it initializes, then it fetches the municipality',
      setUp: () {
        when(repository.find('foo')).thenAnswer((_) async => fakeMunicipality);
      },
      build: () => MunicipalityViewModel(repository: repository, id: 'foo'),
      expect:
          () => [
            const MunicipalityLoading(),
            const MunicipalityStates.ok(municipality: fakeMunicipality),
          ],
    );

    blocTest<MunicipalityViewModel, MunicipalityStates>(
      'the state is in error when the network call fails',
      setUp: () {
        when(repository.find('foo')).thenThrow(Exception('foo'));
      },
      build: () => MunicipalityViewModel(repository: repository, id: 'foo'),
      expect:
          () => [
            const MunicipalityLoading(),
            isA<MunicipalityError>().having(
              (e) => e.error.toString(),
              'error',
              'Exception: foo',
            ),
          ],
    );

    blocTest<MunicipalityViewModel, MunicipalityStates>(
      'when municipality is requested, then it fetches the municipality',
      setUp: () {
        when(repository.find('foo')).thenAnswer((_) async => fakeMunicipality);
      },
      build: () => MunicipalityViewModel(repository: repository, id: 'foo'),
      act: (bloc) => bloc.add(const MunicipalityEvents.requested()),
      expect:
          () => [
            const MunicipalityLoading(),
            const MunicipalityStates.ok(municipality: fakeMunicipality),
            const MunicipalityLoading(),
            const MunicipalityStates.ok(municipality: fakeMunicipality),
          ],
    );
  });
}
