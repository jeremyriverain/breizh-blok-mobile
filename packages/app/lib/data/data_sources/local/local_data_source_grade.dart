import 'package:breizh_blok_mobile/data/data_sources/local/app_database.dart';
import 'package:breizh_blok_mobile/data/data_sources/local/mappers/local_grade_mapper.dart';
import 'package:breizh_blok_mobile/domain/entities/domain_exception/domain_exception.dart';
import 'package:breizh_blok_mobile/domain/entities/grade/grade.dart';

class LocalDataSourceGrade {
  const LocalDataSourceGrade({required AppDatabase database})
    : _database = database;

  final AppDatabase _database;
  LocalGradeMapper get _mapper => const LocalGradeMapper();

  Stream<List<Grade>> watchAll() {
    try {
      return _database
          .select(_database.gradeTable)
          .map(_mapper.toDomain)
          .watch();
    } catch (e) {
      throw UnknownException(
        message: e.toString(),
      );
    }
  }
}
