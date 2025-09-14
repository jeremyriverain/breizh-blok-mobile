import 'package:breizh_blok_url_launcher/src/exceptions.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class UrlLauncher {
  TaskEither<LaunchUrlException, bool> openUrl(Uri uri);
}
