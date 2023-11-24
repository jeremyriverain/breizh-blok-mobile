import 'package:breizh_blok_mobile/blocs/boulder_order_bloc.dart';
import 'package:breizh_blok_mobile/components/sort_button.dart';
import 'package:breizh_blok_mobile/models/order_choice.dart';
import 'package:breizh_blok_mobile/models/order_query_param.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SortBouldersButton extends StatelessWidget {
  SortBouldersButton({
    super.key,
  });

  final choices = [
    OrderChoice(
      label: 'Les plus récents',
      orderQueryParam: const OrderQueryParam(
        name: kIdOrderQueryParam,
        direction: kDescendantDirection,
      ),
    ),
    OrderChoice(
      label: 'Les plus faciles',
      orderQueryParam: const OrderQueryParam(
        name: kGradeOrderQueryParam,
        direction: kAscendantDirection,
      ),
    ),
    OrderChoice(
      label: 'Les plus difficiles',
      orderQueryParam: const OrderQueryParam(
        name: kGradeOrderQueryParam,
        direction: kDescendantDirection,
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SortButton(
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
