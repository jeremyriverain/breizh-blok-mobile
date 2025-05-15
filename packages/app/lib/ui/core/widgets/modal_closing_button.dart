import 'package:breizh_blok_mobile/i18n/app_localizations.dart';
import 'package:flutter/material.dart';

class ModalClosingButton extends StatelessWidget {
  const ModalClosingButton({super.key});

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
