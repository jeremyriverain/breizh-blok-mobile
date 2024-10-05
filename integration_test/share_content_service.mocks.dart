import 'package:breizh_blok_mobile/share_content_service_interface.dart';
// ignore: depend_on_referenced_packages
import 'package:share_plus_platform_interface/platform_interface/share_plus_platform.dart';

class MockShareContentService implements ShareContentServiceInterface {
  final List<String> sharedContents = [];

  @override
  Future<ShareResult> share(String text) async {
    sharedContents.add(text);
    return const ShareResult('foo', ShareResultStatus.success);
  }
}
