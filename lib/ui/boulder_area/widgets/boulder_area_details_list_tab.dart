import 'package:breizh_blok_mobile/blocs/boulder_bloc.dart';
import 'package:breizh_blok_mobile/blocs/boulder_filter_bloc.dart';
import 'package:breizh_blok_mobile/blocs/boulder_filter_grade_bloc.dart';
import 'package:breizh_blok_mobile/blocs/boulder_order_bloc.dart';
import 'package:breizh_blok_mobile/data/data_sources/api/model/request_strategy.dart';
import 'package:breizh_blok_mobile/domain/models/boulder_area/boulder_area.dart';
import 'package:breizh_blok_mobile/ui/core/widgets/boulder_list_builder.dart';
import 'package:breizh_blok_mobile/ui/core/widgets/downloads_area_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BoulderAreaDetailsListTab extends StatefulWidget {
  const BoulderAreaDetailsListTab({required this.boulderArea, super.key});

  final BoulderArea boulderArea;

  @override
  State<BoulderAreaDetailsListTab> createState() =>
      _BoulderAreaDetailsListTabState();
}

class _BoulderAreaDetailsListTabState extends State<BoulderAreaDetailsListTab>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BoulderListBuilder(
      boulderFilterBloc: context.read<BoulderFilterBloc>(),
      onPageRequested: (int page) {
        final orderBlocState = context.read<BoulderOrderBloc>().state;
        final grades = context.read<BoulderFilterGradeBloc>().state.grades;

        if (context.read<RequestStrategy>().offlineFirst) {
          return DbBouldersRequested(
            boulderArea: widget.boulderArea,
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
      bottomHeaderWidget: DownloadsAreaButton(boulderArea: widget.boulderArea),
      showLocationinfo: false,
    );
  }

  @override
  bool get wantKeepAlive => true;
}
