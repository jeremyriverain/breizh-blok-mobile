import 'package:reactive_forms/reactive_forms.dart';

class ContributeBoulderMessageForm extends FormGroup {
  ContributeBoulderMessageForm()
    : super({
        ContributeBoulderMessageForm.formKeys.message: FormControl<String>(
          validators: [Validators.required],
        ),
      });

  static const ({String message}) formKeys = (message: 'message');

  String? get message =>
      controls[ContributeBoulderMessageForm.formKeys.message]?.value as String?;
}
