import 'package:breizh_blok_mobile/auth/auth_service_interface.dart';
import 'package:breizh_blok_mobile/i18n/app_localizations.dart';
import 'package:breizh_blok_mobile/ui/download/widgets/downloaded_boulder_areas_screen.dart';
import 'package:breizh_blok_mobile/ui/locale/widgets/locale_switch.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  static const route = (path: '/profile', name: 'profile');

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
          ListTile(
            title: Text(AppLocalizations.of(context).downloads),
            leading: const Icon(Icons.download_outlined),
            onTap: () {
              context.pushNamed(DownloadedBoulderAreasScreen.route.name);
            },
          ),
          LocaleSwitch(
            currentLocale: Localizations.localeOf(context).languageCode,
          ),
          ValueListenableBuilder(
            valueListenable: GetIt.I<AuthServiceInterface>().credentials,
            builder: (context, credentials, _) {
              if (credentials == null) {
                return ListTile(
                  title: Text(AppLocalizations.of(context).login),
                  onTap: () async {
                    await GetIt.I<AuthServiceInterface>().login();
                  },
                  leading: const Icon(Icons.login),
                );
              }
              return ListTile(
                iconColor: Theme.of(context).colorScheme.error,
                title: Text(
                  AppLocalizations.of(context).logout,
                  style: TextStyle(color: Theme.of(context).colorScheme.error),
                ),
                onTap: () async {
                  await GetIt.I<AuthServiceInterface>().logout();
                },
                leading: const Icon(Icons.logout),
              );
            },
          ),
        ],
      ),
    );
  }
}
