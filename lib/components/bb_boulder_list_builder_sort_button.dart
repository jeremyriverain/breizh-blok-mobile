import 'package:breizh_blok_mobile/blocs/boulder_order_bloc.dart';
import 'package:breizh_blok_mobile/components/bb_sort_button.dart';
import 'package:breizh_blok_mobile/models/order_choice.dart';
import 'package:breizh_blok_mobile/models/order_param.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BbBoulderListBuilderSortButton extends StatelessWidget {
  const BbBoulderListBuilderSortButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BbSortButton(
      choices: [
        OrderChoice(
          label: AppLocalizations.of(context).theMostRecent,
          orderParam: const OrderParam(
            name: kIdOrderParam,
            direction: kDescendantDirection,
          ),
        ),
        OrderChoice(
          label: AppLocalizations.of(context).theEasiest,
          orderParam: const OrderParam(
            name: kGradeOrderParam,
            direction: kAscendantDirection,
          ),
        ),
        OrderChoice(
          label: AppLocalizations.of(context).theHardest,
          orderParam: const OrderParam(
            name: kGradeOrderParam,
            direction: kDescendantDirection,
          ),
        ),
      ],
      onChanged: (value) => {
        context.read<BoulderOrderBloc>().add(
              BoulderOrderEvent(
                value,
              ),
            ),
      },
      initialSelected: context.read<BoulderOrderBloc>().state,
    );
  }
}
