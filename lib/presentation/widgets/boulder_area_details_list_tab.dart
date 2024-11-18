import 'package:breizh_blok_mobile/blocs/boulder_bloc.dart';
import 'package:breizh_blok_mobile/blocs/boulder_filter_bloc.dart';
import 'package:breizh_blok_mobile/blocs/boulder_filter_grade_bloc.dart';
import 'package:breizh_blok_mobile/blocs/boulder_order_bloc.dart';
import 'package:breizh_blok_mobile/models/boulder_area.dart';
import 'package:breizh_blok_mobile/models/request_strategy.dart';
import 'package:breizh_blok_mobile/presentation/widgets/bb_boulder_list_builder.dart';
import 'package:breizh_blok_mobile/presentation/widgets/downloads_area_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BoulderAreaDetailsListTab extends StatelessWidget {
  const BoulderAreaDetailsListTab({
    required this.boulderArea,
    super.key,
  });

  final BoulderArea boulderArea;

  @override
  Widget build(BuildContext context) {
    return BbBoulderListBuilder(
      boulderFilterBloc: context.read<BoulderFilterBloc>(),
      onPageRequested: (int page) {
        final orderBlocState = context.read<BoulderOrderBloc>().state;
        final grades = context.read<BoulderFilterGradeBloc>().state.grades;

        if (context.read<RequestStrategy>().offlineFirst) {
          return DbBouldersRequested(
            boulderArea: boulderArea,
            orderParam: orderBlocState,
            grades: grades,
          );
        }

        final boulderFilterState = context.read<BoulderFilterBloc>().state;
        return BoulderRequested(
          page: page,
          term: boulderFilterState.term,
          boulderAreas: boulderFilterState.boulderAreas,
          orderParam: orderBlocState,
          grades: grades,
        );
      },
      bottomHeaderWidget: DownloadsAreaButton(
        boulderArea: boulderArea,
      ),
      showLocationinfo: false,
    );
  }
}