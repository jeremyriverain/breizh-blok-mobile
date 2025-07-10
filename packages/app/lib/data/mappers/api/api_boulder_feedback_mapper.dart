import 'package:breizh_blok_api_generated/breizh_blok_api_generated.dart'
    as api;
import 'package:breizh_blok_mobile/domain/entities/boulder_feedback/boulder_feedback.dart';

class ApiBoulderFeedbackMapper {
  const ApiBoulderFeedbackMapper();

  api.BoulderFeedbackJsonldBoulderFeedbackWrite toCreateRequestFromDomain(
    BoulderFeedback entity,
  ) {
    return api.BoulderFeedbackJsonldBoulderFeedbackWrite((builder) {
      builder
        ..message = entity.message
        ..boulder = entity.boulder.iri;
    });
  }
}
