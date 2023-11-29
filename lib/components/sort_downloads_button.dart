import 'package:breizh_blok_mobile/components/sort_button.dart';
import 'package:breizh_blok_mobile/models/order_choice.dart';
import 'package:breizh_blok_mobile/models/order_param.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SortDownloadsButton extends StatelessWidget {
  SortDownloadsButton({
    super.key,
  });

  void _onChanged(OrderParam orderParam) {
    //
  }

  final List<OrderChoice> choices = [
    OrderChoice(
      label: 'Téléchargés récemment',
      orderParam: const OrderParam(direction: 'bar', name: 'foo3'),
    ),
    OrderChoice(
      label: 'A - Z (secteur)',
      orderParam: const OrderParam(direction: 'bar', name: 'foo1'),
    ),
    OrderChoice(
      label: 'A - Z (commune)',
      orderParam: const OrderParam(direction: 'bar', name: 'foo2'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SortButton(
      choices: choices,
      onChanged: _onChanged,
      label: 'Trier par:',
    );
  }
}
