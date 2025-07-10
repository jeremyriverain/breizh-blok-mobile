import 'package:breizh_blok_mobile/data/repositories/municipality/municipality_repository.dart';
import 'package:breizh_blok_mobile/domain/entities/municipality/municipality.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'municipality_view_model.freezed.dart';

class MunicipalityViewModel
    extends Bloc<MunicipalityEvents, MunicipalityStates> {
  MunicipalityViewModel({required this.repository, required this.id})
    : super(const MunicipalityLoading()) {
    on<MunicipalityEvents>((event, emit) async {
      switch (event) {
        case MunicipalityRequested():
          {
            try {
              emit(const MunicipalityLoading());
              final municipality = await _findMunicipality();
              emit(MunicipalityOK(municipality: municipality));
            } catch (e) {
              emit(MunicipalityError(error: e));
            }
          }
      }
    });
    add(const MunicipalityRequested());
  }

  final MunicipalityRepository repository;
  final String id;

  Future<Municipality> _findMunicipality() {
    return repository.find(id);
  }
}

@freezed
sealed class MunicipalityEvents with _$MunicipalityEvents {
  const MunicipalityEvents._();

  const factory MunicipalityEvents.requested() = MunicipalityRequested;
}

@freezed
sealed class MunicipalityStates with _$MunicipalityStates {
  const MunicipalityStates._();

  const factory MunicipalityStates.loading() = MunicipalityLoading;
  const factory MunicipalityStates.ok({required Municipality municipality}) =
      MunicipalityOK;
  const factory MunicipalityStates.error({Object? error}) = MunicipalityError;
}
