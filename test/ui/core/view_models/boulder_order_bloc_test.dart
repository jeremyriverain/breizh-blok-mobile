import 'package:bloc_test/bloc_test.dart';
import 'package:breizh_blok_mobile/data/data_sources/api/model/api_order_param.dart';
import 'package:breizh_blok_mobile/ui/core/view_models/boulder_order_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('BoulderFilterBloc', () {
    blocTest<BoulderOrderBloc, ApiOrderParam>(
      'default state OK',
      build:
          () => BoulderOrderBloc(
            const ApiOrderParam(
              direction: kDescendantDirection,
              name: kIdOrderParam,
            ),
          ),
      verify: (BoulderOrderBloc bloc) {
        expect(bloc.state.direction, kDescendantDirection);
        expect(bloc.state.name, kIdOrderParam);
      },
    );

    blocTest<BoulderOrderBloc, ApiOrderParam>(
      'BoulderOrderEvent OK',
      build:
          () => BoulderOrderBloc(
            const ApiOrderParam(
              direction: kDescendantDirection,
              name: kIdOrderParam,
            ),
          ),
      act:
          (BoulderOrderBloc bloc) => bloc.add(
            BoulderOrderEvent(
              const ApiOrderParam(direction: kAscendantDirection, name: 'name'),
            ),
          ),
      expect:
          () => [
            const ApiOrderParam(direction: kAscendantDirection, name: 'name'),
          ],
    );
  });
}
