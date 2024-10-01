import 'package:breizh_blok_mobile/components/bb_exception_indicator.dart';
import 'package:flutter/cupertino.dart';

/// Indicates that an unknown error occurred.
class BbGenericErrorIndicator extends StatelessWidget {
  const BbGenericErrorIndicator({
    this.onTryAgain,
    super.key,
  });

  final VoidCallback? onTryAgain;

  @override
  Widget build(BuildContext context) => BbExceptionIndicator(
        title: 'Une erreur est survenue',
        assetName: 'assets/confused-face.png',
        onTryAgain: onTryAgain,
      );
}
