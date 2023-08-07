import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import 'package:breizh_blok_mobile/blocs/boulder_filter_bloc.dart';

class BoulderListAppBarSearchField extends StatefulWidget {
  const BoulderListAppBarSearchField({Key? key}) : super(key: key);

  @override
  State<BoulderListAppBarSearchField> createState() =>
      _BoulderListAppBarSearchFieldState();
}

class _BoulderListAppBarSearchFieldState
    extends State<BoulderListAppBarSearchField> {
  late TextEditingController _controller;

  bool showCancelIcon = false;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _controller.addListener(() {
      setState(() {
        if (_controller.text.isNotEmpty) {
          showCancelIcon = true;
        } else {
          showCancelIcon = false;
        }
      });
    });
  }

  @override
  void didChangeDependencies() {
    _controller.text =
        BlocProvider.of<BoulderFilterBloc>(context).state.term ?? '';
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      key: const Key('search-boulders'),
      controller: _controller,
      autocorrect: false,
      onSubmitted: (String val) {
        context.read<BoulderFilterBloc>().add(BoulderFilterSearched(val));
      },
      decoration: InputDecoration(
        hintText: 'Rechercher bloc, secteur, commune',
        suffixIcon: showCancelIcon
            ? IconButton(
                tooltip: 'Effacer la saisie',
                icon: const Icon(
                  Icons.cancel,
                ),
                onPressed: () {
                  _controller.text = '';
                  context
                      .read<BoulderFilterBloc>()
                      .add(BoulderFilterSearched(''));
                },
              )
            : null,
        border: InputBorder.none,
        filled: true,
      ),
    );
  }
}
