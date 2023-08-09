import 'package:breizh_blok_mobile/models/boulder_area.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BoulderFilterBloc extends Bloc<BoulderFilterEvent, BoulderFilterState> {
  BoulderFilterBloc(BoulderFilterState initialState) : super(initialState) {
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
  final String? term;

  BoulderFilterSearched(this.term);
}

class BoulderFilterLocation extends BoulderFilterEvent {
  final Set<BoulderArea> boulderAreas;

  BoulderFilterLocation(this.boulderAreas);
}

class BoulderFilterState extends Equatable {
  final String? term;
  final Set<BoulderArea> boulderAreas;

  BoulderFilterState({
    this.term,
    Set<BoulderArea>? boulderAreas,
  }) : boulderAreas = boulderAreas ?? <BoulderArea>{};

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
