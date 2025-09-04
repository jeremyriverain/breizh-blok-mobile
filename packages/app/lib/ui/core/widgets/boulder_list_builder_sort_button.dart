import 'package:breizh_blok_mobile/data/data_sources/api/model/api_order_choice.dart';
import 'package:breizh_blok_mobile/data/data_sources/api/model/api_order_param.dart';
import 'package:breizh_blok_mobile/i18n/app_localizations.dart';
import 'package:breizh_blok_mobile/ui/boulder/view_models/boulder_order_bloc.dart';
import 'package:breizh_blok_mobile/ui/core/widgets/sort_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BoulderListBuilderSortButton extends StatelessWidget {
  const BoulderListBuilderSortButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SortButton(
      choices: [
        ApiOrderChoice(
          label: AppLocalizations.of(context).theMostRecent,
          orderParam: const ApiOrderParam(
            name: kIdOrderParam,
            direction: kDescendantDirection,
          ),
        ),
        ApiOrderChoice(
          label: AppLocalizations.of(context).theEasiest,
          orderParam: const ApiOrderParam(
            name: kGradeOrderParam,
            direction: kAscendantDirection,
          ),
        ),
        ApiOrderChoice(
          label: AppLocalizations.of(context).theHardest,
          orderParam: const ApiOrderParam(
            name: kGradeOrderParam,
            direction: kDescendantDirection,
          ),
        ),
      ],
      onChanged: (value) => {
        context.read<BoulderOrderBloc>().add(BoulderOrderEvent(value)),
      },
      initialSelected: context.read<BoulderOrderBloc>().state,
    );
  }
}
