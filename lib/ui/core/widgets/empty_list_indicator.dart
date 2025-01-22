import 'package:breizh_blok_mobile/ui/core/widgets/exception_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

/// Indicates that no items were found.
class EmptyListIndicator extends StatelessWidget {
  const EmptyListIndicator({
    this.message,
    this.title,
    super.key,
  });

  final String? title;
  final String? message;

  @override
  Widget build(BuildContext context) => ExceptionIndicator(
        title: title ?? AppLocalizations.of(context).noResults,
        message: message ??
            AppLocalizations.of(context).noResultsMatchYourSearchCriteria,
        assetName: 'assets/empty-box.png',
      );
}
