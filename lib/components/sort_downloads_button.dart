import 'package:breizh_blok_mobile/components/sort_button.dart';
import 'package:breizh_blok_mobile/models/order_choice.dart';
import 'package:breizh_blok_mobile/models/order_query_param.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SortDownloadsButton extends StatelessWidget {
  SortDownloadsButton({
    super.key,
  });

  void _onChanged(OrderQueryParam orderQueryParam) {
    //
  }

  final List<OrderChoice> choices = [
    OrderChoice(
      label: 'Téléchargés récemment',
      orderQueryParam: const OrderQueryParam(direction: 'bar', name: 'foo3'),
    ),
    OrderChoice(
      label: 'A - Z (secteur)',
      orderQueryParam: const OrderQueryParam(direction: 'bar', name: 'foo1'),
    ),
    OrderChoice(
      label: 'A - Z (commune)',
      orderQueryParam: const OrderQueryParam(direction: 'bar', name: 'foo2'),
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
