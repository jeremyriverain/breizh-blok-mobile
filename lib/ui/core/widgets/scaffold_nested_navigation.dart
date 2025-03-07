import 'package:breizh_blok_mobile/i18n/app_localizations.dart';
import 'package:breizh_blok_mobile/ui/core/view_models/terms_of_use_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ScaffoldWithNestedNavigation extends StatelessWidget {
  const ScaffoldWithNestedNavigation(this.navigationShell, {Key? key})
    : super(key: key ?? const ValueKey('ScaffoldWithNestedNavigation'));

  final StatefulNavigationShell navigationShell;

  void _goBranch(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    context.read<TermsOfUseBloc>().add(TermsOfUseAcceptanceRequested());
    return Scaffold(
      body: BlocListener<TermsOfUseBloc, bool?>(
        listenWhen: (previous, current) => current == null || !current,
        listener: (context, state) {
          if (state != true) {
            showDialog<void>(
              barrierDismissible: false,
              context: context,
              builder:
                  (BuildContext context) => AlertDialog.adaptive(
                    key: const Key('terms-of-use'),
                    title: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Row(
                        children: [
                          Icon(
                            Icons.warning,
                            color: Theme.of(context).colorScheme.error,
                          ),
                          const SizedBox(width: 5),
                          Text(AppLocalizations.of(context).termsOfUse),
                        ],
                      ),
                    ),
                    content: Text(
                      AppLocalizations.of(context).termsOfUseContent,
                    ),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          context.read<TermsOfUseBloc>().add(
                            TermsOfUseAccepted(),
                          );
                          GoRouter.of(context).pop();
                        },
                        child: Text(AppLocalizations.of(context).iAccept),
                      ),
                    ],
                  ),
            );
          }
        },
        child: navigationShell,
      ),

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
