import 'package:breizh_blok_mobile/domain/models/boulder/boulder.dart';
import 'package:breizh_blok_mobile/domain/models/boulder_area/boulder_area.dart';
import 'package:breizh_blok_mobile/domain/models/department/department.dart';
import 'package:breizh_blok_mobile/domain/models/location/location.dart';
import 'package:breizh_blok_mobile/domain/models/municipality/municipality.dart';
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

const fakeDepartment = Department(
  iri: '/departments/foo',
  name: 'Finistère',
  municipalities: [fakeMunicipality],
);

const fakeMunicipality = Municipality(
  iri: '/municipalities/foo',
  name: 'Kerlouan',
);
