import 'package:breizh_blok_mobile/domain/entities/image/image.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Image', () {
    group('fromJson', () {
      test('full property OK', () {
        final image = Image.fromJson(const {
          'filterUrl': 'filterUrl',
          'contentUrl': 'contentUrl',
          'imageDimensions': ['1', '2'],
        });
        expect(image.contentUrl, equals('contentUrl'));
        expect(image.filterUrl, equals('filterUrl'));
        expect(image.width, equals(1));
        expect(image.height, equals(2));
      });

      test('filterUrl not present', () {
        final image = Image.fromJson(const {'contentUrl': 'contentUrl'});
        expect(image.filterUrl, isNull);
      });

      test(
        '''
Given imageDimensions is null,
Then width and height are null
''',
        () {
          final image = Image.fromJson(const {'contentUrl': 'contentUrl'});
          expect(image.imageDimensions, isNull);
          expect(image.width, isNull);
          expect(image.height, isNull);
        },
      );
    });
  });
}
