import 'package:bloc_test/bloc_test.dart';
import 'package:breizh_blok_mobile/blocs/boulder_order_bloc.dart';
import 'package:breizh_blok_mobile/models/order_query_param.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('BoulderFilterBloc', () {
    blocTest<BoulderOrderBloc, OrderQueryParam>(
      'default state OK',
      build: () => BoulderOrderBloc(
        const OrderQueryParam(
          direction: kDescendantDirection,
          name: kIdOrderQueryParam,
        ),
      ),
      verify: (BoulderOrderBloc bloc) {
        expect(bloc.state.direction, kDescendantDirection);
        expect(bloc.state.name, kIdOrderQueryParam);
      },
    );

    blocTest<BoulderOrderBloc, OrderQueryParam>(
      'BoulderOrderEvent OK',
      build: () => BoulderOrderBloc(
        const OrderQueryParam(
          direction: kDescendantDirection,
          name: kIdOrderQueryParam,
        ),
      ),
      act: (BoulderOrderBloc bloc) => bloc.add(
        BoulderOrderEvent(
          const OrderQueryParam(direction: kAscendantDirection, name: 'name'),
        ),
      ),
      expect: () =>
          [const OrderQueryParam(direction: kAscendantDirection, name: 'name')],
    );
  });
}
