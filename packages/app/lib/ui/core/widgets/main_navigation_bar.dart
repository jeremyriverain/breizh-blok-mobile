import 'package:breizh_blok_mobile/i18n/app_localizations.dart';
import 'package:breizh_blok_url_launcher/breizh_blok_url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

class MainNavigationBar extends StatelessWidget {
  const MainNavigationBar({required this.navigationShell, super.key});

  final StatefulNavigationShell navigationShell;

  void _goBranch(int index) {
    if (index == 4) {
      GetIt.I<UrlLauncher>()
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
  }

  @override
  Widget build(BuildContext context) {
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
      onDestinationSelected: _goBranch,
    );
  }
}
