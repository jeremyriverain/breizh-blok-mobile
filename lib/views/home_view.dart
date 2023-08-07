import 'package:breizh_blok_mobile/blocs/boulder_filter_bloc.dart';
import 'package:breizh_blok_mobile/blocs/boulder_marker_bloc.dart';
import 'package:breizh_blok_mobile/components/lazy_indexed_stack.dart';
import 'package:breizh_blok_mobile/views/home_municipalities_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:breizh_blok_mobile/components/boulder_list_builder.dart';
import 'package:breizh_blok_mobile/components/boulder_list_app_bar.dart';
import 'package:breizh_blok_mobile/blocs/tab_bloc.dart';
import 'package:breizh_blok_mobile/views/home_map_view.dart';
import 'package:breizh_blok_mobile/blocs/boulder_bloc.dart';
import 'package:breizh_blok_mobile/blocs/terms_of_use_bloc.dart';
import 'package:breizh_blok_mobile/utils/terms_of_use_prompt.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<TermsOfUseBloc, bool?>(
      listener: (context, hasAcceptedTermsOfUse) async {
        if (hasAcceptedTermsOfUse != null && !hasAcceptedTermsOfUse) {
          await TermsOfUsePrompt.showTermsOfUse(context);
        }
      },
      child: BlocBuilder<TabBloc, int>(
        builder: (context, state) {
          final int currentIndex = state;
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
                    title: const Text(
                  'Communes répertoriées',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                )),
              (_) => null
            },
            body: LazyIndexedStack(index: currentIndex, children: [
              BoulderListBuilder(
                onPageRequested: (int page) => BoulderListViewRequested(
                  page: page,
                  filterState: context.read<BoulderFilterBloc>().state,
                ),
              ),
              const HomeMapView(),
              const HomeMunicipalitiesView(),
            ]),
            bottomNavigationBar: BottomNavigationBar(
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.list_bullet), label: 'Liste'),
                BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.map_pin_ellipse),
                  label: 'Carte',
                ),
                BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.rectangle_on_rectangle),
                  label: 'Index',
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
}
