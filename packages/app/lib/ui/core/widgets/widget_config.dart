import 'package:breizh_blok_mobile/i18n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class WidgetConfig extends StatelessWidget {
  const WidgetConfig({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    return ReactiveFormConfig(
      validationMessages: {
        ValidationMessage.required: (error) => localizations.validatorsRequired,
      },
      child: child,
    );
  }
}
