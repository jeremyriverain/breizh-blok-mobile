import 'package:breizh_blok_mobile/components/bb_exception_indicator.dart';
import 'package:flutter/material.dart';

/// Indicates that no items were found.
class BbEmptyListIndicator extends StatelessWidget {
  const BbEmptyListIndicator({
    this.title = 'Aucun résultat',
    this.message = 'Aucun résultat ne correspond à vos critères de recherche',
    super.key,
  });

  final String title;
  final String message;

  @override
  Widget build(BuildContext context) => BbExceptionIndicator(
        title: title,
        message: message,
        assetName: 'assets/empty-box.png',
      );
}
