import 'package:breizh_blok_mobile/domain/entities/domain_exception/domain_exception.dart';
import 'package:breizh_blok_mobile/services/url_launcher/url_launcher.dart';
import 'package:breizh_blok_mobile/services/url_launcher/url_launcher_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../mocks.dart';

void main() {
  group('UrlLauncher', () {
    group('openUrl', () {
      late LaunchUrl launchUrl;
      late UrlLauncher urlLauncher;

      final uri = Uri.parse('http://foo.bar');

      setUp(() {
        launchUrl = MockLaunchUrl().call;
        urlLauncher = UrlLauncherImpl(launchUrl: launchUrl);
      });

      setUpAll(() {
        registerFallbackValue(LaunchMode.platformDefault);
        registerFallbackValue(const WebViewConfiguration());
        registerFallbackValue(const BrowserConfiguration());
      });

      test('return Right(true) if launchUrl returns true', () async {
        when(
          () => launchUrl(
            uri,
            mode: any(named: 'mode'),
            webViewConfiguration: any(named: 'webViewConfiguration'),
            webOnlyWindowName: any(named: 'webOnlyWindowName'),
            browserConfiguration: any(named: 'browserConfiguration'),
          ),
        ).thenAnswer((_) async => true);

        final result = await urlLauncher.openUrl(uri).run();

        expect(result, const Right<DomainException, bool>(true));
      });

      test('return Right(false) if launchUrl returns false', () async {
        when(
          () => launchUrl(
            uri,
            mode: any(named: 'mode'),
            webViewConfiguration: any(named: 'webViewConfiguration'),
            webOnlyWindowName: any(named: 'webOnlyWindowName'),
            browserConfiguration: any(named: 'browserConfiguration'),
          ),
        ).thenAnswer((_) async => false);

        final result = await urlLauncher.openUrl(uri).run();

        expect(result, const Right<DomainException, bool>(false));
      });

      test('cast to UnknownException if launchUrl throws Exception', () async {
        when(
          () => launchUrl(
            uri,
            mode: any(named: 'mode'),
            webViewConfiguration: any(named: 'webViewConfiguration'),
            webOnlyWindowName: any(named: 'webOnlyWindowName'),
            browserConfiguration: any(named: 'browserConfiguration'),
          ),
        ).thenThrow(Exception('foo'));

        final result = await urlLauncher.openUrl(uri).run();

        expect(
          result,
          const Left<DomainException, bool>(
            UnknownException(message: 'Exception: foo'),
          ),
        );
      });
    });
  });
}
