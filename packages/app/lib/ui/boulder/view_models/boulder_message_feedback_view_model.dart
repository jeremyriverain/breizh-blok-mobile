import 'package:breizh_blok_mobile/domain/entities/boulder/boulder.dart';
import 'package:breizh_blok_mobile/domain/entities/boulder_feedback/boulder_feedback.dart';
import 'package:breizh_blok_mobile/service_locator/repositories.dart';
import 'package:breizh_blok_mobile/ui/boulder/forms/contribute_boulder_message_form.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'boulder_message_feedback_view_model.freezed.dart';

part 'boulder_message_feedback_view_model.g.dart';

@freezed
abstract class BoulderMessageFeedbackState with _$BoulderMessageFeedbackState {
  const factory BoulderMessageFeedbackState({
    required bool pending,
    required bool done,
    required bool error,
  }) = _BoulderMessageFeedbackState;
}

@riverpod
class BoulderFeedbackViewModel extends _$BoulderFeedbackViewModel {
  @override
  BoulderMessageFeedbackState build({
    required Boulder boulder,
  }) {
    return const BoulderMessageFeedbackState(
      pending: false,
      done: false,
      error: false,
    );
  }

  Future<void> onSubmit() async {
    final form = ref.watch(boulderMessageFormProvider)..markAllAsTouched();
    if (form.invalid) {
      return;
    }

    state = const BoulderMessageFeedbackState(
      pending: true,
      done: false,
      error: false,
    );

    final result = await ref
        .watch(boulderFeedbackRepositoryProvider)
        .create(
          BoulderFeedback(boulder: boulder, message: form.message),
        )
        .run();

    result.match(
      (domainException) {
        state = const BoulderMessageFeedbackState(
          pending: false,
          done: false,
          error: true,
        );
      },
      (_) {
        state = const BoulderMessageFeedbackState(
          pending: false,
          done: true,
          error: false,
        );
      },
    );
  }
}

@riverpod
ContributeBoulderMessageForm boulderMessageForm(Ref ref) {
  return ContributeBoulderMessageForm();
}
