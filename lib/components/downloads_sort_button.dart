import 'package:breizh_blok_mobile/components/bb_sort_button.dart';
import 'package:breizh_blok_mobile/models/order_choice.dart';
import 'package:breizh_blok_mobile/models/order_param.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DownloadsSortButton extends StatelessWidget {
  DownloadsSortButton({
    required this.onChanged,
    required this.initialSelected,
    super.key,
  }) : choices = [
          OrderChoice(
            label: 'Téléchargés récemment',
            orderParam: initialSelected,
          ),
          OrderChoice(
            label: 'A - Z (secteur)',
            orderParam: const OrderParam(
              direction: kAscendantDirection,
              name: 'boulderAreaName',
            ),
          ),
          OrderChoice(
            label: 'A - Z (commune)',
            orderParam: const OrderParam(
              direction: kAscendantDirection,
              name: 'municipalityName',
            ),
          ),
        ];

  final void Function(OrderParam orderParam) onChanged;

  final OrderParam initialSelected;
  final List<OrderChoice> choices;

  @override
  Widget build(BuildContext context) {
    return BbSortButton(
      choices: choices,
      initialSelected: initialSelected,
      onChanged: onChanged,
      label: 'Trier par:',
    );
  }
}
