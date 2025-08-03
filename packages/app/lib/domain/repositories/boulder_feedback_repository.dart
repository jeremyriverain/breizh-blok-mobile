import 'package:breizh_blok_mobile/domain/entities/boulder_feedback/boulder_feedback.dart';
import 'package:breizh_blok_mobile/domain/entities/domain_exception/domain_exception.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class BoulderFeedbackRepository {
  TaskEither<DomainException, void> create(BoulderFeedback boulderFeedback);
}
