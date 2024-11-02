import 'package:breizh_blok_mobile/models/boulder.dart';
import 'package:breizh_blok_mobile/models/rock.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';

import './boulder_test.mocks.dart';

@GenerateMocks([Rock])
void main() {
  test('2 boulders are not equal if they have different IRIs', () {
    final boulder1 = Boulder(
      name: 'test1',
      iri: '/boulders/1',
      rock: MockRock(),
    );

    final boulder2 = Boulder(
      name: 'test2',
      iri: '/boulders/2',
      rock: MockRock(),
    );
    expect(boulder1 == boulder2, false);
  });

  test('2 boulders are equal if they have same IRIs', () {
    final boulder1 = Boulder(
      name: 'test1',
      iri: '/boulders/1',
      rock: MockRock(),
    );

    final boulder2 = Boulder(
      name: 'test2',
      iri: '/boulders/1',
      rock: MockRock(),
    );
    expect(boulder1 == boulder2, true);
  });
}
