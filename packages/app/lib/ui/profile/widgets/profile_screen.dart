import 'package:breizh_blok_mobile/i18n/app_localizations.dart';
import 'package:breizh_blok_mobile/ui/core/widgets/auth_builder.dart';
import 'package:breizh_blok_mobile/ui/core/widgets/clickable_list_tile.dart';
import 'package:breizh_blok_mobile/ui/download/widgets/downloaded_boulder_areas_screen.dart';
import 'package:breizh_blok_mobile/ui/locale/widgets/locale_switch.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  static const ({String name, String path}) route = (
    path: '/profile',
    name: 'profile',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context).myProfile,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        children: [
          ClickableListTile(
            title: Text(AppLocalizations.of(context).downloads),
            leading: const Icon(Icons.download_outlined),
            onTap: () async {
              await context.pushNamed(DownloadedBoulderAreasScreen.route.name);
            },
          ),
          LocaleSwitch(
            currentLocale: Localizations.localeOf(context).languageCode,
          ),
          AuthBuilder(
            builder: (context, auth) {
              if (auth.isAuthenticated) {
                return ListTile(
                  iconColor: Theme.of(context).colorScheme.error,
                  title: Text(
                    AppLocalizations.of(context).logout,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.error,
                    ),
                  ),
                  onTap: () async {
                    await auth.logout();
                  },
                  leading: const Icon(Icons.logout),
                );
              }
              return ListTile(
                title: Text(AppLocalizations.of(context).login),
                onTap: () async {
                  await auth.login();
                },
                leading: const Icon(Icons.login),
              );
            },
          ),
        ],
      ),
    );
  }
}
