import 'package:breizh_blok_mobile/domain/entities/grade/grade.dart';
import 'package:breizh_blok_mobile/i18n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'boulder_list_builder_filter_grade.g.dart';

class BoulderListBuilderFilterGrade extends StatelessWidget {
  const BoulderListBuilderFilterGrade({
    required this.allGrades,
    required this.selectedGrades,
    required this.onChangeEnd,
    super.key,
  });

  final List<Grade> allGrades;
  final Set<Grade> selectedGrades;
  final void Function(Set<Grade> selectedGrades) onChangeEnd;

  @override
  Widget build(BuildContext context) {
    if (allGrades.length < 2) {
      // defensive condition, if there is less than 2 grades,
      // then RangeSlider widget won't work
      return const SizedBox.shrink();
    }

    return Consumer(
      builder: (context, ref, _) {
        final notifier = ref.watch(
          _viewModelProvider(
            allGrades,
            selectedGrades,
          ).notifier,
        );

        final rangeValues = ref.watch(
          _viewModelProvider(
            allGrades,
            selectedGrades,
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
                          text: allGrades[(rangeValues.start as num).toInt()]
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
                          text:
                              allGrades[(rangeValues.end as num).toInt()].name,
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
                max: allGrades.length - 1,
                divisions: allGrades.length - 1,
                values: rangeValues,
                onChanged: notifier.onChanged,
                onChangeEnd: (values) {
                  onChangeEnd(notifier.fromRangeValuesToGrades(values));
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
  RangeValues build(List<Grade> allGrades, Set<Grade> grades) {
    final selectedGrades = grades.toList()
      ..sort((a, b) => a.name.compareTo(b.name));

    if (selectedGrades.isEmpty) {
      return RangeValues(
        0,
        (allGrades.length - 1).toDouble(),
      );
    } else {
      final startIndex = allGrades.indexWhere(
        (element) => element.iri == selectedGrades.first.iri,
      );
      final endIndex = allGrades.indexWhere(
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
          (allGrades.length - 1).toDouble(),
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
    if (startIndex != 0 || endIndex != allGrades.length - 1) {
      newValues = {
        ...allGrades.getRange(
          startIndex,
          endIndex + 1,
        ),
      };
    }
    return newValues;
  }
}
