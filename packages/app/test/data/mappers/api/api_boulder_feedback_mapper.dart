import 'package:breizh_blok_api_generated/breizh_blok_api_generated.dart'
    as api;
import 'package:breizh_blok_mobile/data/mappers/api/api_boulder_feedback_mapper.dart';
import 'package:breizh_blok_mobile/domain/entities/boulder_feedback/boulder_feedback.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../test_utils.dart';

void main() {
  const boulderFeedback = BoulderFeedback(message: 'foo', boulder: fakeBoulder);

  group('ApiBoulderFeedbackMapper', () {
    test('toCreateRequestFromDomain', () {
      final request = api.BoulderFeedbackJsonldBoulderFeedbackWrite((builder) {
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
  });
}
