import 'package:breizh_blok_mobile/domain/entities/boulder/boulder.dart';
import 'package:breizh_blok_mobile/i18n/app_localizations.dart';
import 'package:breizh_blok_mobile/ui/boulder/contribute_boulder_form.dart';
import 'package:breizh_blok_mobile/ui/boulder/view_models/contribute_boulder_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:reactive_forms/reactive_forms.dart';

class ContributeBoulderFormView extends StatelessWidget {
  const ContributeBoulderFormView({required this.boulder, super.key});

  final Boulder boulder;

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    return BlocConsumer<ContributeBoulderViewModel, ContributeBoulderState>(
      listener: (BuildContext context, ContributeBoulderState state) {
        if (state.done) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(localizations.yourMessageHasBeenSent)),
          );
          context.pop();
          return;
        }
        if (state.error) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(localizations.anErrorOccured)));
        }
      },
      builder: (context, state) {
        return ReactiveForm(
          formGroup: state.form,
          child: AlertDialog(
            title: Text('${localizations.contributeTo}\n "${boulder.name}"'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ReactiveTextField<String>(
                  key: Key(ContributeBoulderForm.formKeys.message),
                  formControlName: ContributeBoulderForm.formKeys.message,
                  minLines: 4,
                  maxLines: 4,
                  decoration: InputDecoration(
                    labelText:
                        '${localizations.comments} / ${localizations.suggestions}',
                    alignLabelWithHint: true,
                  ),
                ),
              ],
            ),
            actions: [
              if (state.pending)
                const SizedBox.square(
                  dimension: 25,
                  child: CircularProgressIndicator(),
                ),
              TextButton(
                onPressed:
                    state.pending
                        ? null
                        : () {
                          context.pop();
                        },
                style: TextButton.styleFrom(
                  foregroundColor: Theme.of(context).colorScheme.error,
                ),
                child: Text(localizations.cancel),
              ),
              TextButton(
                onPressed:
                    state.pending
                        ? null
                        : () {
                          context.read<ContributeBoulderViewModel>().add(
                            SubmitContributeFormEvent(),
                          );
                        },
                child: Text(localizations.send),
              ),
            ],
          ),
        );
      },
    );
  }
}
