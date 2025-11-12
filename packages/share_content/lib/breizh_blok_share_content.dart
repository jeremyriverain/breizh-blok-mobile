import 'package:breizh_blok_share_content/src/share_content.dart';
import 'package:breizh_blok_share_content/src/share_content_impl.dart';
import 'package:share_plus/share_plus.dart';

export 'package:breizh_blok_share_content/src/exceptions.dart';
export 'package:breizh_blok_share_content/src/share_content.dart';

abstract class BreizhBlokShareContent {
  static ShareContent createShareContent() {
    return ShareContentImpl(sharePlus: SharePlus.instance);
  }
}
