import 'package:flutter/cupertino.dart';

import 'package:breizh_blok_mobile/components/exception_indicator.dart';

/// Indicates that an unknown error occurred.
class GenericErrorIndicator extends StatelessWidget {
  const GenericErrorIndicator({
    Key? key,
    required this.onTryAgain,
  }) : super(key: key);

  final VoidCallback onTryAgain;

  @override
  Widget build(BuildContext context) => ExceptionIndicator(
        title: 'Une erreur est survenue',
        message: 'L\'application a rencontré une erreur.\n'
            'Essayez à nouveau.',
        assetName: 'assets/confused-face.png',
        onTryAgain: onTryAgain,
      );
}
