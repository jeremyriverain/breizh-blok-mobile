import 'package:breizh_blok_mobile/ui/core/widgets/main_navigation_bar.dart';
import 'package:breizh_blok_mobile/ui/terms_of_use/widgets/terms_of_use_dialog.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScaffoldNestedNavigation extends StatelessWidget {
  const ScaffoldNestedNavigation(this.navigationShell, {Key? key})
    : super(key: key ?? const ValueKey('ScaffoldWithNestedNavigation'));

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TermsOfUseDialog(child: navigationShell),
      bottomNavigationBar: MainNavigationBar(
        navigationShell: navigationShell,
      ),
    );
  }
}
