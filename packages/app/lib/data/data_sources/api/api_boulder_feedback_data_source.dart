import 'package:breizh_blok_mobile/data/data_sources/api/extensions/dio_extension.dart';
import 'package:breizh_blok_mobile/domain/entities/boulder_feedback/boulder_feedback.dart';
import 'package:breizh_blok_mobile/domain/entities/domain_exception/domain_exception.dart';
import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';

class ApiBoulderFeedbackDataSource {
  ApiBoulderFeedbackDataSource({required this.dio});

  final Dio dio;

  TaskEither<DomainException, void> create(BoulderFeedback boulderFeedback) {
    return TaskEither.tryCatch(
      () {
        return dio.post<void>(
          '/boulder_feedbacks',
          data: boulderFeedback.toJson(),
        );
      },
      (e, _) {
        if (e is DioException) {
          return e.convertToDomainException;
        }
        return UnknownException(message: e.toString());
      },
    );
  }
}
