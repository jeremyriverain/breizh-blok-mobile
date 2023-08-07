import 'package:flutter/material.dart';
import 'package:breizh_blok_mobile/components/exception_indicator.dart';

/// Indicates that a connection error occurred.
class NoConnectionIndicator extends StatelessWidget {
  const NoConnectionIndicator({
    Key? key,
    required this.onTryAgain,
  }) : super(key: key);

  final VoidCallback onTryAgain;

  @override
  Widget build(BuildContext context) => ExceptionIndicator(
        title: 'Aucune connexion',
        message: 'Vérifiez votre connexion internet et essayez à nouveau',
        assetName: 'assets/frustrated-face.png',
        onTryAgain: onTryAgain,
      );
}
