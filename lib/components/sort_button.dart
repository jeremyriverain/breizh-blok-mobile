import 'package:breizh_blok_mobile/models/order_choice.dart';
import 'package:breizh_blok_mobile/models/order_param.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SortButton extends StatefulWidget {
  const SortButton({
    required this.choices,
    required this.onChanged,
    super.key,
    this.label = 'Afficher en 1er:',
    this.initialSelected,
  });

  final List<OrderChoice> choices;
  final void Function(OrderParam) onChanged;
  final String label;
  final OrderParam? initialSelected;

  @override
  State<SortButton> createState() => _SortButtonState();
}

class _SortButtonState extends State<SortButton> {
  OrderParam? _value;

  @override
  void initState() {
    _value = widget.initialSelected;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      key: const Key('sort-button'),
      child: const Row(
        children: [
          Icon(CupertinoIcons.sort_down),
          SizedBox(
            width: 5,
          ),
          Text('Trier'),
        ],
      ),
      onPressed: () {
        showDialog<void>(
          context: context,
          builder: (dialogContext) => AlertDialog(
            alignment: Alignment.topCenter,
            contentPadding: EdgeInsets.zero,
            title: Text(widget.label),
            content: Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  for (final orderChoice in widget.choices)
                    RadioListTile<OrderParam>(
                      value: orderChoice.orderParam,
                      groupValue: _value,
                      onChanged: (value) {
                        if (value == null) {
                          return;
                        }
                        setState(() {
                          _value = value;
                        });
                        widget.onChanged(value);
                        Navigator.of(context).pop();
                      },
                      title: Text(orderChoice.label),
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
