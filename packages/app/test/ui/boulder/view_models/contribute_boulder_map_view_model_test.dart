import 'package:bloc_test/bloc_test.dart';
import 'package:breizh_blok_mobile/domain/entities/boulder_feedback/boulder_feedback.dart';
import 'package:breizh_blok_mobile/domain/entities/domain_exception/domain_exception.dart';
import 'package:breizh_blok_mobile/domain/entities/location/location.dart';
import 'package:breizh_blok_mobile/domain/repositories/boulder_feedback_repository.dart';
import 'package:breizh_blok_mobile/ui/boulder/forms/contribute_boulder_location_form.dart';
import 'package:breizh_blok_mobile/ui/boulder/view_models/contribute_boulder_map_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mocks.dart';
import '../../../test_utils.dart';

void main() {
  group('ContributeBoulderMapViewModel', () {
    late BoulderFeedbackRepository repository;

    setUp(() {
      repository = MockBoulderFeedbackRepository();
    });

    blocTest<ContributeBoulderMapViewModel, ContributeBoulderMapState>(
      '''
Given form has not been touched,
When I submit,
Nothing happens
''',

      build:
          () => ContributeBoulderMapViewModel(
            boulderFeedbackRepository: MockBoulderFeedbackRepository(),
            boulder: fakeBoulder,
            form: ContributeBoulderLocationForm(latitude: 0, longitude: 1),
          ),
      act: (bloc) => bloc.add(SubmitLocationEvent()),
      expect: () => <ContributeBoulderMapState>[],
    );

    blocTest<ContributeBoulderMapViewModel, ContributeBoulderMapState>(
      '''
Given coordinates has been updated,
When I submit,
Then the repository is called
''',

      setUp: () {
        when(
          () => repository.create(
            const BoulderFeedback(
              boulder: fakeBoulder,
              newLocation: Location(latitude: 9, longitude: 23),
            ),
          ),
        ).thenAnswer(
          (_) => TaskEither.tryCatch(
            () async {},
            (_, __) => const UnknownException(message: 'foo'),
          ),
        );
      },
      build:
          () => ContributeBoulderMapViewModel(
            boulderFeedbackRepository: repository,
            boulder: fakeBoulder,
            form: ContributeBoulderLocationForm(latitude: 0, longitude: 1),
          ),
      act:
          (bloc) =>
              bloc
                ..add(UpdateLatitudeEvent(latitude: 9))
                ..add(UpdateLongitudeEvent(longitude: 23))
                ..add(SubmitLocationEvent()),
      expect:
          () => [
            isA<ContributeBoulderMapState>()
                .having((c) => c.form.latitude, 'latitude', equals(9))
                .having((c) => c.form.longitude, 'lnogitude', equals(23))
                .having((c) => c.pending, 'pending', isTrue)
                .having((c) => c.error, 'error', isFalse)
                .having((c) => c.done, 'done', isFalse),
            isA<ContributeBoulderMapState>()
                .having((c) => c.pending, 'pending', isFalse)
                .having((c) => c.error, 'error', isFalse)
                .having((c) => c.done, 'done', isTrue),
          ],
      verify: (bloc) {
        verify(
          () => repository.create(
            const BoulderFeedback(
              boulder: fakeBoulder,
              newLocation: Location(latitude: 9, longitude: 23),
            ),
          ),
        ).called(1);
      },
    );

    blocTest<ContributeBoulderMapViewModel, ContributeBoulderMapState>(
      '''
Given I submit
And the network call fails,
Then the exception is properly handled
''',

      setUp: () {
        when(
          () => repository.create(
            const BoulderFeedback(
              boulder: fakeBoulder,
              newLocation: Location(latitude: 9, longitude: 23),
            ),
          ),
        ).thenAnswer(
          (_) => TaskEither.left(const UnknownException(message: 'foo')),
        );
      },
      build:
          () => ContributeBoulderMapViewModel(
            boulderFeedbackRepository: repository,
            boulder: fakeBoulder,
            form: ContributeBoulderLocationForm(latitude: 0, longitude: 1),
          ),
      act:
          (bloc) =>
              bloc
                ..add(UpdateLatitudeEvent(latitude: 9))
                ..add(UpdateLongitudeEvent(longitude: 23))
                ..add(SubmitLocationEvent()),
      expect:
          () => [
            isA<ContributeBoulderMapState>()
                .having((c) => c.form.latitude, 'latitude', equals(9))
                .having((c) => c.form.longitude, 'lnogitude', equals(23))
                .having((c) => c.pending, 'pending', isTrue)
                .having((c) => c.error, 'error', isFalse)
                .having((c) => c.done, 'done', isFalse),
            isA<ContributeBoulderMapState>()
                .having((c) => c.pending, 'pending', isFalse)
                .having((c) => c.error, 'error', isTrue)
                .having((c) => c.done, 'done', isFalse),
          ],
      verify: (bloc) {
        verify(
          () => repository.create(
            const BoulderFeedback(
              boulder: fakeBoulder,
              newLocation: Location(latitude: 9, longitude: 23),
            ),
          ),
        ).called(1);
      },
    );
  });
}
