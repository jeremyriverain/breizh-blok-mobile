import 'package:breizh_blok_mobile/data/data_sources/local/app_database.dart';
import 'package:breizh_blok_mobile/domain/entities/boulder_geo_point/boulder_geo_point.dart';

class LocalBoulderGeoPointMapper {
  const LocalBoulderGeoPointMapper();
  BoulderGeoPoint toDomain(BoulderGeoPointTableData boulderGeoPointTableData) {
    return BoulderGeoPoint(
      id: boulderGeoPointTableData.id,
      lat: boulderGeoPointTableData.lat,
      lng: boulderGeoPointTableData.lng,
      areaId: boulderGeoPointTableData.areaId,
    );
  }

  BoulderGeoPointTableData fromDomain(BoulderGeoPoint boulderGeoPoint) {
    return BoulderGeoPointTableData(
      id: boulderGeoPoint.id,
      lat: boulderGeoPoint.lat,
      lng: boulderGeoPoint.lng,
      areaId: boulderGeoPoint.areaId,
    );
  }
}
