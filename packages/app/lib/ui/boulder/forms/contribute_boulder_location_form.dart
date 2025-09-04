import 'package:breizh_blok_mobile/ui/core/validators/must_validate_control.dart';
import 'package:breizh_blok_mobile/ui/core/validators/not_equal_validator.dart';
import 'package:reactive_forms/reactive_forms.dart';

class ContributeBoulderLocationForm extends FormGroup {
  ContributeBoulderLocationForm({
    required double latitude,
    required double longitude,
  }) : _initialLatitude = latitude,
       _initialLongitude = longitude,
       super({
         ContributeBoulderLocationForm.formKeys.latitude: FormControl<double>(
           validators: [
             Validators.required,
             Validators.max(90),
             Validators.min(-90),
           ],
           value: latitude,
         ),
         ContributeBoulderLocationForm.formKeys.longitude: FormControl<double>(
           validators: [
             Validators.required,
             Validators.max(180),
             Validators.min(-180),
           ],
           value: longitude,
         ),
       });

  static const ({String latitude, String longitude}) formKeys = (
    latitude: 'latitude',
    longitude: 'longitude',
  );

  final double _initialLatitude;
  final double _initialLongitude;

  double? get latitude =>
      controls[ContributeBoulderLocationForm.formKeys.latitude]?.value
          as double?;

  double? get longitude =>
      controls[ContributeBoulderLocationForm.formKeys.longitude]?.value
          as double?;

  @override
  List<Validator<dynamic>> get validators => [
    Validators.composeOR([
      MustValidateControl(
        controlName: ContributeBoulderLocationForm.formKeys.latitude,
        validator: NotEqualValidator(_initialLatitude),
      ),
      MustValidateControl(
        controlName: ContributeBoulderLocationForm.formKeys.longitude,
        validator: NotEqualValidator(_initialLongitude),
      ),
    ]),
  ];
}
