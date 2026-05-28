import 'package:breizh_blok_mobile/ui/core/extensions/string_extension.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('StringExtension', () {
    test('hashDjb2', () {
      expect('foo'.hashDjb2(), equals(193491849));
    });

    test('randomColorFromString', () {
      expect('a'.randomColorFromString(), equals(palette[1]));
      expect('b'.randomColorFromString(), equals(palette[2]));
      expect('c'.randomColorFromString(), equals(palette[3]));
      expect('d'.randomColorFromString(), equals(palette[4]));
      expect('e'.randomColorFromString(), equals(palette[5]));
      expect('f'.randomColorFromString(), equals(palette[6]));
      expect('g'.randomColorFromString(), equals(palette[7]));
      expect('h'.randomColorFromString(), equals(palette[8]));
      expect('i'.randomColorFromString(), equals(palette[0]));
      expect('j'.randomColorFromString(), equals(palette[1]));
    });
  });
}
