import 'package:breizh_blok_mobile/data/data_sources/api/model/api_order_choice.dart';
import 'package:breizh_blok_mobile/data/data_sources/api/model/api_order_param.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SortButton extends StatefulWidget {
  const SortButton({
    required this.choices,
    required this.onChanged,
    super.key,
    this.label = 'Afficher en 1er:',
    this.initialSelected,
  });

  final List<ApiOrderChoice> choices;
  final void Function(ApiOrderParam) onChanged;
  final String label;
  final ApiOrderParam? initialSelected;

  @override
  State<SortButton> createState() => _SortButtonState();
}

class _SortButtonState extends State<SortButton> {
  ApiOrderParam? _value;

  @override
  void initState() {
    _value = widget.initialSelected;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      key: const Key('sort-button'),
      child: Row(
        children: [
          const Icon(CupertinoIcons.sort_down),
          const SizedBox(
            width: 5,
          ),
          Text(AppLocalizations.of(context).sort),
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
                    RadioListTile<ApiOrderParam>(
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
