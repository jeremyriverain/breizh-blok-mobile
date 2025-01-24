import 'dart:async';

import 'package:breizh_blok_mobile/config/assets.dart';
import 'package:breizh_blok_mobile/ui/core/widgets/exception_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ErrorIndicator extends StatelessWidget {
  const ErrorIndicator({
    this.onTryAgain,
    this.error,
    super.key,
  });

  final String? error;
  final FutureOr<void> Function()? onTryAgain;

  @override
  Widget build(BuildContext context) => ExceptionIndicator(
        title: error ?? AppLocalizations.of(context).anErrorOccured,
        assetName: Assets.errorImage,
        onTryAgain: onTryAgain,
      );
}
