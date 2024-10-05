import 'package:breizh_blok_mobile/models/municipality.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('shareableContent contains correct deep link', () {
    final municipality = Municipality(iri: '/foo/1', name: 'Bar');

    expect(
      municipality.shareableContent,
      contains('https://breizh-blok.fr/municipalities/1'),
    );
  });
}
