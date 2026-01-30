import 'package:breizh_blok_mobile/ui/boulder/forms/contribute_boulder_video_link_form.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ContributeBoulderVideoLinkForm', () {
    test(
      '''
Given the field "videoLink" is null,
Then this field is invalid
''',
      () async {
        final form = ContributeBoulderVideoLinkForm();

        final videoLinkForm = ContributeBoulderVideoLinkForm.formKeys.videoLink;

        expect(form.valid, isFalse);
        expect(form.errors.keys.contains(videoLinkForm), isTrue);
        form.control(videoLinkForm).value = 'http:://foo.bar';

        expect(form.errors.keys.contains(videoLinkForm), isFalse);
        expect(form.valid, isTrue);
      },
    );

    test(
      '''
Given the field "videoLink" is not a URL,
Then this field is invalid
''',
      () async {
        final form = ContributeBoulderVideoLinkForm();

        final videoLinkForm = ContributeBoulderVideoLinkForm.formKeys.videoLink;

        expect(form.valid, isFalse);
        expect(form.errors.keys.contains(videoLinkForm), isTrue);
        form.control(videoLinkForm).value = 'foo';

        expect(form.errors.keys.contains(videoLinkForm), isTrue);
        expect(form.valid, isFalse);
      },
    );
  });
}
