import 'package:breizh_blok_mobile/data/data_sources/remote/remote_boulder_geo_point_data_source.dart';
import 'package:breizh_blok_mobile/domain/entities/boulder_geo_point/boulder_geo_point.dart';
import 'package:breizh_blok_mobile/domain/entities/domain_exception/domain_exception.dart';
import 'package:breizh_blok_mobile/domain/repositories/boulder_geo_point_repository.dart';
import 'package:fpdart/fpdart.dart';

class BoulderGeoPointRepositoryImpl implements BoulderGeoPointRepository {
  BoulderGeoPointRepositoryImpl({required this.remoteDataSource});

  final RemoteBoulderGeoPointDataSource remoteDataSource;

  @override
  TaskEither<DomainException, void> findAll() {
    throw UnimplementedError();
  }

  @override
  Stream<List<BoulderGeoPoint>> get watchAll => throw UnimplementedError();
}
