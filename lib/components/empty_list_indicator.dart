import 'package:breizh_blok_mobile/components/exception_indicator.dart';
import 'package:flutter/material.dart';

/// Indicates that no items were found.
class EmptyListIndicator extends StatelessWidget {
  const EmptyListIndicator({super.key});

  @override
  Widget build(BuildContext context) => const ExceptionIndicator(
        title: 'Aucun résultat',
        message: 'Aucun résultat ne correspond à vos critères de recherche',
        assetName: 'assets/empty-box.png',
      );
}
