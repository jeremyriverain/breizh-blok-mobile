import 'package:breizh_blok_mobile/data/data_sources/remote/model/paginated_collection.dart';
import 'package:breizh_blok_mobile/domain/entities/grade/grade.dart';
import 'package:breizh_blok_mobile/i18n/app_localizations.dart';
import 'package:breizh_blok_mobile/ui/boulder/view_models/boulder_filter_grade_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'boulder_list_builder_filter_grade.g.dart';

class BoulderListBuilderFilterGrade extends StatelessWidget {
  const BoulderListBuilderFilterGrade({required this.allGrades, super.key});

  final PaginatedCollection<Grade> allGrades;

  @override
  Widget build(BuildContext context) {
    if (allGrades.totalItems < 2) {
      // defensive condition, if the API returns less than 2 grades,
      // then RangeSlider widget won't work
      return Container();
    }

    return Consumer(
      builder: (context, ref, _) {
        final notifier = ref.watch(
          _viewModelProvider(
            allGrades,
            context.read<BoulderFilterGradeBloc>().state.grades,
          ).notifier,
        );

        final rangeValues = ref.watch(
          _viewModelProvider(
            allGrades,
            context.read<BoulderFilterGradeBloc>().state.grades,
          ),
        );
        return Column(
          children: [
            ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text.rich(
                    TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: '${AppLocalizations.of(context).minGrade}: ',
                        ),
                        TextSpan(
                          text: allGrades
                              .items[(rangeValues.start as num).toInt()]
                              .name,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    key: const Key('boulder-list-grade-min'),
                  ),
                  Text.rich(
                    TextSpan(
                      children: <TextSpan>[
                        TextSpan(text: '${AppLocalizations.of(context).max}: '),
                        TextSpan(
                          text: allGrades
                              .items[(rangeValues.end as num).toInt()]
                              .name,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    key: const Key('boulder-list-grade-max'),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
              child: RangeSlider(
                max: allGrades.totalItems - 1,
                divisions: allGrades.totalItems - 1,
                values: rangeValues,
                onChanged: notifier.onChanged,
                onChangeEnd: (values) {
                  context.read<BoulderFilterGradeBloc>().add(
                    BoulderFilterGradeEvent(
                      notifier.fromRangeValuesToGrades(values),
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}

@riverpod
class _ViewModel extends _$ViewModel {
  @override
  RangeValues build(PaginatedCollection<Grade> allGrades, Set<Grade> grades) {
    final selectedGrades = grades.toList()
      ..sort((a, b) => a.name.compareTo(b.name));

    if (selectedGrades.isEmpty) {
      return RangeValues(
        0,
        (allGrades.items.length - 1).toDouble(),
      );
    } else {
      final startIndex = allGrades.items.indexWhere(
        (element) => element.iri == selectedGrades.first.iri,
      );
      final endIndex = allGrades.items.indexWhere(
        (element) => element.iri == selectedGrades.last.iri,
      );
      if (startIndex != -1 && endIndex != -1) {
        return RangeValues(
          startIndex.toDouble(),
          endIndex.toDouble(),
        );
      } else {
        return RangeValues(
          0,
          (allGrades.items.length - 1).toDouble(),
        );
      }
    }
  }

  // ignore: use_setters_to_change_properties
  void onChanged(RangeValues values) {
    state = values;
  }

  Set<Grade> fromRangeValuesToGrades(RangeValues values) {
    final startIndex = values.start.round();
    final endIndex = values.end.round();
    var newValues = <Grade>{};
    if (startIndex != 0 || endIndex != allGrades.totalItems - 1) {
      newValues = {
        ...allGrades.items.getRange(
          startIndex,
          endIndex + 1,
        ),
      };
    }
    return newValues;
  }
}
