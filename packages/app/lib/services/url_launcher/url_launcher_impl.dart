import 'package:breizh_blok_mobile/domain/entities/domain_exception/domain_exception.dart';
import 'package:breizh_blok_mobile/services/url_launcher/url_launcher.dart';
import 'package:fpdart/fpdart.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlLauncherImpl implements UrlLauncher {
  UrlLauncherImpl({required this.launchUrl});

  final Future<bool> Function(
    Uri url, {
    LaunchMode mode,
    WebViewConfiguration webViewConfiguration,
    BrowserConfiguration browserConfiguration,
    String? webOnlyWindowName,
  })
  launchUrl;

  @override
  TaskEither<DomainException, bool> openUrl(Uri uri) {
    return TaskEither.tryCatch(
      () {
        return launchUrl(uri);
      },
      (e, _) {
        return UnknownException(message: e.toString());
      },
    );
  }
}
