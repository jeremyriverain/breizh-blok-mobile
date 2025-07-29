import 'package:breizh_blok_mobile/domain/entities/boulder/boulder.dart';
import 'package:breizh_blok_mobile/i18n/app_localizations.dart';
import 'package:breizh_blok_mobile/ui/contribute_boulder/boulder_message_form_screen.dart';
import 'package:flutter/material.dart';

class ContributeBoulderScreen extends StatelessWidget {
  const ContributeBoulderScreen({required this.boulder, super.key});

  final Boulder boulder;

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: FittedBox(
          child: Text(
            '${localizations.contributeTo} '
            '${boulder.name}',
          ),
        ),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.comment),
            title: Text(localizations.makeSuggestion),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder:
                      (context) => BoulderMessageFormScreen(boulder: boulder),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.place),
            title: Text(localizations.specifyBoulderLocation),
            subtitle: Row(
              children: [
                Badge(
                  label: Text(localizations.comingSoon),
                  backgroundColor: Theme.of(context).colorScheme.primary,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
