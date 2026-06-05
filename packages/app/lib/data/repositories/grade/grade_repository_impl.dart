import 'package:breizh_blok_mobile/data/data_sources/local/local_grade_data_source.dart';
import 'package:breizh_blok_mobile/data/data_sources/remote/remote_grade_data_source.dart';
import 'package:breizh_blok_mobile/domain/entities/domain_exception/domain_exception.dart';
import 'package:breizh_blok_mobile/domain/entities/grade/grade.dart';
import 'package:breizh_blok_mobile/domain/repositories/grade_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:fpdart/fpdart.dart';

class GradeRepositoryImpl implements GradeRepository {
  GradeRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  final RemoteGradeDataSource remoteDataSource;
  final LocalGradeDataSource localDataSource;

  @override
  TaskEither<DomainException, void> findAll() {
    return remoteDataSource.findAll().flatMap((grades) {
      return TaskEither.tryCatch(
        () async {
          final localGrades = await watchAll.first;
          if (listEquals(localGrades, grades)) {
            return;
          }
          return localDataSource.seed(grades);
        },
        (error, _) {
          debugPrint(error.toString());
          return UnknownException(message: error.toString());
        },
      );
    });
  }

  @override
  Stream<List<Grade>> get watchAll => localDataSource.watchAll();
}
