import 'package:breizh_blok_mobile/domain/entities/boulder/boulder.dart';
import 'package:breizh_blok_mobile/domain/entities/boulder_feedback/boulder_feedback.dart';
import 'package:breizh_blok_mobile/domain/repositories/boulder_feedback_repository.dart';
import 'package:breizh_blok_mobile/ui/boulder/forms/contribute_boulder_message_form.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'boulder_message_feedback_view_model.freezed.dart';

part 'boulder_message_feedback_view_model.g.dart';

@freezed
abstract class BoulderMessageFeedbackState with _$BoulderMessageFeedbackState {
  const factory BoulderMessageFeedbackState({
    required ContributeBoulderMessageForm form,
    required bool pending,
    required bool done,
    required bool error,
  }) = _BoulderMessageFeedbackState;
}

@riverpod
class BoulderFeedbackViewModel extends _$BoulderFeedbackViewModel {
  @override
  BoulderMessageFeedbackState build({
    required ContributeBoulderMessageForm form,
    required BoulderFeedbackRepository boulderFeedbackRepository,
    required Boulder boulder,
  }) {
    return BoulderMessageFeedbackState(
      form: form,
      pending: false,
      done: false,
      error: false,
    );
  }

  Future<void> onSubmit() async {
    form.markAllAsTouched();
    if (form.invalid) {
      return;
    }

    state = BoulderMessageFeedbackState(
      form: state.form,
      pending: true,
      done: false,
      error: false,
    );

    final result = await boulderFeedbackRepository
        .create(
          BoulderFeedback(boulder: boulder, message: state.form.message),
        )
        .run();

    result.match(
      (domainException) {
        state = BoulderMessageFeedbackState(
          form: state.form,
          pending: false,
          done: false,
          error: true,
        );
      },
      (_) {
        state = BoulderMessageFeedbackState(
          form: ContributeBoulderMessageForm(),
          pending: false,
          done: true,
          error: false,
        );
      },
    );
  }
}

@riverpod
ContributeBoulderMessageForm contributeBoulderMessageForm(Ref ref) {
  return ContributeBoulderMessageForm();
}
