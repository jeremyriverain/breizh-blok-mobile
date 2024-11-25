import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BbModalClosingButton extends StatelessWidget {
  const BbModalClosingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      transform: Matrix4.translationValues(0, -26, 0),
      child: FloatingActionButton(
        mini: true,
        tooltip: AppLocalizations.of(context).closeTheModal,
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: const Icon(Icons.close),
      ),
    );
  }
}
