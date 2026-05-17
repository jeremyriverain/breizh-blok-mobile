import 'package:breizh_blok_mobile/data/data_sources/local/app_database.dart';
import 'package:breizh_blok_mobile/data/data_sources/local/mappers/local_boulder_geo_point_mapper.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../test_utils.dart';

void main() {
  group('BoulderGeoPoint', () {
    test('fromDomain', () {
      expect(
        const LocalBoulderGeoPointMapper().fromDomain(fakeBoulderGeoPoint),
        equals(
          BoulderGeoPointTableData(
            id: fakeBoulderGeoPoint.id,
            lat: fakeBoulderGeoPoint.lat,
            lng: fakeBoulderGeoPoint.lng,
            areaId: fakeBoulderGeoPoint.areaId,
          ),
        ),
      );
    });

    test('toDomain', () {
      expect(
        const LocalBoulderGeoPointMapper().toDomain(
          BoulderGeoPointTableData(
            id: fakeBoulderGeoPoint.id,
            lat: fakeBoulderGeoPoint.lat,
            lng: fakeBoulderGeoPoint.lng,
            areaId: fakeBoulderGeoPoint.areaId,
          ),
        ),
        equals(fakeBoulderGeoPoint),
      );
    });
  });
}
