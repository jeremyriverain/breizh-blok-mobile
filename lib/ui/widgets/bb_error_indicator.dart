import 'dart:async';

import 'package:breizh_blok_mobile/ui/widgets/bb_exception_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BbErrorIndicator extends StatelessWidget {
  const BbErrorIndicator({
    this.onTryAgain,
    this.error,
    super.key,
  });

  final String? error;
  final FutureOr<void> Function()? onTryAgain;

  @override
  Widget build(BuildContext context) => BbExceptionIndicator(
        title: error ?? AppLocalizations.of(context).anErrorOccured,
        assetName: 'assets/confused-face.png',
        onTryAgain: onTryAgain,
      );
}
