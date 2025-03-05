import 'package:breizh_blok_mobile/domain/models/boulder/boulder.dart';
import 'package:breizh_blok_mobile/domain/models/boulder_area/boulder_area.dart';
import 'package:breizh_blok_mobile/domain/models/location/location.dart';
import 'package:breizh_blok_mobile/domain/models/rock/rock.dart';

const fakeBoulder = Boulder(
  iri: '/boulders/foo',
  name: 'Obelix',
  rock: Rock(
    iri: '/rocks/foo',
    boulderArea: BoulderArea(iri: '/boulder_areas/foo', name: 'Kerlouan'),
    location: Location(latitude: 49, longitude: 49),
  ),
);
