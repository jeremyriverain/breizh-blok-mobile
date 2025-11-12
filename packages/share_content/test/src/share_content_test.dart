import 'package:breizh_blok_share_content/breizh_blok_share_content.dart';
import 'package:breizh_blok_share_content/src/share_content_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:share_plus/share_plus.dart';

import '../mocks.dart';

void main() {
  group('ShareContent', () {
    group('share', () {
      late SharePlus sharePlus;

      setUp(() {
        sharePlus = MockSharePlus();
      });

      setUpAll(() {
        registerFallbackValue(ShareParams());
      });

      test(
        'return ShareContentException if sharePlus throws exception',
        () async {
          when(
            () => sharePlus.share(
              any(
                that: isA<ShareParams>().having((a) => a.text, 'text', 'foo'),
              ),
            ),
          ).thenThrow(Exception('foo'));

          final shareContent = ShareContentImpl(sharePlus: sharePlus);

          final result = await shareContent.share('foo').run();

          expect(
            result,
            const Left<ShareContentException, ShareContentResult>(
              ShareContentException.unknwown(message: 'Exception: foo'),
            ),
          );
        },
      );

      test('when share plus is unavailable', () async {
        when(
          () => sharePlus.share(
            any(
              that: isA<ShareParams>().having((a) => a.text, 'text', 'foo'),
            ),
          ),
        ).thenAnswer((a) async => ShareResult.unavailable);

        final shareContent = ShareContentImpl(sharePlus: sharePlus);

        final result = await shareContent.share('foo').run();

        expect(
          result,
          const Right<ShareContentException, ShareContentResult>(
            ShareContentResult.unavailable,
          ),
        );
      });

      test('when share plus is dismissed', () async {
        when(
          () => sharePlus.share(
            any(
              that: isA<ShareParams>().having((a) => a.text, 'text', 'foo'),
            ),
          ),
        ).thenAnswer(
          (a) async => const ShareResult('', ShareResultStatus.dismissed),
        );

        final shareContent = ShareContentImpl(sharePlus: sharePlus);

        final result = await shareContent.share('foo').run();

        expect(
          result,
          const Right<ShareContentException, ShareContentResult>(
            ShareContentResult.dismissed,
          ),
        );
      });

      test('when share plus is a success', () async {
        when(
          () => sharePlus.share(
            any(
              that: isA<ShareParams>().having((a) => a.text, 'text', 'foo'),
            ),
          ),
        ).thenAnswer(
          (a) async => const ShareResult('', ShareResultStatus.success),
        );

        final shareContent = ShareContentImpl(sharePlus: sharePlus);

        final result = await shareContent.share('foo').run();

        expect(
          result,
          const Right<ShareContentException, ShareContentResult>(
            ShareContentResult.success,
          ),
        );
      });
    });
  });
}
