import 'package:breizh_blok_mobile/data/data_sources/api/model/api_order_param.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BoulderOrderBloc extends Bloc<BoulderOrderEvent, ApiOrderParam> {
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

  final ApiOrderParam order;
}
