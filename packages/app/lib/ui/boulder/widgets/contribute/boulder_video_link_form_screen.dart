import 'package:breizh_blok_mobile/domain/entities/boulder/boulder.dart';
import 'package:breizh_blok_mobile/i18n/app_localizations.dart';
import 'package:breizh_blok_mobile/ui/boulder/forms/contribute_boulder_video_link_form.dart';
import 'package:breizh_blok_mobile/ui/boulder/view_models/boulder_video_link_feedback_view_model.dart';
import 'package:breizh_blok_mobile/ui/core/widgets/form_spinner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:reactive_forms/reactive_forms.dart';

class BoulderVideoLinkFormScreen extends StatelessWidget {
  const BoulderVideoLinkFormScreen({required this.boulder, super.key});

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
            title: Consumer(
              builder: (context, ref, _) {
                ref.listen(
                  boulderVideoFeedbackViewModelProvider(boulder: boulder),
                  (_, next) {
                    if (next.done) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            localizations.yourVideoLinkHasBeenSent,
                          ),
                        ),
                      );
                      context
                        ..pop()
                        ..pop();
                      return;
                    }
                    if (next.error) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(localizations.anErrorOccured),
                        ),
                      );
                    }
                  },
                );

                return ReactiveForm(
                  formGroup: ref.watch(boulderVideoLinkFormProvider),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ReactiveTextField<String>(
                        key: Key(
                          ContributeBoulderVideoLinkForm.formKeys.videoLink,
                        ),
                        validationMessages: {
                          'url': (_) => localizations.thisIsNotYoutubeUrl,
                          'api': (e) => e.toString(),
                        },

                        formControlName:
                            ContributeBoulderVideoLinkForm.formKeys.videoLink,
                        keyboardType: TextInputType.url,
                        decoration: InputDecoration(
                          labelText: localizations.videoLink,
                          alignLabelWithHint: true,
                          helperText: localizations.videoLinkHelper,
                          errorMaxLines: 3,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          ListTile(
            trailing: Consumer(
              builder: (context, ref, _) {
                final state = ref.watch(
                  boulderVideoFeedbackViewModelProvider(boulder: boulder),
                );

                return Wrap(
                  alignment: WrapAlignment.end,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    if (state.pending) const FormSpinner(),
                    const SizedBox(width: 10),
                    TextButton(
                      onPressed: state.pending
                          ? null
                          : () {
                              context.pop();
                            },
                      child: Text(localizations.cancel),
                    ),
                    const SizedBox(width: 10),
                    FilledButton(
                      onPressed: state.pending
                          ? null
                          : () async {
                              await ref
                                  .read(
                                    boulderVideoFeedbackViewModelProvider(
                                      boulder: boulder,
                                    ).notifier,
                                  )
                                  .onSubmit();
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
