import 'package:bloc_test/bloc_test.dart';
import 'package:breizh_blok_mobile/blocs/boulder_order_bloc.dart';
import 'package:breizh_blok_mobile/models/order_query_param.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('BoulderFilterBloc', () {
    blocTest<BoulderOrderBloc, OrderQueryParam>(
      'default state OK',
      build: () => BoulderOrderBloc(
        const OrderQueryParam(direction: 'desc', name: 'order[id]'),
      ),
      verify: (BoulderOrderBloc bloc) {
        expect(bloc.state.direction, 'desc');
        expect(bloc.state.name, 'order[id]');
      },
    );

    blocTest<BoulderOrderBloc, OrderQueryParam>(
      'BoulderOrderEvent OK',
      build: () => BoulderOrderBloc(
        const OrderQueryParam(direction: 'desc', name: 'order[id]'),
      ),
      act: (BoulderOrderBloc bloc) => bloc.add(
        BoulderOrderEvent(
          const OrderQueryParam(direction: 'asc', name: 'name'),
        ),
      ),
      expect: () => [const OrderQueryParam(direction: 'asc', name: 'name')],
    );
  });
}
