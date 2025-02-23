import 'package:breizh_blok_mobile/i18n/app_localizations.dart';
import 'package:flutter/material.dart';

class BoulderMapLoadingIndicator extends StatelessWidget {
  const BoulderMapLoadingIndicator({super.key});

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
