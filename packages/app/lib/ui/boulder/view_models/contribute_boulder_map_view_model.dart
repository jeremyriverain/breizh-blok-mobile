import 'package:breizh_blok_mobile/domain/entities/boulder/boulder.dart';
import 'package:breizh_blok_mobile/domain/entities/boulder_feedback/boulder_feedback.dart';
import 'package:breizh_blok_mobile/domain/entities/location/location.dart';
import 'package:breizh_blok_mobile/domain/repositories/boulder_feedback_repository.dart';
import 'package:breizh_blok_mobile/ui/boulder/forms/contribute_boulder_location_form.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'contribute_boulder_map_view_model.freezed.dart';

class ContributeBoulderMapViewModel
    extends Bloc<SubmitLocationEvents, ContributeBoulderMapState> {
  ContributeBoulderMapViewModel({
    required ContributeBoulderLocationForm form,
    required this.boulderFeedbackRepository,
    required this.boulder,
  }) : super(
         ContributeBoulderMapState(
           form: form,
           pending: false,
           done: false,
           error: false,
         ),
       ) {
    on<SubmitLocationEvents>((event, emit) async {
      switch (event) {
        case SubmitLocationEvent():
          state.form.markAllAsTouched();
          if (state.form.invalid) {
            return;
          }
          emit(
            ContributeBoulderMapState(
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
                      newLocation: Location(
                        latitude: state.form.latitude ?? 0,
                        longitude: state.form.longitude ?? 0,
                      ),
                    ),
                  )
                  .run();

          result.match(
            (domainException) {
              emit(
                ContributeBoulderMapState(
                  form: state.form,
                  pending: false,
                  done: false,
                  error: true,
                ),
              );
            },
            (_) {
              emit(
                ContributeBoulderMapState(
                  form: ContributeBoulderLocationForm(
                    latitude: state.form.latitude ?? 0,
                    longitude: state.form.longitude ?? 0,
                  ),
                  pending: false,
                  done: true,
                  error: false,
                ),
              );
            },
          );
        case UpdateLatitudeEvent(:final latitude):
          state
              .form
              .control(ContributeBoulderLocationForm.formKeys.latitude)
              .value = latitude;
        case UpdateLongitudeEvent(:final longitude):
          state
              .form
              .control(ContributeBoulderLocationForm.formKeys.longitude)
              .value = longitude;
      }
    });
  }

  final BoulderFeedbackRepository boulderFeedbackRepository;
  final Boulder boulder;
}

sealed class SubmitLocationEvents {}

class SubmitLocationEvent extends SubmitLocationEvents {}

class UpdateLatitudeEvent extends SubmitLocationEvents {
  UpdateLatitudeEvent({required this.latitude});

  final double latitude;
}

class UpdateLongitudeEvent extends SubmitLocationEvents {
  UpdateLongitudeEvent({required this.longitude});

  final double longitude;
}

@freezed
abstract class ContributeBoulderMapState with _$ContributeBoulderMapState {
  const factory ContributeBoulderMapState({
    required ContributeBoulderLocationForm form,
    required bool pending,
    required bool done,
    required bool error,
  }) = _ContributeBoulderMapState;
}
