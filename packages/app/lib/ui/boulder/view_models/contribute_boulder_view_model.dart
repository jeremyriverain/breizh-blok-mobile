import 'package:breizh_blok_mobile/data/repositories/boulder_feedback/boulder_feedback_repository.dart';
import 'package:breizh_blok_mobile/domain/entities/boulder/boulder.dart';
import 'package:breizh_blok_mobile/domain/entities/boulder_feedback/boulder_feedback.dart';
import 'package:breizh_blok_mobile/ui/boulder/contribute_boulder_form.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'contribute_boulder_view_model.freezed.dart';

class ContributeBoulderViewModel
    extends Bloc<SubmitContributeFormEvent, ContributeBoulderState> {
  ContributeBoulderViewModel({
    required ContributeBoulderForm form,
    required this.boulderFeedbackRepository,
    required this.boulder,
  }) : super(
         ContributeBoulderState(
           form: form,
           pending: false,
           done: false,
           error: false,
         ),
       ) {
    on<SubmitContributeFormEvent>((event, emit) async {
      switch (event) {
        case SubmitContributeFormEvent():
          state.form.markAllAsTouched();
          if (state.form.invalid) {
            return;
          }
          emit(
            ContributeBoulderState(
              form: state.form,
              pending: true,
              done: false,
              error: false,
            ),
          );
          final result =
              await boulderFeedbackRepository
                  .create(
                    BoulderFeedback(
                      boulder: boulder,
                      message: state.form.message,
                    ),
                  )
                  .run();

          result.match(
            (domainException) {
              emit(
                ContributeBoulderState(
                  form: state.form,
                  pending: false,
                  done: false,
                  error: true,
                ),
              );
            },
            (_) {
              emit(
                ContributeBoulderState(
                  form: ContributeBoulderForm(),
                  pending: false,
                  done: true,
                  error: false,
                ),
              );
            },
          );
      }
    });
  }

  final BoulderFeedbackRepository boulderFeedbackRepository;
  final Boulder boulder;
}

class SubmitContributeFormEvent {}

@freezed
abstract class ContributeBoulderState with _$ContributeBoulderState {
  const factory ContributeBoulderState({
    required ContributeBoulderForm form,
    required bool pending,
    required bool done,
    required bool error,
  }) = _ContributeBoulderState;
}
