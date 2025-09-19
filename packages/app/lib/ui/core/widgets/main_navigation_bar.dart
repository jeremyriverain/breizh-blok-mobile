import 'package:breizh_blok_mobile/i18n/app_localizations.dart';
import 'package:breizh_blok_mobile/service_locator/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class MainNavigationBar extends StatelessWidget {
  const MainNavigationBar({required this.navigationShell, super.key});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final urlLauncher = ref.watch(urlLauncherProvider);
        return NavigationBar(
          selectedIndex: navigationShell.currentIndex,
          destinations: <Widget>[
            NavigationDestination(
              icon: const Icon(Icons.terrain),
              label: AppLocalizations.of(context).boulders,
            ),
            NavigationDestination(
              icon: const Icon(Icons.map),
              label: AppLocalizations.of(context).map,
            ),
            NavigationDestination(
              icon: const Icon(Icons.scatter_plot),
              label: AppLocalizations.of(context).areas,
            ),
            NavigationDestination(
              icon: const Icon(Icons.account_circle),
              label: AppLocalizations.of(context).myProfile,
            ),
            NavigationDestination(
              icon: const Icon(Icons.volunteer_activism),
              label: AppLocalizations.of(context).support,
            ),
          ],
          onDestinationSelected: (int index) {
            if (index == 4) {
              urlLauncher
                  .openUrl(
                    Uri.parse('https://buymeacoffee.com/breizhblok'),
                  )
                  .run();
              return;
            }
            navigationShell.goBranch(
              index,
              initialLocation: index == navigationShell.currentIndex,
            );
          },
        );
      },
    );
  }
}
