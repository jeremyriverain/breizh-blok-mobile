import 'package:breizh_blok_mobile/blocs/boulder_filter_grade_bloc.dart';
import 'package:breizh_blok_mobile/components/boulder_list_filter_modal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FilterBouldersButton extends StatelessWidget {
  const FilterBouldersButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BoulderFilterGradeBloc, BoulderFilterGradeState>(
      builder: (context, state) {
        final button = TextButton(
          key: const Key('boulder-list-filter-button'),
          child: const Row(
            children: [
              Icon(CupertinoIcons.line_horizontal_3_decrease),
              SizedBox(
                width: 5,
              ),
              Text('Filtrer'),
            ],
          ),
          onPressed: () {
            showModalBottomSheet<void>(
              isScrollControlled: true,
              context: context,
              builder: (context) {
                return FractionallySizedBox(
                  heightFactor: 0.5,
                  child: BoulderListFilterModal(),
                );
              },
            );
          },
        );

        if (state.grades.isEmpty) {
          return button;
        }

        return Badge(
          alignment: const Alignment(.95, -.65),
          smallSize: 10,
          child: button,
        );
      },
    );
  }
}
