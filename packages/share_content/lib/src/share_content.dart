import 'package:breizh_blok_share_content/src/exceptions.dart';
import 'package:fpdart/fpdart.dart';

enum ShareContentResult {
  success,
  dismissed,
  unavailable,
}

abstract interface class ShareContent {
  TaskEither<ShareContentException, ShareContentResult> share(String text);
}
