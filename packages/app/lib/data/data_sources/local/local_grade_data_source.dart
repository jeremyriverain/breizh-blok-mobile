import 'package:breizh_blok_mobile/data/data_sources/local/app_database.dart';
import 'package:breizh_blok_mobile/data/data_sources/local/mappers/local_grade_mapper.dart';
import 'package:breizh_blok_mobile/domain/entities/domain_exception/domain_exception.dart';
import 'package:breizh_blok_mobile/domain/entities/grade/grade.dart';

class LocalGradeDataSource {
  const LocalGradeDataSource({required this._database});

  final AppDatabase _database;
  LocalGradeMapper get _mapper => const LocalGradeMapper();

  Future<void> seed(List<Grade> grades) async {
    try {
      // During update, foreign constraints must be disabled.
      // See: https://drift.simonbinder.eu/Migrations/api
      await _database.setForeignKeysMode(isActive: false);
      await _database.transaction(() async {
        await _database.delete(_database.gradeTable).go();
        await _database.batch(
          (batch) {
            batch.insertAll(
              _database.gradeTable,
              <GradeTableCompanion>[
                for (final grade in grades)
                  _mapper.fromDomain(grade).toCompanion(true),
              ],
            );
          },
        );
      });
    } catch (e) {
      throw AppDatabaseException(
        message: e.toString(),
      );
    } finally {
      await _database.setForeignKeysMode(isActive: true);
    }
  }

  Stream<List<Grade>> watchAll() {
    try {
      return _database
          .select(_database.gradeTable)
          .map(_mapper.toDomain)
          .watch();
    } catch (e) {
      throw AppDatabaseException(
        message: e.toString(),
      );
    }
  }
}
