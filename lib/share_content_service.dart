import 'package:breizh_blok_mobile/share_content_service_interface.dart';
import 'package:share_plus/share_plus.dart';

class ShareContentService implements ShareContentServiceInterface {
  @override
  Future<ShareResult> share(String text) async {
    return Share.share(text);
  }
}
