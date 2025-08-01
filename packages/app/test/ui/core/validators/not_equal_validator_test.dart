import 'package:breizh_blok_mobile/ui/core/validators/not_equal_validator.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:reactive_forms/reactive_forms.dart';

void main() {
  group('NotEqualValidator', () {
    test('is valid if value is different than forbidden value', () async {
      const validator = NotEqualValidator(true);

      expect(validator.validate(FormControl(value: false)), isNull);
    });

    test('is not valid if value is equal to forbidden value', () async {
      const validator = NotEqualValidator(true);

      expect(
        validator.validate(FormControl(value: true)),
        equals({
          'notEqual': {'forbiddenValue': true},
        }),
      );
    });
  });
}
