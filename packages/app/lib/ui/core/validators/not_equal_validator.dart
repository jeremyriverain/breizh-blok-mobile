import 'package:reactive_forms/reactive_forms.dart';

class NotEqualValidator extends Validator<dynamic> {
  const NotEqualValidator(this.forbiddenValue) : super();

  final dynamic forbiddenValue;

  @override
  Map<String, dynamic>? validate(AbstractControl<dynamic> control) {
    return control.value != forbiddenValue
        ? null
        : {
          'notEqual': {'forbiddenValue': forbiddenValue},
        };
  }
}
