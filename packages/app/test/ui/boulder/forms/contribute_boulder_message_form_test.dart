import 'package:breizh_blok_mobile/ui/boulder/forms/contribute_boulder_message_form.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ContributeBoulderMessageForm', () {
    test(
      '''
Given the field "message" is null,
Then this field is invalid
''',
      () async {
        final form = ContributeBoulderMessageForm();

        final messageKey = ContributeBoulderMessageForm.formKeys.message;

        expect(form.valid, isFalse);
        expect(form.errors.keys.contains(messageKey), isTrue);
        form.control(messageKey).value = 'foo';

        expect(form.errors.keys.contains(messageKey), isFalse);
        expect(form.valid, isTrue);
      },
    );
  });
}
