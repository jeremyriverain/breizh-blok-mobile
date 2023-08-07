import 'package:bloc_test/bloc_test.dart';
import 'package:breizh_blok_mobile/blocs/terms_of_use_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  group('TermsOfUseBloc', () {
    blocTest(
      'default state OK - key acceptance not present',
      setUp: () {
        SharedPreferences.setMockInitialValues({});
      },
      build: () => TermsOfUseBloc(),
      act: (TermsOfUseBloc bloc) => bloc.add(TermsOfUseAcceptanceRequested()),
      expect: () => [false],
      verify: (TermsOfUseBloc bloc) async {
        final sharedPreferences = await SharedPreferences.getInstance();
        final hasAccepted =
            sharedPreferences.getBool(TermsOfUseBloc.termsOfUseAcceptanceKey);
        expect(hasAccepted, null);
      },
    );

    blocTest(
      'default state OK - not accepted',
      setUp: () {
        final Map<String, Object> values = <String, Object>{
          TermsOfUseBloc.termsOfUseAcceptanceKey: false
        };
        SharedPreferences.setMockInitialValues(values);
      },
      build: () => TermsOfUseBloc(),
      act: (TermsOfUseBloc bloc) => bloc.add(TermsOfUseAcceptanceRequested()),
      expect: () => [false],
      verify: (TermsOfUseBloc bloc) async {
        final sharedPreferences = await SharedPreferences.getInstance();
        final hasAccepted =
            sharedPreferences.getBool(TermsOfUseBloc.termsOfUseAcceptanceKey);
        expect(hasAccepted, false);
      },
    );

    blocTest(
      'default state OK - accepted',
      setUp: () {
        final Map<String, Object> values = <String, Object>{
          TermsOfUseBloc.termsOfUseAcceptanceKey: true
        };
        SharedPreferences.setMockInitialValues(values);
      },
      build: () => TermsOfUseBloc(),
      act: (TermsOfUseBloc bloc) => bloc.add(TermsOfUseAcceptanceRequested()),
      expect: () => [true],
      verify: (TermsOfUseBloc bloc) async {
        final sharedPreferences = await SharedPreferences.getInstance();
        final hasAccepted =
            sharedPreferences.getBool(TermsOfUseBloc.termsOfUseAcceptanceKey);
        expect(hasAccepted, true);
      },
    );

    blocTest('accept terme of use',
        setUp: () {
          final Map<String, Object> values = <String, Object>{
            TermsOfUseBloc.termsOfUseAcceptanceKey: false
          };
          SharedPreferences.setMockInitialValues(values);
        },
        build: () => TermsOfUseBloc(),
        act: (TermsOfUseBloc bloc) => bloc.add(TermsOfUseAccepted()),
        expect: () => [true],
        verify: (TermsOfUseBloc bloc) async {
          final sharedPreferences = await SharedPreferences.getInstance();
          final hasAccepted =
              sharedPreferences.getBool(TermsOfUseBloc.termsOfUseAcceptanceKey);
          expect(hasAccepted, true);
        });
  });
}
