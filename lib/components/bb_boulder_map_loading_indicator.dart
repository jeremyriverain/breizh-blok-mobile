import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BbBoulderMapLoadingIndicator extends StatelessWidget {
  const BbBoulderMapLoadingIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 80),
          child: CircularProgressIndicator(
            color: Colors.red,
            semanticsLabel: AppLocalizations.of(context).fetchingData,
          ),
        ),
      ],
    );
  }
}
