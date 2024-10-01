import 'dart:async';

import 'package:breizh_blok_mobile/components/bb_generic_error_indicator.dart';
import 'package:flutter/material.dart';

class ErrorView extends StatelessWidget {
  const ErrorView({
    this.onTryAgain,
    super.key,
  });
  final FutureOr<void> Function()? onTryAgain;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Center(
        child: BbGenericErrorIndicator(
          onTryAgain: onTryAgain,
        ),
      ),
    );
  }
}
