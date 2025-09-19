import 'package:breizh_blok_mobile/i18n/app_localizations.dart';
import 'package:breizh_blok_mobile/service_locator/service_locator.dart';
import 'package:breizh_blok_mobile/ui/terms_of_use/view_models/terms_of_use_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class TermsOfUseDialog extends StatelessWidget {
  const TermsOfUseDialog({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        return BlocProvider(
          create: (context) => TermsOfUseViewModel(
            preferences: ref.watch(sharedPreferencesProvider),
          ),
          child: BlocListener<TermsOfUseViewModel, bool?>(
            listenWhen: (previous, hasAccepted) =>
                hasAccepted == null || !hasAccepted,
            listener: (context, hasAccepted) {
              if (hasAccepted != true) {
                showDialog<void>(
                  barrierDismissible: false,
                  context: context,
                  builder: (BuildContext dialogContext) => AlertDialog.adaptive(
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
                    content: Text(
                      AppLocalizations.of(context).termsOfUseContent,
                    ),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          context.read<TermsOfUseViewModel>().add(
                            const TermsOfUseAccepted(),
                          );

                          GoRouter.of(dialogContext).pop();
                        },
                        child: Text(AppLocalizations.of(context).iAccept),
                      ),
                    ],
                  ),
                );
              }
            },
            child: child,
          ),
        );
      },
    );
  }
}
