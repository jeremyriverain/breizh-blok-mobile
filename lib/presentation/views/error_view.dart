import 'dart:async';

import 'package:breizh_blok_mobile/presentation/widgets/bb_error_indicator.dart';
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
        child: BbErrorIndicator(
          onTryAgain: onTryAgain,
        ),
      ),
    );
  }
}
