import 'package:breizh_blok_mobile/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetLocaleService {
  Future<Locale> call() async {
    final prefs = await SharedPreferences.getInstance();

    final localePref = prefs.getString(kLocalePrefs);

    if (localePref == null) {
      return WidgetsBinding.instance.platformDispatcher.locale;
    }

    final localeFromPref = Locale(localePref);

    if (AppLocalizations.supportedLocales.contains(localeFromPref)) {
      return localeFromPref;
    }

    return const Locale('fr');
  }
}
