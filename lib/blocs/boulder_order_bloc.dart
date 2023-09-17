import 'package:breizh_blok_mobile/models/order_query_param.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BoulderOrderBloc extends Bloc<BoulderOrderEvent, OrderQueryParam> {
  BoulderOrderBloc(super.initialState) {
    on<BoulderOrderEvent>(
      (event, emit) {
        emit(event.order);
      },
    );
  }
}

class BoulderOrderEvent {
  BoulderOrderEvent(this.order);

  final OrderQueryParam order;
}
