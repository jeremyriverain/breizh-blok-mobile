import 'package:breizh_blok_mobile/components/profile_language_switcher.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ListTile(
            title: const Text(
              'Téléchargements',
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
