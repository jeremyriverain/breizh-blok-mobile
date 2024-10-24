import 'package:breizh_blok_mobile/blocs/boulder_order_bloc.dart';
import 'package:breizh_blok_mobile/components/bb_sort_button.dart';
import 'package:breizh_blok_mobile/models/order_choice.dart';
import 'package:breizh_blok_mobile/models/order_param.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BbBoulderListBuilderSortButton extends StatelessWidget {
  BbBoulderListBuilderSortButton({
    super.key,
  });

  final choices = [
    OrderChoice(
      label: 'Les plus récents',
      orderParam: const OrderParam(
        name: kIdOrderParam,
        direction: kDescendantDirection,
      ),
    ),
    OrderChoice(
      label: 'Les plus faciles',
      orderParam: const OrderParam(
        name: kGradeOrderParam,
        direction: kAscendantDirection,
      ),
    ),
    OrderChoice(
      label: 'Les plus difficiles',
      orderParam: const OrderParam(
        name: kGradeOrderParam,
        direction: kDescendantDirection,
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return BbSortButton(
      choices: choices,
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
