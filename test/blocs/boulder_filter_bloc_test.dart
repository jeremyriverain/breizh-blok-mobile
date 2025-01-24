import 'package:bloc_test/bloc_test.dart';
import 'package:breizh_blok_mobile/blocs/boulder_filter_bloc.dart';
import 'package:breizh_blok_mobile/domain/models/boulder_area.dart';
import 'package:breizh_blok_mobile/domain/models/municipality.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('BoulderFilterBloc', () {
    blocTest<BoulderFilterBloc, BoulderFilterState>(
      'default state OK',
      build: () => BoulderFilterBloc(BoulderFilterState()),
      verify: (BoulderFilterBloc bloc) {
        expect(bloc.state.term, null);
        expect(bloc.state.boulderAreas, <BoulderArea>{});
      },
    );

    blocTest<BoulderFilterBloc, BoulderFilterState>(
      'BoulderFilterSearched event OK',
      build: () => BoulderFilterBloc(BoulderFilterState()),
      act: (BoulderFilterBloc bloc) => bloc.add(
        BoulderFilterSearched(
          'cre',
        ),
      ),
      expect: () => [BoulderFilterState(term: 'cre')],
    );

    final referenceBoulderArea = BoulderArea(
      iri: '1',
      name: 'la patine',
      municipality: Municipality(iri: '', name: 'kerlouan'),
    );

    blocTest<BoulderFilterBloc, BoulderFilterState>(
      'BoulderFilterLocation event OK',
      build: () => BoulderFilterBloc(BoulderFilterState()),
      act: (BoulderFilterBloc bloc) => bloc.add(
        BoulderFilterLocation(
          {
            referenceBoulderArea,
          },
        ),
      ),
      expect: () => [
        BoulderFilterState(
          boulderAreas: {
            referenceBoulderArea,
          },
        ),
      ],
    );
  });
}
