import 'package:breizh_blok_mobile/domain/entities/domain_exception/domain_exception.dart';
import 'package:breizh_blok_mobile/domain/entities/grade/grade.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class GradeRepository {
  TaskEither<DomainException, void> findAll();

  Stream<List<Grade>> get watchAll;
}
