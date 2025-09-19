import 'package:breizh_blok_mobile/i18n/app_localizations.dart';
import 'package:breizh_blok_mobile/service_locator/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'locale.g.dart';

const kLocalePrefs = 'locale';
const kDefaultLocale = 'fr';

@riverpod
class MyLocale extends _$MyLocale {
  @override
  Locale build() {
    final prefs = ref.watch(sharedPreferencesProvider);
    final localePref = prefs.getString(kLocalePrefs);

    if (localePref == null) {
      MapboxMapsOptions.setLanguage(kDefaultLocale);

      final platformLocale = WidgetsBinding.instance.platformDispatcher.locale;
      return AppLocalizations.supportedLocales.contains(platformLocale)
          ? platformLocale
          : const Locale(kDefaultLocale);
    }

    final localeFromPref = Locale(localePref);

    if (AppLocalizations.supportedLocales.contains(localeFromPref)) {
      MapboxMapsOptions.setLanguage(localePref);

      return localeFromPref;
    }

    MapboxMapsOptions.setLanguage(kDefaultLocale);

    return const Locale(kDefaultLocale);
  }

  Future<void> setLocale(Locale locale) async {
    final sharedPreferences = ref.watch(sharedPreferencesProvider);
    MapboxMapsOptions.setLanguage(locale.languageCode);

    await sharedPreferences.setString(
      kLocalePrefs,
      locale.languageCode,
    );

    state = locale;
  }
}
