import 'package:breizh_blok_mobile/config/assets.dart';
import 'package:breizh_blok_mobile/i18n/app_localizations.dart';
import 'package:breizh_blok_mobile/ui/core/widgets/exception_indicator.dart';
import 'package:flutter/material.dart';

/// Indicates that no items were found.
class EmptyListIndicator extends StatelessWidget {
  const EmptyListIndicator({this.message, this.title, super.key});

  final String? title;
  final String? message;

  @override
  Widget build(BuildContext context) => ExceptionIndicator(
    title: title ?? AppLocalizations.of(context).noResults,
    message:
        message ??
        AppLocalizations.of(context).noResultsMatchYourSearchCriteria,
    assetName: Assets.notFoundImage,
  );
}
