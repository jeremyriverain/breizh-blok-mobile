import 'package:bloc_test/bloc_test.dart';
import 'package:breizh_blok_mobile/blocs/boulder_order_bloc.dart';
import 'package:breizh_blok_mobile/models/order_param.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('BoulderFilterBloc', () {
    blocTest<BoulderOrderBloc, OrderParam>(
      'default state OK',
      build: () => BoulderOrderBloc(
        const OrderParam(
          direction: kDescendantDirection,
          name: kIdOrderParam,
        ),
      ),
      verify: (BoulderOrderBloc bloc) {
        expect(bloc.state.direction, kDescendantDirection);
        expect(bloc.state.name, kIdOrderParam);
      },
    );

    blocTest<BoulderOrderBloc, OrderParam>(
      'BoulderOrderEvent OK',
      build: () => BoulderOrderBloc(
        const OrderParam(
          direction: kDescendantDirection,
          name: kIdOrderParam,
        ),
      ),
      act: (BoulderOrderBloc bloc) => bloc.add(
        BoulderOrderEvent(
          const OrderParam(direction: kAscendantDirection, name: 'name'),
        ),
      ),
      expect: () =>
          [const OrderParam(direction: kAscendantDirection, name: 'name')],
    );
  });
}
