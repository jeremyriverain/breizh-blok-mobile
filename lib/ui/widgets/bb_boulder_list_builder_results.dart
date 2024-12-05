import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BbBoulderListBuilderResults extends StatelessWidget {
  const BbBoulderListBuilderResults({
    required this.totalItems,
    super.key,
  });
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
