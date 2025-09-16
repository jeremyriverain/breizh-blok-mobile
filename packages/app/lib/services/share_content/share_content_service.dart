import 'package:share_plus/share_plus.dart';

abstract interface class ShareContentService {
  Future<ShareResult> share(String text);
}
