import 'package:breizh_blok_mobile/domain/models/boulder/boulder.dart';
import 'package:breizh_blok_mobile/domain/models/boulder_area/boulder_area.dart';
import 'package:breizh_blok_mobile/domain/models/boulder_marker/boulder_marker.dart';
import 'package:breizh_blok_mobile/domain/models/department/department.dart';
import 'package:breizh_blok_mobile/domain/models/location/location.dart';
import 'package:breizh_blok_mobile/domain/models/municipality/municipality.dart';
import 'package:breizh_blok_mobile/domain/models/rock/rock.dart';
import 'package:breizh_blok_mobile/domain/models/rock_marker/rock_marker.dart';

const fakeBoulder = Boulder(
  iri: '/boulders/foo',
  name: 'Obelix',
  rock: Rock(
    iri: '/rocks/foo',
    boulderArea: fakeBoulderArea,
    location: Location(latitude: 49, longitude: 49),
  ),
);

const fakeDepartment = Department(
  iri: '/departments/foo',
  name: 'Finistère',
  municipalities: [fakeMunicipality],
);

const fakeMunicipality = Municipality(
  iri: '/municipalities/foo',
  name: 'Kerlouan',
);

const fakeBoulderArea = BoulderArea(
  iri: '/boulder_areas/foo',
  name: 'Cremiou',
  parkingLocation: Location(latitude: 2, longitude: 3),
);

const fakeBoulderMarker = BoulderMarker(
  id: 1,
  rock: RockMarker(location: Location(latitude: 2, longitude: 3)),
);
