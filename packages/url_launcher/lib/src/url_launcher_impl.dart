import 'package:breizh_blok_url_launcher/src/exceptions.dart';
import 'package:breizh_blok_url_launcher/src/url_launcher.dart';
import 'package:fpdart/fpdart.dart';
import 'package:url_launcher/url_launcher.dart';

typedef LaunchUrl =
    Future<bool> Function(
      Uri url, {
      LaunchMode mode,
      WebViewConfiguration webViewConfiguration,
      BrowserConfiguration browserConfiguration,
      String? webOnlyWindowName,
    });

class UrlLauncherImpl implements UrlLauncher {
  UrlLauncherImpl({required this.launchUrl});

  final LaunchUrl launchUrl;

  @override
  TaskEither<LaunchUrlException, bool> openUrl(Uri uri) {
    return TaskEither.tryCatch(
      () {
        return launchUrl(uri);
      },
      (e, _) {
        return LaunchUrlException.unknwown(message: e.toString());
      },
    );
  }
}
