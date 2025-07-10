import 'package:share_plus/share_plus.dart';

abstract interface class ShareContentServiceInterface {
  Future<ShareResult> share(String text);
}
