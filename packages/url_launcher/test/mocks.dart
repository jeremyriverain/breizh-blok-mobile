import 'package:mocktail/mocktail.dart';
import 'package:url_launcher/url_launcher.dart';

class MockLaunchUrl extends Mock {
  Future<bool> call(
    Uri url, {
    LaunchMode mode,
    WebViewConfiguration webViewConfiguration,
    BrowserConfiguration browserConfiguration,
    String? webOnlyWindowName,
  });
}
