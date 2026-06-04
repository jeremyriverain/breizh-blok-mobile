import 'package:breizh_blok_mobile/data/data_sources/remote/model/paginated_collection.dart';
import 'package:breizh_blok_mobile/data/repositories/grade/grade_repository_legacy.dart';
import 'package:breizh_blok_mobile/domain/entities/grade/grade.dart';
import 'package:breizh_blok_mobile/i18n/app_localizations.dart';
import 'package:breizh_blok_mobile/ui/boulder/view_models/boulder_filter_grade_bloc.dart';
import 'package:breizh_blok_mobile/ui/core/widgets/my_range_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BoulderListBuilderFilterGrade extends StatelessWidget {
  const BoulderListBuilderFilterGrade({
    super.key,
  });

  Future<PaginatedCollection<Grade>> _fetch(BuildContext context) {
    return context.read<GradeRepositoryLegacy>().findAll();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _fetch(context),
      builder:
          (
            context,
            snapshot,
          ) {
            final data = snapshot.data;

            if (data != null && data.totalItems > 1) {
              return Column(
                children: [
                  Text(
                    AppLocalizations.of(context).grade,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  MyRangeSlider<Grade>(
                    allValues: data.items
                        .map((d) => RangeEntry(name: d.name, value: d))
                        .toList(),
                    selectedValues: context
                        .watch<BoulderFilterGradeBloc>()
                        .state
                        .grades
                        .map((g) => RangeEntry(name: g.name, value: g))
                        .toSet(),
                    onChangeEnd: (selectedGrades) {
                      context.read<BoulderFilterGradeBloc>().add(
                        BoulderFilterGradeEvent(
                          selectedGrades.map((r) => r.value).toSet(),
                        ),
                      );
                    },
                  ),
                ],
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
    );
  }
}
