import 'package:breizh_blok_mobile/models/boulder_area.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

class BoulderFilterState extends Equatable {
  BoulderFilterState({
    this.term,
    Set<BoulderArea>? boulderAreas,
  }) : boulderAreas = boulderAreas ?? <BoulderArea>{};

  final String? term;
  final Set<BoulderArea> boulderAreas;

  @override
  List<Object?> get props => [term, boulderAreas];

  BoulderFilterState copyWith({
    String? term,
    Set<BoulderArea>? boulderAreas,
  }) {
    return BoulderFilterState(
      term: term ?? this.term,
      boulderAreas: boulderAreas ?? this.boulderAreas,
    );
  }
}
