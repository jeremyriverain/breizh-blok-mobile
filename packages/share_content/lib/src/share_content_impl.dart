import 'package:breizh_blok_share_content/src/exceptions.dart';
import 'package:breizh_blok_share_content/src/share_content.dart';
import 'package:fpdart/fpdart.dart';
import 'package:share_plus/share_plus.dart';

class ShareContentImpl implements ShareContent {
  ShareContentImpl({required this.sharePlus});

  final SharePlus sharePlus;

  @override
  TaskEither<ShareContentException, ShareContentResult> share(String text) {
    return TaskEither.tryCatch(
      () {
        return sharePlus.share(ShareParams(text: text)).then((
          shareResult,
        ) {
          return switch (shareResult.status) {
            ShareResultStatus.success => ShareContentResult.success,
            ShareResultStatus.dismissed => ShareContentResult.dismissed,
            ShareResultStatus.unavailable => ShareContentResult.unavailable,
          };
        });
      },
      (e, _) {
        return ShareContentException.unknwown(message: e.toString());
      },
    );
  }
}
