import 'package:breizh_blok_mobile/blocs/boulder_filter_grade_bloc.dart';
import 'package:breizh_blok_mobile/models/collection_items.dart';
import 'package:breizh_blok_mobile/models/grade.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class BbBoulderListBuilderFilterGrade extends StatefulWidget {
  const BbBoulderListBuilderFilterGrade({
    required this.allGrades,
    super.key,
  });

  final CollectionItems<Grade> allGrades;

  @override
  State<BbBoulderListBuilderFilterGrade> createState() =>
      _BbBoulderListBuilderFilterGradeState();
}

class _BbBoulderListBuilderFilterGradeState
    extends State<BbBoulderListBuilderFilterGrade> {
  late SfRangeValues _currentRangeValues;

  @override
  void initState() {
    super.initState();
    final selectedGrades = context
        .read<BoulderFilterGradeBloc>()
        .state
        .grades
        .toList()
      ..sort((a, b) => a.name.compareTo(b.name));

    if (selectedGrades.isEmpty) {
      _currentRangeValues =
          SfRangeValues(0.0, (widget.allGrades.items.length - 1).toDouble());
    } else {
      final startIndex = widget.allGrades.items
          .indexWhere((element) => element.iri == selectedGrades.first.iri);
      final endIndex = widget.allGrades.items
          .indexWhere((element) => element.iri == selectedGrades.last.iri);
      if (startIndex != -1 && endIndex != -1) {
        _currentRangeValues =
            SfRangeValues(startIndex.toDouble(), endIndex.toDouble());
      } else {
        _currentRangeValues =
            SfRangeValues(0.0, (widget.allGrades.items.length - 1).toDouble());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.allGrades.totalItems < 2) {
      // defensive condition, if the API returns less than 2 grades,
      // then RangeSlider widget won't work
      return Container();
    }

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
                      text: widget
                          .allGrades
                          .items[(_currentRangeValues.start as num).toInt()]
                          .name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                key: const Key('boulder-list-grade-min'),
              ),
              Text.rich(
                TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: '${AppLocalizations.of(context).max}: ',
                    ),
                    TextSpan(
                      text: widget.allGrades
                          .items[(_currentRangeValues.end as num).toInt()].name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
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
          child: SfRangeSlider(
            values: _currentRangeValues,
            max: widget.allGrades.totalItems - 1,
            min: 0,
            interval: 1,
            stepSize: 1,
            showDividers: true,
            onChanged: (SfRangeValues values) {
              setState(() {
                _currentRangeValues = values;
              });
            },
            onChangeEnd: (SfRangeValues values) {
              if ([values.start, values.end] case [final num x, final num y]) {
                final startIndex = x.round();
                final endIndex = y.round();
                var newValues = <Grade>{};
                if (startIndex != 0 ||
                    endIndex != widget.allGrades.totalItems - 1) {
                  newValues = {
                    ...widget.allGrades.items
                        .getRange(startIndex, endIndex + 1),
                  };
                }

                context.read<BoulderFilterGradeBloc>().add(
                      BoulderFilterGradeEvent(
                        newValues,
                      ),
                    );
              } else {
                throw StateError(
                  'values.start and values.end should be number',
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
