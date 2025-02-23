import 'package:breizh_blok_mobile/domain/models/image/image.dart';
import 'package:breizh_blok_mobile/domain/models/line_boulder/line_boulder.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('LineBoulder', () {
    group('fromJson', () {
      test('full property OK', () {
        final lineBoulder = LineBoulder.fromJson(
          const {
            '@id': 'bar',
            'smoothLine': 'foo',
            'rockImage': {
              'contentUrl': 'contentUrl',
            },
          },
        );
        expect(lineBoulder.smoothLine, equals('foo'));
        expect(
          lineBoulder.rockImage,
          equals(
            const Image(contentUrl: 'contentUrl'),
          ),
        );
      });
    });
  });
}
