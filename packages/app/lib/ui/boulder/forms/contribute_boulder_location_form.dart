import 'package:breizh_blok_mobile/ui/core/validators/must_validate_control.dart';
import 'package:breizh_blok_mobile/ui/core/validators/not_equal_validator.dart';
import 'package:reactive_forms/reactive_forms.dart';

class ContributeBoulderLocationForm extends FormGroup {
  ContributeBoulderLocationForm({
    required double latitude,
    required double longitude,
  }) : super(
         {
           ContributeBoulderLocationForm.formKeys.latitude: FormControl<double>(
             validators: [
               Validators.required,
               Validators.max(90),
               Validators.min(-90),
             ],
             value: latitude,
           ),
           ContributeBoulderLocationForm.formKeys.longitude:
               FormControl<double>(
                 validators: [
                   Validators.required,
                   Validators.max(180),
                   Validators.min(-180),
                 ],
                 value: longitude,
               ),
         },
         validators: [
           Validators.composeOR([
             MustValidateControl(
               controlName: ContributeBoulderLocationForm.formKeys.latitude,
               validator: NotEqualValidator(latitude),
             ),
             MustValidateControl(
               controlName: ContributeBoulderLocationForm.formKeys.longitude,
               validator: NotEqualValidator(longitude),
             ),
           ]),
         ],
       );

  static const ({String latitude, String longitude}) formKeys = (
    latitude: 'latitude',
    longitude: 'longitude',
  );

  double? get latitude =>
      controls[ContributeBoulderLocationForm.formKeys.latitude]?.value
          as double?;

  double? get longitude =>
      controls[ContributeBoulderLocationForm.formKeys.longitude]?.value
          as double?;
}
