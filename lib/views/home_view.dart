import 'package:breizh_blok_mobile/blocs/boulder_bloc.dart';
import 'package:breizh_blok_mobile/blocs/boulder_filter_bloc.dart';
import 'package:breizh_blok_mobile/blocs/boulder_filter_grade_bloc.dart';
import 'package:breizh_blok_mobile/blocs/boulder_marker_bloc.dart';
import 'package:breizh_blok_mobile/blocs/boulder_order_bloc.dart';
import 'package:breizh_blok_mobile/blocs/tab_bloc.dart';
import 'package:breizh_blok_mobile/blocs/terms_of_use_bloc.dart';
import 'package:breizh_blok_mobile/components/boulder_list_app_bar.dart';
import 'package:breizh_blok_mobile/components/boulder_list_builder.dart';
import 'package:breizh_blok_mobile/components/lazy_indexed_stack.dart';
import 'package:breizh_blok_mobile/database/app_database.dart';
import 'package:breizh_blok_mobile/views/download_view.dart';
import 'package:breizh_blok_mobile/views/home_map_view.dart';
import 'package:breizh_blok_mobile/views/home_municipalities_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({
    required this.database,
    super.key,
  });

  final AppDatabase database;

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
                    orderQueryParam: context.read<BoulderOrderBloc>().state,
                  ),
                );
          }

          return Scaffold(
            appBar: switch (currentIndex) {
              0 => const BoulderListAppBar(),
              2 => AppBar(
                  title: const Text(
                    'Communes répertoriées',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              3 => AppBar(
                  title: const Text(
                    'Secteurs téléchargés',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              (_) => null
            },
            body: LazyIndexedStack(
              index: currentIndex,
              children: [
                BoulderListBuilder(
                  onPageRequested: (int page) => BoulderListViewRequested(
                    page: page,
                    filterState: context.read<BoulderFilterBloc>().state,
                    orderQueryParam: context.read<BoulderOrderBloc>().state,
                    grades: context.read<BoulderFilterGradeBloc>().state.grades,
                  ),
                  boulderFilterBloc: context.read<BoulderFilterBloc>(),
                ),
                const HomeMapView(),
                const HomeMunicipalitiesView(),
                DownloadView(
                  database: database,
                ),
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.list_bullet),
                  label: 'Liste',
                ),
                BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.map_pin_ellipse),
                  label: 'Carte',
                ),
                BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.rectangle_on_rectangle),
                  label: 'Index',
                ),
                BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.download_circle),
                  label: 'Téléchargements',
                ),
              ],
              onTap: (index) =>
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
      builder: (BuildContext context) => AlertDialog.adaptive(
        key: const Key('terms-of-use'),
        title: FittedBox(
          fit: BoxFit.scaleDown,
          child: Row(
            children: [
              Icon(
                Icons.warning,
                color: Theme.of(context).colorScheme.error,
              ),
              const SizedBox(
                width: 5,
              ),
              const Text(
                "Conditions d'utilisation",
              ),
            ],
          ),
        ),
        content: const Text(
          // ignore: lines_longer_than_80_chars
          "L'escalade est un sport à risque. Sa pratique est sous l'entière responsabilité des pratiquants. Breizh Blok décline toute responsabilité en cas d'accident.",
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              context.read<TermsOfUseBloc>().add(TermsOfUseAccepted());
              Navigator.pop(context);
            },
            child: const Text("J'accepte"),
          ),
        ],
      ),
    );
  }
}
