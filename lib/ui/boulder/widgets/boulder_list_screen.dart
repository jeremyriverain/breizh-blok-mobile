import 'package:breizh_blok_mobile/blocs/boulder_bloc.dart';
import 'package:breizh_blok_mobile/blocs/boulder_filter_bloc.dart';
import 'package:breizh_blok_mobile/blocs/boulder_filter_grade_bloc.dart';
import 'package:breizh_blok_mobile/blocs/boulder_marker_bloc.dart';
import 'package:breizh_blok_mobile/blocs/boulder_order_bloc.dart';
import 'package:breizh_blok_mobile/blocs/tab_bloc.dart';
import 'package:breizh_blok_mobile/blocs/terms_of_use_bloc.dart';
import 'package:breizh_blok_mobile/i18n/app_localizations.dart';
import 'package:breizh_blok_mobile/ui/boulder/widgets/boulder_list_app_bar.dart';
import 'package:breizh_blok_mobile/ui/core/widgets/boulder_list_builder.dart';
import 'package:breizh_blok_mobile/ui/core/widgets/lazy_indexed_stack.dart';
import 'package:breizh_blok_mobile/ui/map/widgets/map_screen.dart';
import 'package:breizh_blok_mobile/ui/municipality/widgets/municipality_list_screen.dart';
import 'package:breizh_blok_mobile/ui/profile/widgets/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BoulderListScreen extends StatelessWidget {
  const BoulderListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<TermsOfUseBloc, bool?>(
      listener: (context, hasAcceptedTermsOfUse) async {
        if (hasAcceptedTermsOfUse != null && !hasAcceptedTermsOfUse) {
          await _showTermsOfUse(context);
        }
      },
      child: BlocBuilder<TabBloc, int>(
        builder: (context, state) {
          final currentIndex = state;
          context.read<TermsOfUseBloc>().add(TermsOfUseAcceptanceRequested());
          if (context.read<BoulderMarkerBloc>().state.markers.isEmpty &&
              currentIndex == 0) {
            context.read<BoulderMarkerBloc>().add(
              BoulderMarkerRequested(
                filterState: context.read<BoulderFilterBloc>().state,
              ),
            );
          }

          return Scaffold(
            appBar: switch (currentIndex) {
              0 => const BoulderListAppBar(),
              2 => AppBar(
                title: Text(
                  AppLocalizations.of(context).municipalities,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              3 => AppBar(
                title: Text(
                  AppLocalizations.of(context).myProfile,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              (_) => null,
            },
            body: LazyIndexedStack(
              index: currentIndex,
              children: [
                BoulderListBuilder(
                  onPageRequested: (int page) {
                    final boulderFilterState =
                        context.read<BoulderFilterBloc>().state;
                    return BoulderRequested(
                      page: page,
                      boulderAreas: boulderFilterState.boulderAreas,
                      term: boulderFilterState.term,
                      orderParam: context.read<BoulderOrderBloc>().state,
                      grades:
                          context.read<BoulderFilterGradeBloc>().state.grades,
                    );
                  },
                  boulderFilterBloc: context.read<BoulderFilterBloc>(),
                ),
                const MapScreen(),
                const MunicipalityListScreen(),
                const ProfileScreen(),
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: const Icon(Icons.terrain),
                  label: AppLocalizations.of(context).boulders,
                ),
                BottomNavigationBarItem(
                  icon: const Icon(Icons.map),
                  label: AppLocalizations.of(context).map,
                ),
                BottomNavigationBarItem(
                  icon: const Icon(Icons.scatter_plot),
                  label: AppLocalizations.of(context).areas,
                ),
                BottomNavigationBarItem(
                  icon: const Icon(Icons.account_circle),
                  label: AppLocalizations.of(context).myProfile,
                ),
              ],
              onTap:
                  (index) =>
                      context.read<TabBloc>().add(TabUpdated(activeTab: index)),
              currentIndex: currentIndex,
            ),
          );
        },
      ),
    );
  }

  Future<void> _showTermsOfUse(BuildContext context) async {
    return showDialog(
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
            content: Text(AppLocalizations.of(context).termsOfUseContent),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  context.read<TermsOfUseBloc>().add(TermsOfUseAccepted());
                  Navigator.pop(context);
                },
                child: Text(AppLocalizations.of(context).iAccept),
              ),
            ],
          ),
    );
  }
}
