import 'package:breizh_blok_mobile/i18n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScaffoldWithNestedNavigation extends StatelessWidget {
  const ScaffoldWithNestedNavigation(this.navigationShell, {Key? key})
    : super(key: key ?? const ValueKey('ScaffoldWithNestedNavigation'));

  final StatefulNavigationShell navigationShell;

  void _goBranch(int index) {
    navigationShell.goBranch(index, initialLocation: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
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
        ],
        onDestinationSelected: _goBranch,
      ),
    );
  }
}
