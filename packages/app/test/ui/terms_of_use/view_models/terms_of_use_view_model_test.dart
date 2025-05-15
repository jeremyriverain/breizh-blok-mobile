import 'package:bloc_test/bloc_test.dart';
import 'package:breizh_blok_mobile/ui/terms_of_use/view_models/terms_of_use_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  group('TermsOfUseViewModel', () {
    late SharedPreferences preferences;

    blocTest<TermsOfUseViewModel, bool?>(
      'default state OK - key acceptance not present',
      setUp: () async {
        SharedPreferences.setMockInitialValues({});
        preferences = await SharedPreferences.getInstance();
      },
      build: () => TermsOfUseViewModel(preferences: preferences),
      act:
          (TermsOfUseViewModel bloc) =>
              bloc.add(const TermsOfUseAcceptanceRequested()),
      expect: () => [false],
      verify: (TermsOfUseViewModel bloc) async {
        final sharedPreferences = await SharedPreferences.getInstance();
        final hasAccepted = sharedPreferences.getBool(
          TermsOfUseViewModel.termsOfUseAcceptanceKey,
        );
        expect(hasAccepted, null);
      },
    );

    blocTest<TermsOfUseViewModel, bool?>(
      'default state OK - not accepted',
      setUp: () async {
        SharedPreferences.setMockInitialValues({
          TermsOfUseViewModel.termsOfUseAcceptanceKey: false,
        });
        preferences = await SharedPreferences.getInstance();
      },
      build: () => TermsOfUseViewModel(preferences: preferences),
      act:
          (TermsOfUseViewModel bloc) =>
              bloc.add(const TermsOfUseAcceptanceRequested()),
      expect: () => [false],
      verify: (TermsOfUseViewModel bloc) async {
        final sharedPreferences = await SharedPreferences.getInstance();
        final hasAccepted = sharedPreferences.getBool(
          TermsOfUseViewModel.termsOfUseAcceptanceKey,
        );
        expect(hasAccepted, false);
      },
    );

    blocTest<TermsOfUseViewModel, bool?>(
      'default state OK - accepted',
      setUp: () async {
        SharedPreferences.setMockInitialValues({
          TermsOfUseViewModel.termsOfUseAcceptanceKey: true,
        });
        preferences = await SharedPreferences.getInstance();
      },
      build: () => TermsOfUseViewModel(preferences: preferences),
      act:
          (TermsOfUseViewModel bloc) =>
              bloc.add(const TermsOfUseAcceptanceRequested()),
      expect: () => [true],
      verify: (TermsOfUseViewModel bloc) async {
        final sharedPreferences = await SharedPreferences.getInstance();
        final hasAccepted = sharedPreferences.getBool(
          TermsOfUseViewModel.termsOfUseAcceptanceKey,
        );
        expect(hasAccepted, true);
      },
    );

    blocTest<TermsOfUseViewModel, bool?>(
      'accept term of use',
      setUp: () async {
        SharedPreferences.setMockInitialValues({
          TermsOfUseViewModel.termsOfUseAcceptanceKey: false,
        });
        preferences = await SharedPreferences.getInstance();
      },
      build: () => TermsOfUseViewModel(preferences: preferences),
      act: (TermsOfUseViewModel bloc) => bloc.add(const TermsOfUseAccepted()),
      expect: () => [false, true],
      verify: (TermsOfUseViewModel bloc) async {
        final sharedPreferences = await SharedPreferences.getInstance();
        final hasAccepted = sharedPreferences.getBool(
          TermsOfUseViewModel.termsOfUseAcceptanceKey,
        );
        expect(hasAccepted, true);
      },
    );
  });
}
