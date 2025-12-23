import 'package:breizh_blok_mobile/i18n/app_localizations.dart';
import 'package:breizh_blok_mobile/service_locator/service_locator.dart';
import 'package:breizh_blok_mobile/ui/core/widgets/auth_builder.dart';
import 'package:breizh_blok_mobile/ui/core/widgets/clickable_list_tile.dart';
import 'package:breizh_blok_mobile/ui/core/widgets/user_builder.dart';
import 'package:breizh_blok_mobile/ui/download/widgets/downloaded_boulder_areas_screen.dart';
import 'package:breizh_blok_mobile/ui/locale/widgets/locale_switch.dart';
import 'package:breizh_blok_mobile/ui/profile/widgets/profile_ambassador_avatar.dart';
import 'package:breizh_blok_mobile/ui/profile/widgets/profile_user_avatar.dart';
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
        actions: [
          UserBuilder(
            builder: (context, user) {
              if (user == null) {
                return const SizedBox.shrink();
              }

              final icon = user.isAmbassador
                  ? const ProfileAmbassadorAvatar()
                  : const ProfileUserAvatar();

              return Padding(
                padding: const EdgeInsets.only(right: 8),
                child: icon,
              );
            },
          ),
        ],
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
                return Consumer(
                  builder: (context, ref, _) {
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
                        ref.invalidate(userProvider);
                      },
                      leading: const Icon(Icons.logout),
                    );
                  },
                );
              }
              return Consumer(
                builder: (context, ref, _) {
                  return ListTile(
                    title: Text(AppLocalizations.of(context).login),
                    onTap: () async {
                      await auth.login();
                      ref.invalidate(userProvider);
                    },
                    leading: const Icon(Icons.login),
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
