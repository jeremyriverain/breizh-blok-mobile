import 'package:breizh_blok_mobile/i18n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ContributeBoulderFormView extends StatelessWidget {
  const ContributeBoulderFormView({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    return AlertDialog(
      title: Text(localizations.contribute),
      actions: [
        TextButton(
          onPressed: () {
            context.pop();
          },
          style: TextButton.styleFrom(
            foregroundColor: Theme.of(context).colorScheme.error,
          ),
          child: Text(localizations.cancel),
        ),
        TextButton(
          onPressed: () {
            context.pop();
          },
          child: Text(localizations.send),
        ),
      ],
    );
  }
}
