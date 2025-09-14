import 'package:breizh_blok_url_launcher/src/url_launcher.dart';
import 'package:breizh_blok_url_launcher/src/url_launcher_impl.dart';
import 'package:url_launcher/url_launcher.dart';

export 'package:breizh_blok_url_launcher/src/exceptions.dart';
export 'package:breizh_blok_url_launcher/src/url_launcher.dart';

abstract class BreizhBlokUrlLauncher {
  static UrlLauncher createUrlLauncher() {
    return UrlLauncherImpl(launchUrl: launchUrl);
  }
}
