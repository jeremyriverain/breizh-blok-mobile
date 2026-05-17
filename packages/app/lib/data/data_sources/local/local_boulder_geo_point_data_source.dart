import 'package:breizh_blok_mobile/data/data_sources/local/app_database.dart';
import 'package:breizh_blok_mobile/data/data_sources/local/mappers/local_boulder_geo_point_mapper.dart';
import 'package:breizh_blok_mobile/domain/entities/boulder_geo_point/boulder_geo_point.dart';
import 'package:breizh_blok_mobile/domain/entities/domain_exception/domain_exception.dart';

class LocalBoulderGeoPointDataSource {
  const LocalBoulderGeoPointDataSource({required AppDatabase database})
    : _database = database;

  final AppDatabase _database;
  LocalBoulderGeoPointMapper get _mapper => const LocalBoulderGeoPointMapper();

  Future<void> seed(List<BoulderGeoPoint> boulderGeoPoints) async {
    try {
      // During update, foreign constraints must be disabled.
      // See: https://drift.simonbinder.eu/Migrations/api
      await _database.setForeignKeysMode(isActive: false);
      await _database.transaction(() async {
        await _database.delete(_database.boulderGeoPointTable).go();
        await _database.batch(
          (batch) {
            batch.insertAll(
              _database.boulderGeoPointTable,
              [
                for (final boulderGeoPoint in boulderGeoPoints)
                  _mapper.fromDomain(boulderGeoPoint).toCompanion(true),
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

  Stream<List<BoulderGeoPoint>> watchAll() {
    try {
      return _database
          .select(_database.boulderGeoPointTable)
          .map(_mapper.toDomain)
          .watch();
    } catch (e) {
      throw AppDatabaseException(
        message: e.toString(),
      );
    }
  }
}
