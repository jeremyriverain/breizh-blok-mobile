import 'package:breizh_blok_api_generated/breizh_blok_api_generated.dart' as a;
import 'package:breizh_blok_mobile/data/data_sources/api/extensions/dio_extension.dart';
import 'package:breizh_blok_mobile/data/mappers/api/api_boulder_feedback_mapper.dart';
import 'package:breizh_blok_mobile/domain/entities/boulder_feedback/boulder_feedback.dart';
import 'package:breizh_blok_mobile/domain/entities/domain_exception/domain_exception.dart';
import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';

class ApiBoulderFeedbackDataSource {
  ApiBoulderFeedbackDataSource({required this.api})
    : mapper = const ApiBoulderFeedbackMapper();

  final ApiBoulderFeedbackMapper mapper;
  final a.BoulderFeedbackApi api;

  TaskEither<DomainException, void> create(BoulderFeedback boulderFeedback) {
    return TaskEither.tryCatch(
      () {
        return api.apiBoulderFeedbacksPost(
          boulderFeedbackJsonldBoulderFeedbackWrite: mapper
              .toCreateRequestFromDomain(boulderFeedback),
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
