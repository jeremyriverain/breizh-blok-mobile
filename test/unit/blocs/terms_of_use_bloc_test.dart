import 'package:bloc_test/bloc_test.dart';
import 'package:breizh_blok_mobile/blocs/terms_of_use_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  group('TermsOfUseBloc', () {
    blocTest<TermsOfUseBloc, bool?>(
      'default state OK - key acceptance not present',
      setUp: () {
        SharedPreferences.setMockInitialValues({});
      },
      build: TermsOfUseBloc.new,
      act: (TermsOfUseBloc bloc) => bloc.add(TermsOfUseAcceptanceRequested()),
      expect: () => [false],
      verify: (TermsOfUseBloc bloc) async {
        final sharedPreferences = await SharedPreferences.getInstance();
        final hasAccepted =
            sharedPreferences.getBool(TermsOfUseBloc.termsOfUseAcceptanceKey);
        expect(hasAccepted, null);
      },
    );

    blocTest<TermsOfUseBloc, bool?>(
      'default state OK - not accepted',
      setUp: () {
        final values = <String, Object>{
          TermsOfUseBloc.termsOfUseAcceptanceKey: false,
        };
        SharedPreferences.setMockInitialValues(values);
      },
      build: TermsOfUseBloc.new,
      act: (TermsOfUseBloc bloc) => bloc.add(TermsOfUseAcceptanceRequested()),
      expect: () => [false],
      verify: (TermsOfUseBloc bloc) async {
        final sharedPreferences = await SharedPreferences.getInstance();
        final hasAccepted =
            sharedPreferences.getBool(TermsOfUseBloc.termsOfUseAcceptanceKey);
        expect(hasAccepted, false);
      },
    );

    blocTest<TermsOfUseBloc, bool?>(
      'default state OK - accepted',
      setUp: () {
        final values = <String, Object>{
          TermsOfUseBloc.termsOfUseAcceptanceKey: true,
        };
        SharedPreferences.setMockInitialValues(values);
      },
      build: TermsOfUseBloc.new,
      act: (TermsOfUseBloc bloc) => bloc.add(TermsOfUseAcceptanceRequested()),
      expect: () => [true],
      verify: (TermsOfUseBloc bloc) async {
        final sharedPreferences = await SharedPreferences.getInstance();
        final hasAccepted =
            sharedPreferences.getBool(TermsOfUseBloc.termsOfUseAcceptanceKey);
        expect(hasAccepted, true);
      },
    );

    blocTest<TermsOfUseBloc, bool?>(
      'accept terme of use',
      setUp: () {
        final values = <String, Object>{
          TermsOfUseBloc.termsOfUseAcceptanceKey: false,
        };
        SharedPreferences.setMockInitialValues(values);
      },
      build: TermsOfUseBloc.new,
      act: (TermsOfUseBloc bloc) => bloc.add(TermsOfUseAccepted()),
      expect: () => [true],
      verify: (TermsOfUseBloc bloc) async {
        final sharedPreferences = await SharedPreferences.getInstance();
        final hasAccepted =
            sharedPreferences.getBool(TermsOfUseBloc.termsOfUseAcceptanceKey);
        expect(hasAccepted, true);
      },
    );
  });
}
