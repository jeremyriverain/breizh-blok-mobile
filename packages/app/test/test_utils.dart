import 'package:breizh_blok_mobile/domain/entities/boulder/boulder.dart';
import 'package:breizh_blok_mobile/domain/entities/boulder_area/boulder_area.dart';
import 'package:breizh_blok_mobile/domain/entities/boulder_feedback/boulder_feedback.dart';
import 'package:breizh_blok_mobile/domain/entities/boulder_marker/boulder_marker.dart';
import 'package:breizh_blok_mobile/domain/entities/department/department.dart';
import 'package:breizh_blok_mobile/domain/entities/grade/grade.dart';
import 'package:breizh_blok_mobile/domain/entities/location/location.dart';
import 'package:breizh_blok_mobile/domain/entities/municipality/municipality.dart';
import 'package:breizh_blok_mobile/domain/entities/rock/rock.dart';
import 'package:breizh_blok_mobile/domain/entities/rock_marker/rock_marker.dart';

const fakeBoulder = Boulder(
  iri: '/boulders/foo',
  name: 'Obelix',
  rock: Rock(
    iri: '/rocks/foo',
    boulderArea: fakeBoulderArea,
    location: Location(latitude: 49.1, longitude: 48.2),
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

const fakeBoulderFeedback = BoulderFeedback(
  boulder: fakeBoulder,
  message: 'foo',
);

const fakeGrade6a = Grade(iri: '/grade/1', name: '6a');
const fakeGrade6b = Grade(iri: '/grade/2', name: '6b');
