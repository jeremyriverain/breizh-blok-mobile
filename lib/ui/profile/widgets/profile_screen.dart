import 'package:breizh_blok_mobile/i18n/app_localizations.dart';
import 'package:breizh_blok_mobile/ui/download/widgets/download_screen.dart';
import 'package:breizh_blok_mobile/ui/profile/widgets/profile_language_switcher.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  static const route = (path: '/profile', name: 'profile');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ListTile(
            title: Text(AppLocalizations.of(context).downloads),
            leading: const Icon(Icons.download_outlined),
            onTap: () {
              context.pushNamed(DownloadScreen.route.name);
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
