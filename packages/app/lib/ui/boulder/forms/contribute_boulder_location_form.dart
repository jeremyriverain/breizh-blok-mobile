import 'package:breizh_blok_mobile/ui/core/validators/not_equal_validator.dart';
import 'package:reactive_forms/reactive_forms.dart';

class ContributeBoulderLocationForm extends FormGroup {
  ContributeBoulderLocationForm({
    required double latitude,
    required double longitude,
  }) : super({
         ContributeBoulderLocationForm.formKeys.latitude: FormControl<double>(
           validators: [
             Validators.required,
             Validators.max(90),
             Validators.min(-90),
             NotEqualValidator(latitude),
           ],
           value: latitude,
         ),
         ContributeBoulderLocationForm.formKeys.longitude: FormControl<double>(
           validators: [
             Validators.required,
             Validators.max(180),
             Validators.min(-180),
             NotEqualValidator(longitude),
           ],
           value: longitude,
         ),
       });

  static const formKeys = (latitude: 'latitude', longitude: 'longitude');

  double? get latitude =>
      controls[ContributeBoulderLocationForm.formKeys.latitude]?.value
          as double?;

  double? get longitude =>
      controls[ContributeBoulderLocationForm.formKeys.longitude]?.value
          as double?;
}
