import 'dart:io';

import 'package:breizh_blok_mobile/components/generic_error_indicator.dart';
import 'package:breizh_blok_mobile/components/no_connection_indicator.dart';
import 'package:flutter/material.dart';

/// Based on the received error, displays either a [NoConnectionIndicator] or
/// a [GenericErrorIndicator].
class ErrorIndicator extends StatelessWidget {
  const ErrorIndicator({
    required this.onTryAgain,
    this.error = 'Une erreur est survenue',
    super.key,
  });

  final String error;
  final VoidCallback onTryAgain;

  @override
  Widget build(BuildContext context) => error is SocketException
      ? NoConnectionIndicator(
          onTryAgain: onTryAgain,
        )
      : GenericErrorIndicator(
          onTryAgain: onTryAgain,
        );
}
