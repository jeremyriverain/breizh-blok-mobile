import 'package:breizh_blok_mobile/ui/core/validators/not_equal_validator.dart';
import 'package:breizh_blok_mobile/ui/core/validators/url_validator.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:reactive_forms/reactive_forms.dart';

void main() {
  group('UrlValidator', () {
    test('a string that is not a URL is not valid', () {
      const validator = UrlValidator();

      expect(
        validator.validate(
          FormControl(value: 'foo'),
        ),
        equals({
          'url': {'value': 'foo'},
        }),
      );
    });

    test('https://youtube.com/watch?v=foo is valid', () {
      const validator = UrlValidator();

      expect(
        validator.validate(
          FormControl(value: 'https://youtube.com/watch?v=foo'),
        ),
        isNull,
      );
    });
  });
}
