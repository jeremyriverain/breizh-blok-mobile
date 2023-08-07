import 'package:breizh_blok_mobile/models/boulder_area.dart';
import 'package:breizh_blok_mobile/models/grade.dart';
import 'package:breizh_blok_mobile/models/order_query_param.dart';
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

    on<BoulderFilterGrade>(
      (event, emit) {
        emit(state.copyWith(grades: event.grades));
      },
    );

    on<BoulderFilterOrder>(
      (event, emit) {
        emit(state.copyWith(order: event.order));
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

class BoulderFilterGrade extends BoulderFilterEvent {
  final Set<Grade> grades;

  BoulderFilterGrade(this.grades);
}

class BoulderFilterOrder extends BoulderFilterEvent {
  final OrderQueryParam order;

  BoulderFilterOrder(this.order);
}

class BoulderFilterState extends Equatable {
  final String? term;
  final Set<BoulderArea> boulderAreas;
  final Set<Grade> grades;
  final OrderQueryParam order;

  BoulderFilterState({
    this.term,
    Set<BoulderArea>? boulderAreas,
    Set<Grade>? grades,
    order,
  })  : order = order ??
            const OrderQueryParam(name: 'order[id]', direction: 'desc'),
        boulderAreas = boulderAreas ?? <BoulderArea>{},
        grades = grades ?? <Grade>{};

  @override
  List<Object?> get props => [term, boulderAreas, grades, order];

  BoulderFilterState copyWith({
    String? term,
    Set<BoulderArea>? boulderAreas,
    Set<Grade>? grades,
    OrderQueryParam? order,
  }) {
    return BoulderFilterState(
      term: term ?? this.term,
      boulderAreas: boulderAreas ?? this.boulderAreas,
      grades: grades ?? this.grades,
      order: order ?? this.order,
    );
  }
}
