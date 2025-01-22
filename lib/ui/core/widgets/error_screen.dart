import 'dart:async';

import 'package:breizh_blok_mobile/ui/core/widgets/error_indicator.dart';
import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({
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
        child: ErrorIndicator(
          onTryAgain: onTryAgain,
        ),
      ),
    );
  }
}
