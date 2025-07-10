import 'package:breizh_blok_mobile/domain/entities/boulder/boulder.dart';
import 'package:breizh_blok_mobile/domain/entities/boulder_area/boulder_area.dart';
import 'package:breizh_blok_mobile/domain/entities/grade/grade.dart';
import 'package:breizh_blok_mobile/domain/entities/image/image.dart';
import 'package:breizh_blok_mobile/domain/entities/line_boulder/line_boulder.dart';
import 'package:breizh_blok_mobile/domain/entities/location/location.dart';
import 'package:breizh_blok_mobile/domain/entities/municipality/municipality.dart';
import 'package:breizh_blok_mobile/domain/entities/rock/rock.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Boulder', () {
    test('fromJson', () {
      final boulder = Boulder.fromJson(const {
        '@id': '/boulders/boulderId',
        'name': 'serre joint',
        'grade': {'@id': '/grades/gradeId', 'name': '7a+'},
        'rock': {
          '@id': '/rocks/rockId',
          'location': {'latitude': '48', 'longitude': '-4'},
          'boulderArea': {
            '@id': '/boulder_areas/boulderAreaId',
            'name': 'Menez Ham',
            'municipality': {
              '@id': '/municipalities/municipalityId',
              'name': 'Kerlouan',
            },
          },
        },
        'lineBoulders': [
          {
            '@id': '/line_boulders/lineBoulderId',
            'rockImage': {'contentUrl': 'contentUrl'},
            'smoothLine': 'smoothLine',
          },
        ],
      });
      expect(boulder.iri, '/boulders/boulderId');
      expect(boulder.id, 'boulderId');
      expect(
        boulder.grade,
        equals(const Grade(iri: '/grades/gradeId', name: '7a+')),
      );
      expect(
        boulder.rock,
        equals(
          const Rock(
            iri: '/rocks/rockId',
            boulderArea: BoulderArea(
              iri: '/boulder_areas/boulderAreaId',
              name: 'Menez Ham',
              municipality: Municipality(
                iri: '/municipalities/municipalityId',
                name: 'Kerlouan',
              ),
            ),
            location: Location(latitude: 48, longitude: -4),
          ),
        ),
      );

      expect(
        boulder.lineBoulders,
        equals(const [
          LineBoulder(
            iri: '/line_boulders/lineBoulderId',
            smoothLine: 'smoothLine',
            rockImage: Image(contentUrl: 'contentUrl'),
          ),
        ]),
      );
    });
  });
}
