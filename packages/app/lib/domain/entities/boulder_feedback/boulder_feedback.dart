import 'package:breizh_blok_mobile/domain/entities/boulder/boulder.dart';
import 'package:breizh_blok_mobile/domain/entities/location/location.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'boulder_feedback.freezed.dart';

@freezed
abstract class BoulderFeedback with _$BoulderFeedback {
  const factory BoulderFeedback({
    required Boulder boulder,
    String? message,
    Location? newLocation,
  }) = _BoulderFeedack;

  const BoulderFeedback._();
}
