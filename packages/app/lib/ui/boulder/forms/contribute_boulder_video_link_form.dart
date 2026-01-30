import 'package:breizh_blok_mobile/ui/core/validators/url_validator.dart';
import 'package:reactive_forms/reactive_forms.dart';

class ContributeBoulderVideoLinkForm extends FormGroup {
  ContributeBoulderVideoLinkForm()
    : super({
        ContributeBoulderVideoLinkForm.formKeys.videoLink: FormControl<String>(
          validators: [Validators.required, const UrlValidator()],
        ),
      });

  static const ({String videoLink}) formKeys = (videoLink: 'videoLink');

  String? get videoLink =>
      controls[ContributeBoulderVideoLinkForm.formKeys.videoLink]?.value
          as String?;
}
