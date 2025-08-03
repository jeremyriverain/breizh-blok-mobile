import 'package:breizh_blok_mobile/domain/entities/boulder/boulder.dart';
import 'package:breizh_blok_mobile/domain/entities/boulder_feedback/boulder_feedback.dart';
import 'package:breizh_blok_mobile/domain/repositories/boulder_feedback_repository.dart';
import 'package:breizh_blok_mobile/ui/boulder/forms/contribute_boulder_message_form.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'boulder_message_feedback_view_model.freezed.dart';

class BoulderMessageFeedbackViewModel
    extends Bloc<SubmitContributeFormEvent, BoulderMessageFeedbackState> {
  BoulderMessageFeedbackViewModel({
    required ContributeBoulderMessageForm form,
    required this.boulderFeedbackRepository,
    required this.boulder,
  }) : super(
         BoulderMessageFeedbackState(
           form: form,
           pending: false,
           done: false,
           error: false,
         ),
       ) {
    on<SubmitContributeFormEvent>((event, emit) async {
      state.form.markAllAsTouched();
      if (state.form.invalid) {
        return;
      }
      emit(
        BoulderMessageFeedbackState(
          form: state.form,
          pending: true,
          done: false,
          error: false,
        ),
      );
      final result =
          await boulderFeedbackRepository
              .create(
                BoulderFeedback(boulder: boulder, message: state.form.message),
              )
              .run();

      result.match(
        (domainException) {
          emit(
            BoulderMessageFeedbackState(
              form: state.form,
              pending: false,
              done: false,
              error: true,
            ),
          );
        },
        (_) {
          emit(
            BoulderMessageFeedbackState(
              form: ContributeBoulderMessageForm(),
              pending: false,
              done: true,
              error: false,
            ),
          );
        },
      );
    });
  }

  final BoulderFeedbackRepository boulderFeedbackRepository;
  final Boulder boulder;
}

class SubmitContributeFormEvent {}

@freezed
abstract class BoulderMessageFeedbackState with _$BoulderMessageFeedbackState {
  const factory BoulderMessageFeedbackState({
    required ContributeBoulderMessageForm form,
    required bool pending,
    required bool done,
    required bool error,
  }) = _BoulderMessageFeedbackState;
}
