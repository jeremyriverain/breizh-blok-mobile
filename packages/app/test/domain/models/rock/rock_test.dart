import 'package:breizh_blok_mobile/domain/models/boulder_area/boulder_area.dart';
import 'package:breizh_blok_mobile/domain/models/location/location.dart';
import 'package:breizh_blok_mobile/domain/models/rock/rock.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Rock', () {
    test('fromJson', () {
      final rock = Rock.fromJson(
        const {
          '@id': '/rocks/rockId',
          'location': {'latitude': '4', 'longitude': '2'},
          'boulderArea': {
            '@id': '/boulder_areas/boulderAreaId',
            'name': 'foo',
          },
        },
      );
      expect(rock.iri, '/rocks/rockId');
      expect(rock.location, const Location(latitude: 4, longitude: 2));
      expect(
        rock.boulderArea,
        const BoulderArea(iri: '/boulder_areas/boulderAreaId', name: 'foo'),
      );
    });
  });
}
