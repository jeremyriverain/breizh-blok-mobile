import 'package:share_plus/share_plus.dart';

// ignore: one_member_abstracts
abstract interface class ShareContentServiceInterface {
  Future<ShareResult> share(String text);
}
