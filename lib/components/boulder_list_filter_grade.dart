import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:breizh_blok_mobile/models/collection_items.dart';
import 'package:breizh_blok_mobile/models/grade.dart';
import 'package:breizh_blok_mobile/blocs/boulder_filter_bloc.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class BoulderListFilterGrade extends StatefulWidget {
  const BoulderListFilterGrade({
    Key? key,
    required this.allGrades,
  }) : super(key: key);

  final CollectionItems<Grade> allGrades;

  @override
  State<BoulderListFilterGrade> createState() => _BoulderListFilterGradeState();
}

class _BoulderListFilterGradeState extends State<BoulderListFilterGrade> {
  late SfRangeValues _currentRangeValues;

  @override
  void initState() {
    super.initState();
    final List<Grade> selectedGrades =
        context.read<BoulderFilterBloc>().state.grades.toList();
    selectedGrades.sort((a, b) => a.name.compareTo(b.name));

    if (selectedGrades.isEmpty) {
      _currentRangeValues =
          SfRangeValues(0.0, (widget.allGrades.items.length - 1).toDouble());
    } else {
      final int startIndex = widget.allGrades.items
          .indexWhere((element) => element.iri == selectedGrades.first.iri);
      final int endIndex = widget.allGrades.items
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
      // defensive condition, if the API returns less than 2 grades, then RangeSlider widget won't work
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
                    const TextSpan(
                      text: 'Cotation min: ',
                    ),
                    TextSpan(
                      text: widget.allGrades
                          .items[_currentRangeValues.start.toInt()].name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
                key: const Key('boulder-list-grade-min'),
              ),
              Text.rich(
                TextSpan(
                  children: <TextSpan>[
                    const TextSpan(
                      text: 'max: ',
                    ),
                    TextSpan(
                      text: widget.allGrades
                          .items[_currentRangeValues.end.toInt()].name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    )
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
              interval: 1.0,
              stepSize: 1.0,
              showDividers: true,
              onChanged: (SfRangeValues values) {
                setState(() {
                  _currentRangeValues = values;
                });
              },
              onChangeEnd: (SfRangeValues values) {
                int startIndex = values.start.round();
                int endIndex = values.end.round();
                Set<Grade> newValues = {};
                if (startIndex != 0 ||
                    endIndex != widget.allGrades.totalItems - 1) {
                  newValues = {
                    ...widget.allGrades.items.getRange(startIndex, endIndex + 1)
                  };
                }

                context.read<BoulderFilterBloc>().add(BoulderFilterGrade(
                      newValues,
                    ));
              },
            )),
      ],
    );
  }
}
