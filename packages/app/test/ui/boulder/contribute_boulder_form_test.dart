import 'package:breizh_blok_mobile/ui/boulder/contribute_boulder_form.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ContributeBoulderForm', () {
    test(
      '''
Given the field "message" is null,
Then this field is invalid
''',
      () async {
        final form = ContributeBoulderForm();

        final messageKey = ContributeBoulderForm.formKeys.message;

        expect(form.valid, isFalse);
        expect(form.errors.keys.contains(messageKey), isTrue);
        form.control(messageKey).value = 'foo';

        expect(form.errors.keys.contains(messageKey), isFalse);
        expect(form.valid, isTrue);
      },
    );
  });
}
