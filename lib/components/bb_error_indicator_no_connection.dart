import 'package:breizh_blok_mobile/components/bb_exception_indicator.dart';
import 'package:flutter/material.dart';

/// Indicates that a connection error occurred.
class BbErrorIndicatorNoConnection extends StatelessWidget {
  const BbErrorIndicatorNoConnection({
    required this.onTryAgain,
    super.key,
  });

  final VoidCallback onTryAgain;

  @override
  Widget build(BuildContext context) => BbExceptionIndicator(
        title: 'Aucune connexion',
        message: 'Vérifiez votre connexion internet et essayez à nouveau',
        assetName: 'assets/frustrated-face.png',
        onTryAgain: onTryAgain,
      );
}
