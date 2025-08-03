import 'package:reactive_forms/reactive_forms.dart';

class MustValidateControl extends Validator<dynamic> {
  MustValidateControl({required this.controlName, required this.validator})
    : super();

  final String controlName;
  final Validator<dynamic> validator;

  @override
  Map<String, dynamic>? validate(AbstractControl<dynamic> control) {
    final form = control as FormGroup;

    final formControl = form.control(controlName);

    return validator(formControl);
  }
}
