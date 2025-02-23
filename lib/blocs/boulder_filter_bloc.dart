import 'package:breizh_blok_mobile/domain/models/boulder_area/boulder_area.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'boulder_filter_bloc.freezed.dart';

class BoulderFilterBloc extends Bloc<BoulderFilterEvent, BoulderFilterState> {
  BoulderFilterBloc(super.initialState) {
    on<BoulderFilterSearched>(
      (event, emit) {
        emit(state.copyWith(term: event.term));
      },
    );

    on<BoulderFilterLocation>(
      (event, emit) {
        emit(state.copyWith(boulderAreas: event.boulderAreas));
      },
    );
  }
}

abstract class BoulderFilterEvent {}

class BoulderFilterSearched extends BoulderFilterEvent {
  BoulderFilterSearched(this.term);

  final String? term;
}

class BoulderFilterLocation extends BoulderFilterEvent {
  BoulderFilterLocation(this.boulderAreas);

  final Set<BoulderArea> boulderAreas;
}

@freezed
abstract class BoulderFilterState with _$BoulderFilterState {
  const factory BoulderFilterState({
    String? term,
    @Default(<BoulderArea>{}) Set<BoulderArea> boulderAreas,
  }) = _BoulderFilterState;
}
