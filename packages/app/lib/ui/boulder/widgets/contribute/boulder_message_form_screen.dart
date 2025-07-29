import 'package:breizh_blok_mobile/domain/entities/boulder/boulder.dart';
import 'package:breizh_blok_mobile/i18n/app_localizations.dart';
import 'package:breizh_blok_mobile/ui/boulder/contribute_boulder_form.dart';
import 'package:breizh_blok_mobile/ui/boulder/view_models/boulder_message_feedback_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:reactive_forms/reactive_forms.dart';

class BoulderMessageFormScreen extends StatelessWidget {
  const BoulderMessageFormScreen({required this.boulder, super.key});

  final Boulder boulder;

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: FittedBox(
          child: Text(
            '${boulder.name} '
            '(${boulder.rock.boulderArea.name})',
          ),
        ),
      ),
      body: ListView(
        children: [
          ListTile(
            title: BlocConsumer<
              BoulderMessageFeedbackViewModel,
              BoulderMessageFeedbackState
            >(
              listener: (
                BuildContext context,
                BoulderMessageFeedbackState state,
              ) {
                if (state.done) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(localizations.yourMessageHasBeenSent),
                    ),
                  );
                  context
                    ..pop()
                    ..pop();
                  return;
                }
                if (state.error) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(localizations.anErrorOccured)),
                  );
                }
              },
              builder: (context, state) {
                return ReactiveForm(
                  formGroup: state.form,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ReactiveTextField<String>(
                        key: Key(ContributeBoulderForm.formKeys.message),
                        formControlName: ContributeBoulderForm.formKeys.message,
                        keyboardType: TextInputType.text,
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
                );
              },
            ),
          ),
          ListTile(
            trailing: BlocBuilder<
              BoulderMessageFeedbackViewModel,
              BoulderMessageFeedbackState
            >(
              builder: (context, state) {
                return Wrap(
                  alignment: WrapAlignment.end,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    if (state.pending)
                      const SizedBox.square(
                        dimension: 25,
                        child: CircularProgressIndicator(),
                      ),
                    const SizedBox(width: 10),
                    TextButton(
                      onPressed:
                          state.pending
                              ? null
                              : () {
                                context.pop();
                              },
                      child: Text(localizations.cancel),
                    ),
                    const SizedBox(width: 10),
                    FilledButton(
                      onPressed:
                          state.pending
                              ? null
                              : () {
                                context
                                    .read<BoulderMessageFeedbackViewModel>()
                                    .add(SubmitContributeFormEvent());
                              },
                      child: Text(localizations.send),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
