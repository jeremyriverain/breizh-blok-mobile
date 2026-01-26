import 'package:breizh_blok_api_generated/breizh_blok_api_generated.dart'
    as api;
import 'package:breizh_blok_mobile/domain/entities/boulder_feedback/boulder_feedback.dart';

class ApiBoulderFeedbackMapper {
  const ApiBoulderFeedbackMapper();

  api.BoulderFeedbackWriteBoulderFeedbackWrite toCreateRequestFromDomain(
    BoulderFeedback entity,
  ) {
    return api.BoulderFeedbackWriteBoulderFeedbackWrite((builder) {
      builder
        ..message = entity.message
        ..boulder = entity.boulder.iri;

      final latitude = entity.newLocation?.latitude;
      final longitude = entity.newLocation?.longitude;

      if (latitude != null && longitude != null) {
        builder
          ..newLocation.latitude = '$latitude'
          ..newLocation.longitude = '$longitude';
      }
    });
  }
}
