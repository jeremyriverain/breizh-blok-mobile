import 'package:breizh_blok_mobile/domain/entities/boulder_geo_point/boulder_geo_point.dart';
import 'package:breizh_blok_mobile/domain/entities/domain_exception/domain_exception.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class BoulderGeoPointRepository {
  TaskEither<DomainException, void> findAll();

  Stream<List<BoulderGeoPoint>> get watchAll;
}
