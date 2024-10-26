import 'package:breizh_blok_mobile/blocs/boulder_filter_grade_bloc.dart';
import 'package:breizh_blok_mobile/components/bb_boulder_list_builder_filter_modal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BbBoulderListBuilderFilterButton extends StatelessWidget {
  const BbBoulderListBuilderFilterButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BoulderFilterGradeBloc, BoulderFilterGradeState>(
      builder: (context, state) {
        final button = TextButton(
          key: const Key('boulder-list-filter-button'),
          child: Row(
            children: [
              const Icon(CupertinoIcons.line_horizontal_3_decrease),
              const SizedBox(
                width: 5,
              ),
              Text(AppLocalizations.of(context).filter),
            ],
          ),
          onPressed: () {
            showModalBottomSheet<void>(
              isScrollControlled: true,
              context: context,
              builder: (context) {
                return const FractionallySizedBox(
                  heightFactor: 0.5,
                  child: BbBoulderListBuilderFilterModal(),
                );
              },
            );
          },
        );

        if (state.grades.isEmpty) {
          return button;
        }

        return Badge(
          backgroundColor: Theme.of(context).colorScheme.primary,
          alignment: const Alignment(.95, -.65),
          smallSize: 10,
          child: button,
        );
      },
    );
  }
}
