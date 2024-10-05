import 'package:share_plus/share_plus.dart';

class ShareContentService {
  Future<ShareResult> share(String text) async {
    return Share.share(text);
  }
}
