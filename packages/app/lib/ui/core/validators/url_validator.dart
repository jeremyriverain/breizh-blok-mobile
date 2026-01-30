import 'package:reactive_forms/reactive_forms.dart';

class UrlValidator extends Validator<dynamic> {
  const UrlValidator() : super();

  @override
  Map<String, dynamic>? validate(AbstractControl<dynamic> control) {
    final value = control.value;
    if (value is! String) {
      return {
        'url': {'value': value.toString()},
      };
    }
    final uri = Uri.tryParse(value);

    if (uri == null || !uri.isAbsolute) {
      return {
        'url': {'value': value},
      };
    }

    return null;
  }
}
