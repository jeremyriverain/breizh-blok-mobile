import 'package:breizh_blok_mobile/i18n/app_localizations.dart';
import 'package:flutter/material.dart';

class BoulderListBuilderResults extends StatelessWidget {
  const BoulderListBuilderResults({required this.totalItems, super.key});
  final int totalItems;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: '$totalItems ',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              TextSpan(
                text: AppLocalizations.of(context).nBoulders(count: totalItems),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
