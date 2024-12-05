import 'package:breizh_blok_mobile/ui/widgets/profile_language_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ListTile(
            title: Text(
              AppLocalizations.of(context).downloads,
            ),
            leading: const Icon(Icons.download_outlined),
            onTap: () {
              context.pushNamed('downloads');
            },
          ),
          ProfileLanguageSwitcher(
            currentLocale: Localizations.localeOf(context).languageCode,
          ),
        ],
      ),
    );
  }
}
