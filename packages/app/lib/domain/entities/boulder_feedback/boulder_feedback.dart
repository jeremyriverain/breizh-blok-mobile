import 'package:breizh_blok_mobile/domain/entities/boulder/boulder.dart';
import 'package:breizh_blok_mobile/domain/entities/location/location.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'boulder_feedback.freezed.dart';

part 'boulder_feedback.g.dart';

@freezed
abstract class BoulderFeedback with _$BoulderFeedback {
  factory BoulderFeedback({
    @JsonKey(toJson: _boulderToJson) required Boulder boulder,
    String? message,
    Location? newLocation,
  }) = _BoulderFeedack;

  const BoulderFeedback._();

  factory BoulderFeedback.fromJson(Map<String, Object?> json) =>
      _$BoulderFeedbackFromJson(json);
}

String _boulderToJson(Boulder value) => value.iri;
