import 'package:bloc_test/bloc_test.dart';
import 'package:breizh_blok_mobile/blocs/boulder_filter_bloc.dart';
import 'package:breizh_blok_mobile/models/boulder_area.dart';
import 'package:breizh_blok_mobile/models/grade.dart';
import 'package:breizh_blok_mobile/models/municipality.dart';
import 'package:breizh_blok_mobile/models/order_query_param.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('BoulderFilterBloc', () {
    blocTest(
      'default state OK',
      build: () => BoulderFilterBloc(BoulderFilterState()),
      verify: (BoulderFilterBloc bloc) {
        expect(bloc.state.term, null);
        expect(bloc.state.boulderAreas, <BoulderArea>{});
        expect(bloc.state.grades, <Grade>{});
        expect(
          bloc.state.order,
          const OrderQueryParam(name: 'order[id]', direction: 'desc'),
        );
      },
    );

    blocTest(
      'BoulderFilterSearched event OK',
      build: () => BoulderFilterBloc(BoulderFilterState()),
      act: (BoulderFilterBloc bloc) => bloc.add(BoulderFilterSearched(
        'cre',
      )),
      expect: () => [BoulderFilterState(term: 'cre')],
    );

    final referenceBoulderArea = BoulderArea(
      iri: '1',
      name: 'la patine',
      municipality: Municipality(iri: '', name: 'kerlouan'),
    );

    blocTest(
      'BoulderFilterLocation event OK',
      build: () => BoulderFilterBloc(BoulderFilterState()),
      act: (BoulderFilterBloc bloc) => bloc.add(BoulderFilterLocation(
        {
          referenceBoulderArea,
        },
      )),
      expect: () => [
        BoulderFilterState(boulderAreas: {
          referenceBoulderArea,
        })
      ],
    );

    final referenceGrade = Grade(
      iri: '1',
      name: '6a',
    );

    blocTest(
      'BoulderFilterGrade event OK',
      build: () => BoulderFilterBloc(BoulderFilterState()),
      act: (BoulderFilterBloc bloc) => bloc.add(BoulderFilterGrade(
        {
          referenceGrade,
        },
      )),
      expect: () => [
        BoulderFilterState(grades: {
          referenceGrade,
        })
      ],
    );

    const referenceOrder =
        OrderQueryParam(name: 'order[name]', direction: 'asc');
    blocTest(
      'BoulderFilterOrder event OK',
      build: () => BoulderFilterBloc(BoulderFilterState()),
      act: (BoulderFilterBloc bloc) => bloc.add(
        BoulderFilterOrder(referenceOrder),
      ),
      expect: () => [
        BoulderFilterState(
          order: referenceOrder,
        )
      ],
    );
  });
}
