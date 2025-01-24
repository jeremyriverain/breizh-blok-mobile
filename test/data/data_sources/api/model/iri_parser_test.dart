import 'package:breizh_blok_mobile/data/data_sources/api/model/iri_parser.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('IriParser', () {
    test('can retrieve ID from IRI', () {
      expect(IriParser.id('/boulders/7'), '7');
    });
  });
}
