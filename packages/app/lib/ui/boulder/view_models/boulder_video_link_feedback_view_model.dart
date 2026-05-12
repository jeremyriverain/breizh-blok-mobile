import 'package:breizh_blok_mobile/domain/entities/boulder/boulder.dart';
import 'package:breizh_blok_mobile/domain/entities/boulder_feedback/boulder_feedback.dart';
import 'package:breizh_blok_mobile/domain/entities/domain_exception/domain_exception.dart';
import 'package:breizh_blok_mobile/service_locator/repositories.dart';
import 'package:breizh_blok_mobile/ui/boulder/forms/contribute_boulder_video_link_form.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'boulder_video_link_feedback_view_model.freezed.dart';
part 'boulder_video_link_feedback_view_model.g.dart';

@freezed
abstract class BoulderVideoLinkFeedbackState
    with _$BoulderVideoLinkFeedbackState {
  const factory BoulderVideoLinkFeedbackState({
    required bool pending,
    required bool done,
    required bool error,
  }) = _BoulderVideoLinkFeedbackState;
}

@riverpod
class BoulderVideoFeedbackViewModel extends _$BoulderVideoFeedbackViewModel {
  @override
  BoulderVideoLinkFeedbackState build({
    required Boulder boulder,
  }) {
    return const BoulderVideoLinkFeedbackState(
      pending: false,
      done: false,
      error: false,
    );
  }

  Future<void> onSubmit() async {
    final form = ref.watch(boulderVideoLinkFormProvider)..markAllAsTouched();
    if (form.invalid) {
      return;
    }
    state = const BoulderVideoLinkFeedbackState(
      pending: true,
      done: false,
      error: false,
    );

    final result = await ref
        .watch(boulderFeedbackRepositoryProvider)
        .create(
          BoulderFeedback(boulder: boulder, videoLink: form.videoLink),
        )
        .run();

    result.match(
      (domainException) {
        if (domainException is UnprocessableEntityException) {
          final videoLinkViolation = domainException.findViolation(
            propertyPath: 'videoLink',
          );

          if (videoLinkViolation != null) {
            ref
                .watch(boulderVideoLinkFormProvider)
                .control(
                  ContributeBoulderVideoLinkForm.formKeys.videoLink,
                )
                .setErrors({
                  'api': videoLinkViolation.message,
                });
          }
        }

        state = const BoulderVideoLinkFeedbackState(
          pending: false,
          done: false,
          error: true,
        );
      },
      (_) {
        state = const BoulderVideoLinkFeedbackState(
          pending: false,
          done: true,
          error: false,
        );
      },
    );
  }
}

@riverpod
ContributeBoulderVideoLinkForm boulderVideoLinkForm(Ref ref) {
  return ContributeBoulderVideoLinkForm();
}
