import 'dart:io';

import 'package:breizh_blok_mobile/components/bb_error_indicator_no_connection.dart';
import 'package:breizh_blok_mobile/components/bb_generic_error_indicator.dart';
import 'package:flutter/material.dart';

class BbErrorIndicator extends StatelessWidget {
  const BbErrorIndicator({
    required this.onTryAgain,
    this.error = 'Une erreur est survenue',
    super.key,
  });

  final String error;
  final VoidCallback onTryAgain;

  @override
  Widget build(BuildContext context) => error is SocketException
      ? BbErrorIndicatorNoConnection(
          onTryAgain: onTryAgain,
        )
      : BbGenericErrorIndicator(
          onTryAgain: onTryAgain,
        );
}
