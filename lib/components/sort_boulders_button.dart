import 'package:breizh_blok_mobile/blocs/boulder_filter_bloc.dart';
import 'package:breizh_blok_mobile/models/order_query_param.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum OrderChoice {
  mostRecentFirst(
    label: 'Les plus récents',
    orderQueryParam: OrderQueryParam(
      name: 'order[id]',
      direction: 'desc',
    ),
  ),
  easiestFirst(
    label: 'Les plus faciles',
    orderQueryParam: OrderQueryParam(
      name: 'order[grade.name]',
      direction: 'asc',
    ),
  ),
  hardestFirst(
    label: 'Les plus difficiles',
    orderQueryParam: OrderQueryParam(
      name: 'order[grade.name]',
      direction: 'desc',
    ),
  );

  const OrderChoice({
    required this.label,
    required this.orderQueryParam,
  });

  final String label;
  final OrderQueryParam orderQueryParam;
}

class SortBouldersButton extends StatelessWidget {
  const SortBouldersButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      key: const Key('boulder-list-sort-button'),
      child: const Row(
        children: [
          Icon(CupertinoIcons.sort_down),
          SizedBox(
            width: 5,
          ),
          Text('Trier')
        ],
      ),
      onPressed: () {
        showDialog(
          context: context,
          builder: (dialogContext) => BlocProvider.value(
            value: BlocProvider.of<BoulderFilterBloc>(context),
            child: AlertDialog(
              alignment: Alignment.topCenter,
              contentPadding: EdgeInsets.zero,
              title: const Text("Afficher en 1er:"),
              content: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: BlocBuilder<BoulderFilterBloc, BoulderFilterState>(
                  buildWhen: (previousValue, value) {
                    return previousValue.order != value.order;
                  },
                  builder: (context, state) {
                    OrderQueryParam groupValue = state.order;

                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        for (var orderChoice in OrderChoice.values)
                          RadioListTile<OrderQueryParam>(
                            value: orderChoice.orderQueryParam,
                            groupValue: groupValue,
                            onChanged: (value) {
                              if (value == null) {
                                return;
                              }
                              context.read<BoulderFilterBloc>().add(
                                    BoulderFilterOrder(
                                      orderChoice.orderQueryParam,
                                    ),
                                  );
                              Navigator.of(context).pop();
                            },
                            title: Text(orderChoice.label),
                          ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
