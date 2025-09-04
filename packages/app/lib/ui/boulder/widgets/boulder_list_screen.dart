import 'package:breizh_blok_mobile/ui/boulder/view_models/boulder_bloc.dart';
import 'package:breizh_blok_mobile/ui/boulder/view_models/boulder_filter_bloc.dart';
import 'package:breizh_blok_mobile/ui/boulder/view_models/boulder_filter_grade_bloc.dart';
import 'package:breizh_blok_mobile/ui/boulder/view_models/boulder_order_bloc.dart';
import 'package:breizh_blok_mobile/ui/boulder/widgets/boulder_list_app_bar.dart';
import 'package:breizh_blok_mobile/ui/core/widgets/boulder_list_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BoulderListScreen extends StatelessWidget {
  const BoulderListScreen({super.key});

  static const ({String name, String path}) route = (
    path: '/',
    name: 'boulder_list',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BoulderListAppBar(),
      body: BoulderListBuilder(
        onPageRequested: (int page) {
          final boulderFilterState = context.read<BoulderFilterBloc>().state;
          return BoulderRequested(
            page: page,
            boulderAreas: boulderFilterState.boulderAreas,
            term: boulderFilterState.term,
            orderParam: context.read<BoulderOrderBloc>().state,
            grades: context.read<BoulderFilterGradeBloc>().state.grades,
          );
        },
        boulderFilterBloc: context.read<BoulderFilterBloc>(),
      ),
    );
  }
}
