import 'package:breizh_blok_mobile/data/repositories/boulder_feedback/boulder_feedback_repository.dart';
import 'package:breizh_blok_mobile/domain/entities/boulder/boulder.dart';
import 'package:breizh_blok_mobile/i18n/app_localizations.dart';
import 'package:breizh_blok_mobile/ui/boulder/contribute_boulder_form.dart';
import 'package:breizh_blok_mobile/ui/boulder/view_models/contribute_boulder_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
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
        title: FittedBox(child: Text(localizations.makeSuggestion)),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text(localizations.relevantBoulder),
            subtitle: Text(
              '${boulder.name} '
              '(${boulder.rock.boulderArea.name})',
            ),
          ),
          ListTile(
            title: BlocProvider(
              create:
                  (context) => ContributeBoulderViewModel(
                    form: ContributeBoulderForm(),
                    boulderFeedbackRepository:
                        GetIt.I.get<BoulderFeedbackRepository>(),
                    boulder: boulder,
                  ),
              child: BlocConsumer<
                ContributeBoulderViewModel,
                ContributeBoulderState
              >(
                listener: (BuildContext context, ContributeBoulderState state) {
                  if (state.done) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(localizations.yourMessageHasBeenSent),
                      ),
                    );
                    context.pop();
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
                          formControlName:
                              ContributeBoulderForm.formKeys.message,
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
          ),
          ListTile(
            trailing: FilledButton(
              onPressed: () {},
              child: Text(localizations.send),
            ),
          ),
        ],
      ),
    );
  }
}
