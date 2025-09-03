import 'package:breizh_blok_mobile/services/share_content/share_content_service_interface.dart';
import 'package:share_plus/share_plus.dart';

class ShareContentService implements ShareContentServiceInterface {
  @override
  Future<ShareResult> share(String text) async {
    return SharePlus.instance.share(ShareParams(text: text));
  }
}
