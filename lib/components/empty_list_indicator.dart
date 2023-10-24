import 'package:breizh_blok_mobile/components/exception_indicator.dart';
import 'package:flutter/material.dart';

/// Indicates that no items were found.
class EmptyListIndicator extends StatelessWidget {
  const EmptyListIndicator({
    this.title = 'Aucun résultat',
    this.message = 'Aucun résultat ne correspond à vos critères de recherche',
    super.key,
  });

  final String title;
  final String message;

  @override
  Widget build(BuildContext context) => ExceptionIndicator(
        title: title,
        message: message,
        assetName: 'assets/empty-box.png',
      );
}
