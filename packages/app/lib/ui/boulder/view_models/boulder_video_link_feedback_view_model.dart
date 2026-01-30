import 'package:breizh_blok_mobile/domain/entities/boulder/boulder.dart';
import 'package:breizh_blok_mobile/domain/entities/boulder_feedback/boulder_feedback.dart';
import 'package:breizh_blok_mobile/domain/entities/domain_exception/domain_exception.dart';
import 'package:breizh_blok_mobile/domain/repositories/boulder_feedback_repository.dart';
import 'package:breizh_blok_mobile/ui/boulder/forms/contribute_boulder_video_link_form.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'boulder_video_link_feedback_view_model.freezed.dart';

class BoulderVideoLinkFeedbackViewModel
    extends
        Bloc<
          SubmitContributeVideoLinkFormEvent,
          BoulderVideoLinkFeedbackState
        > {
  BoulderVideoLinkFeedbackViewModel({
    required ContributeBoulderVideoLinkForm form,
    required this.boulderFeedbackRepository,
    required this.boulder,
  }) : super(
         BoulderVideoLinkFeedbackState(
           form: form,
           pending: false,
           done: false,
           error: false,
         ),
       ) {
    on<SubmitContributeVideoLinkFormEvent>((event, emit) async {
      state.form.markAllAsTouched();
      if (state.form.invalid) {
        return;
      }
      emit(
        BoulderVideoLinkFeedbackState(
          form: state.form,
          pending: true,
          done: false,
          error: false,
        ),
      );
      final result = await boulderFeedbackRepository
          .create(
            BoulderFeedback(boulder: boulder, videoLink: state.form.videoLink),
          )
          .run();

      result.match(
        (domainException) {
          if (domainException is UnprocessableEntityException) {
            final videoLinkViolation = domainException.findViolation(
              propertyPath: 'videoLink',
            );

            if (videoLinkViolation != null) {
              state.form
                  .control(
                    ContributeBoulderVideoLinkForm.formKeys.videoLink,
                  )
                  .setErrors({
                    'api': videoLinkViolation.message,
                  });
            }
          }

          emit(
            BoulderVideoLinkFeedbackState(
              form: state.form,
              pending: false,
              done: false,
              error: true,
            ),
          );
        },
        (_) {
          emit(
            BoulderVideoLinkFeedbackState(
              form: ContributeBoulderVideoLinkForm(),
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

class SubmitContributeVideoLinkFormEvent {}

@freezed
abstract class BoulderVideoLinkFeedbackState
    with _$BoulderVideoLinkFeedbackState {
  const factory BoulderVideoLinkFeedbackState({
    required ContributeBoulderVideoLinkForm form,
    required bool pending,
    required bool done,
    required bool error,
  }) = _BoulderVideoLinkFeedbackState;
}
