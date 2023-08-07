import 'dart:async';

import 'package:breizh_blok_mobile/components/generic_error_indicator.dart';
import 'package:flutter/material.dart';

class ErrorView extends StatelessWidget {
  final FutureOr<void> Function() onTryAgain;
  const ErrorView({
    super.key,
    required this.onTryAgain,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Center(
        child: GenericErrorIndicator(
          onTryAgain: onTryAgain,
        ),
      ),
    );
  }
}
