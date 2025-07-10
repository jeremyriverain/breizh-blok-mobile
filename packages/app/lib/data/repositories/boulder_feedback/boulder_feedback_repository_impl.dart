import 'package:breizh_blok_mobile/data/data_sources/api/api_boulder_feedback_data_source.dart';
import 'package:breizh_blok_mobile/data/repositories/boulder_feedback/boulder_feedback_repository.dart';
import 'package:breizh_blok_mobile/domain/entities/boulder_feedback/boulder_feedback.dart';
import 'package:breizh_blok_mobile/domain/entities/domain_exception/domain_exception.dart';
import 'package:fpdart/fpdart.dart';

class BoulderFeedbackRepositoryImpl implements BoulderFeedbackRepository {
  BoulderFeedbackRepositoryImpl({required this.apiDataSource});

  final ApiBoulderFeedbackDataSource apiDataSource;

  @override
  TaskEither<DomainException, void> create(BoulderFeedback boulderFeedback) {
    return apiDataSource.create(boulderFeedback);
  }
}
