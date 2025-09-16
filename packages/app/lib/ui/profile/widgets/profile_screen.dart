import 'package:breizh_blok_mobile/i18n/app_localizations.dart';
import 'package:breizh_blok_mobile/service_locator.dart';
import 'package:breizh_blok_mobile/ui/download/widgets/downloaded_boulder_areas_screen.dart';
import 'package:breizh_blok_mobile/ui/locale/widgets/locale_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
          Consumer(
            builder: (context, ref, child) {
              final auth = ref.watch(authProvider);

              return ValueListenableBuilder(
                valueListenable: auth.credentials,
                builder: (context, credentials, _) {
                  if (credentials == null) {
                    return ListTile(
                      title: Text(AppLocalizations.of(context).login),
                      onTap: () async {
                        await auth.login();
                      },
                      leading: const Icon(Icons.login),
                    );
                  }
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
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
