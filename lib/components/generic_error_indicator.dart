import 'package:breizh_blok_mobile/components/exception_indicator.dart';
import 'package:flutter/cupertino.dart';

/// Indicates that an unknown error occurred.
class GenericErrorIndicator extends StatelessWidget {
  const GenericErrorIndicator({
    required this.onTryAgain,
    super.key,
  });

  final VoidCallback onTryAgain;

  @override
  Widget build(BuildContext context) => ExceptionIndicator(
        title: 'Une erreur est survenue',
        message: "L'application a rencontré une erreur.\n"
            'Essayez à nouveau.',
        assetName: 'assets/confused-face.png',
        onTryAgain: onTryAgain,
      );
}
