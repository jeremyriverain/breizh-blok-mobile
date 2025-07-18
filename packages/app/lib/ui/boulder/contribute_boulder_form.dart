import 'package:reactive_forms/reactive_forms.dart';

class ContributeBoulderForm extends FormGroup {
  ContributeBoulderForm()
    : super({
        ContributeBoulderForm.formKeys.message: FormControl<String>(
          validators: [Validators.required],
        ),
      });

  static const formKeys = (message: 'message');

  String? get message =>
      controls[ContributeBoulderForm.formKeys.message]?.value as String?;
}
