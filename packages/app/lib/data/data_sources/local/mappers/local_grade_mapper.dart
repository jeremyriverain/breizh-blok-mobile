import 'package:breizh_blok_mobile/data/data_sources/local/app_database.dart';
import 'package:breizh_blok_mobile/domain/entities/grade/grade.dart';

class LocalGradeMapper {
  const LocalGradeMapper();
  Grade toDomain(GradeTableData gradeTableData) {
    return Grade(iri: gradeTableData.iri, name: gradeTableData.name);
  }

  GradeTableData fromDomain(Grade grade) {
    return GradeTableData(iri: grade.iri, name: grade.name);
  }
}
