import 'package:breizh_blok_api_generated/breizh_blok_api_generated.dart'
    as api;
import 'package:breizh_blok_mobile/data/mappers/api/api_boulder_feedback_mapper.dart';
import 'package:breizh_blok_mobile/domain/entities/boulder_feedback/boulder_feedback.dart';
import 'package:breizh_blok_mobile/domain/entities/location/location.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../test_utils.dart';

void main() {
  group('ApiBoulderFeedbackMapper', () {
    group('toCreateRequestFromDomain', () {
      test('all fields', () {
        const boulderFeedback = BoulderFeedback(
          newLocation: Location(latitude: 0, longitude: 1),
          boulder: fakeBoulder,
          message: 'foo',
        );
        final request = api.BoulderFeedbackWriteBoulderFeedbackWrite((
          builder,
        ) {
          builder
            ..newLocation.latitude = '${boulderFeedback.newLocation?.latitude}'
            ..newLocation.longitude =
                '${boulderFeedback.newLocation?.longitude}'
            ..message = boulderFeedback.message
            ..boulder = boulderFeedback.boulder.iri;
        });
        expect(
          const ApiBoulderFeedbackMapper().toCreateRequestFromDomain(
            boulderFeedback,
          ),
          equals(request),
        );
      });

      test('only message', () {
        const boulderFeedback = BoulderFeedback(
          message: 'foo',
          boulder: fakeBoulder,
        );
        final request = api.BoulderFeedbackWriteBoulderFeedbackWrite((
          builder,
        ) {
          builder
            ..message = boulderFeedback.message
            ..boulder = boulderFeedback.boulder.iri;
        });
        expect(
          const ApiBoulderFeedbackMapper().toCreateRequestFromDomain(
            boulderFeedback,
          ),
          equals(request),
        );
      });

      test('only location', () {
        const boulderFeedback = BoulderFeedback(
          newLocation: Location(latitude: 0, longitude: 1),
          boulder: fakeBoulder,
        );
        final request = api.BoulderFeedbackWriteBoulderFeedbackWrite((
          builder,
        ) {
          builder
            ..newLocation.latitude = '${boulderFeedback.newLocation?.latitude}'
            ..newLocation.longitude =
                '${boulderFeedback.newLocation?.longitude}'
            ..boulder = boulderFeedback.boulder.iri;
        });
        expect(
          const ApiBoulderFeedbackMapper().toCreateRequestFromDomain(
            boulderFeedback,
          ),
          equals(request),
        );
      });
    });
  });
}
