import 'package:breizh_blok_mobile/blocs/boulder_bloc.dart';
import 'package:breizh_blok_mobile/blocs/boulder_filter_bloc.dart';
import 'package:breizh_blok_mobile/blocs/boulder_filter_grade_bloc.dart';
import 'package:breizh_blok_mobile/blocs/boulder_order_bloc.dart';
import 'package:breizh_blok_mobile/blocs/terms_of_use_bloc.dart';
import 'package:breizh_blok_mobile/i18n/app_localizations.dart';
import 'package:breizh_blok_mobile/ui/boulder/widgets/boulder_list_app_bar.dart';
import 'package:breizh_blok_mobile/ui/core/widgets/boulder_list_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BoulderListScreen extends StatelessWidget {
  const BoulderListScreen({super.key});

  static const route = (path: '/', name: 'boulder_list');

  @override
  Widget build(BuildContext context) {
    return BlocListener<TermsOfUseBloc, bool?>(
      listener: (context, hasAcceptedTermsOfUse) async {
        if (hasAcceptedTermsOfUse != null && !hasAcceptedTermsOfUse) {
          await _showTermsOfUse(context);
        }
      },
      child: Scaffold(
        appBar: const BoulderListAppBar(),
        body: BoulderListBuilder(
          onPageRequested: (int page) {
            final boulderFilterState = context.read<BoulderFilterBloc>().state;
            return BoulderRequested(
              page: page,
              boulderAreas: boulderFilterState.boulderAreas,
              term: boulderFilterState.term,
              orderParam: context.read<BoulderOrderBloc>().state,
              grades: context.read<BoulderFilterGradeBloc>().state.grades,
            );
          },
          boulderFilterBloc: context.read<BoulderFilterBloc>(),
        ),
      ),
    );
  }

  Future<void> _showTermsOfUse(BuildContext context) async {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder:
          (BuildContext context) => AlertDialog.adaptive(
            key: const Key('terms-of-use'),
            title: FittedBox(
              fit: BoxFit.scaleDown,
              child: Row(
                children: [
                  Icon(
                    Icons.warning,
                    color: Theme.of(context).colorScheme.error,
                  ),
                  const SizedBox(width: 5),
                  Text(AppLocalizations.of(context).termsOfUse),
                ],
              ),
            ),
            content: Text(AppLocalizations.of(context).termsOfUseContent),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  context.read<TermsOfUseBloc>().add(TermsOfUseAccepted());
                  Navigator.pop(context);
                },
                child: Text(AppLocalizations.of(context).iAccept),
              ),
            ],
          ),
    );
  }
}
