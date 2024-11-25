import 'package:breizh_blok_mobile/ui/widgets/bb_exception_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

/// Indicates that no items were found.
class BbEmptyListIndicator extends StatelessWidget {
  const BbEmptyListIndicator({
    this.message,
    this.title,
    super.key,
  });

  final String? title;
  final String? message;

  @override
  Widget build(BuildContext context) => BbExceptionIndicator(
        title: title ?? AppLocalizations.of(context).noResults,
        message: message ??
            AppLocalizations.of(context).noResultsMatchYourSearchCriteria,
        assetName: 'assets/empty-box.png',
      );
}
