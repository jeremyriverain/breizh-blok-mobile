import 'package:breizh_blok_mobile/domain/entities/boulder_feedback/boulder_feedback.dart';
import 'package:breizh_blok_mobile/domain/entities/location/location.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../test_utils.dart';

void main() {
  group('BoulderFeedback', () {
    test('toJson', () {
      expect(
        const BoulderFeedback(boulder: fakeBoulder).toJson(),
        equals({
          'boulder': fakeBoulder.iri,
          'message': null,
          'newLocation': null,
          'videoLink': null,
        }),
      );
      expect(
        const BoulderFeedback(
          boulder: fakeBoulder,
        ).copyWith(message: 'foo').toJson(),
        equals({
          'boulder': fakeBoulder.iri,
          'message': 'foo',
          'newLocation': null,
          'videoLink': null,
        }),
      );
      expect(
        const BoulderFeedback(
              boulder: fakeBoulder,
            )
            .copyWith(newLocation: const Location(latitude: 1, longitude: -4))
            .toJson(),
        equals({
          'boulder': fakeBoulder.iri,
          'message': null,
          'newLocation': {'latitude': '1.0', 'longitude': '-4.0'},
          'videoLink': null,
        }),
      );
      expect(
        const BoulderFeedback(
          boulder: fakeBoulder,
        ).copyWith(videoLink: 'foo').toJson(),
        equals({
          'boulder': fakeBoulder.iri,
          'message': null,
          'newLocation': null,
          'videoLink': 'foo',
        }),
      );
    });
  });
}
