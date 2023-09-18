import 'package:bloc_test/bloc_test.dart';
import 'package:breizh_blok_mobile/blocs/tab_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('TabBloc', () {
    blocTest<TabBloc, int>(
      'default state OK',
      build: TabBloc.new,
      verify: (TabBloc bloc) {
        expect(
          bloc.state,
          0,
        );
      },
    );

    blocTest<TabBloc, int>(
      'TabUpdated event OK',
      build: TabBloc.new,
      act: (TabBloc bloc) => bloc.add(
        TabUpdated(
          activeTab: 1,
        ),
      ),
      expect: () => [1],
    );
  });
}
