import 'package:breizh_blok_mobile/data/data_sources/local/local_boulder_geo_point_data_source.dart';
import 'package:breizh_blok_mobile/data/data_sources/remote/remote_boulder_geo_point_data_source.dart';
import 'package:breizh_blok_mobile/domain/entities/boulder_geo_point/boulder_geo_point.dart';
import 'package:breizh_blok_mobile/domain/entities/domain_exception/domain_exception.dart';
import 'package:breizh_blok_mobile/domain/repositories/boulder_geo_point_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:fpdart/fpdart.dart';

class BoulderGeoPointRepositoryImpl implements BoulderGeoPointRepository {
  BoulderGeoPointRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  final RemoteBoulderGeoPointDataSource remoteDataSource;
  final LocalBoulderGeoPointDataSource localDataSource;

  @override
  TaskEither<DomainException, void> findAll() {
    return remoteDataSource.findAll().flatMap((points) {
      return TaskEither.tryCatch(
        () async {
          final localPoints = await watchAll.first;
          if (listEquals(localPoints, points)) {
            return;
          }
          return localDataSource.seed(points);
        },
        (error, _) {
          debugPrint(error.toString());
          return UnknownException(message: error.toString());
        },
      );
    });
  }

  @override
  Stream<List<BoulderGeoPoint>> get watchAll => localDataSource.watchAll();

  @override
  TaskEither<DomainException, void> findByArea(int areaId) {
    return remoteDataSource.findByArea(areaId).flatMap((points) {
      return TaskEither.tryCatch(
        () async {
          final localPoints = await watchByArea(areaId).first;
          if (listEquals(localPoints, points)) {
            return;
          }
          return localDataSource.seedByArea(points);
        },
        (error, _) {
          debugPrint(error.toString());
          return UnknownException(message: error.toString());
        },
      );
    });
  }

  @override
  Stream<List<BoulderGeoPoint>> watchByArea(int areaId) =>
      localDataSource.watchByArea(areaId);
}
