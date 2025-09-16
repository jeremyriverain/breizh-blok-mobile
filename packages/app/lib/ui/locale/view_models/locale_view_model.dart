import 'package:breizh_blok_mobile/i18n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'locale_view_model.freezed.dart';

const kLocalePrefs = 'locale';
const kDefaultLocale = 'fr';

class LocaleViewModel extends Bloc<LocaleEvent, LocaleState> {
  LocaleViewModel({required this.locale, required this.sharedPreferences})
    : super(LocaleState(locale: locale)) {
    on<LocaleUpdated>((event, emit) async {
      emit(LocaleState(locale: event.locale));
      MapboxMapsOptions.setLanguage(event.locale.languageCode);

      await sharedPreferences.setString(
        kLocalePrefs,
        event.locale.languageCode,
      );
    });
  }

  // ignore: prefer_constructors_over_static_methods
  static LocaleViewModel create(SharedPreferences prefs) {
    final localePref = prefs.getString(kLocalePrefs);

    if (localePref == null) {
      MapboxMapsOptions.setLanguage(kDefaultLocale);

      final platformLocale = WidgetsBinding.instance.platformDispatcher.locale;
      return LocaleViewModel(
        locale: AppLocalizations.supportedLocales.contains(platformLocale)
            ? platformLocale
            : const Locale(kDefaultLocale),
        sharedPreferences: prefs,
      );
    }

    final localeFromPref = Locale(localePref);

    if (AppLocalizations.supportedLocales.contains(localeFromPref)) {
      MapboxMapsOptions.setLanguage(localePref);

      return LocaleViewModel(
        locale: localeFromPref,
        sharedPreferences: prefs,
      );
    }

    MapboxMapsOptions.setLanguage(kDefaultLocale);

    return LocaleViewModel(
      locale: const Locale(kDefaultLocale),
      sharedPreferences: prefs,
    );
  }

  final Locale locale;
  final SharedPreferences sharedPreferences;
}

abstract class LocaleEvent {}

class LocaleUpdated extends LocaleEvent {
  LocaleUpdated({required this.locale});

  final Locale locale;
}

@freezed
abstract class LocaleState with _$LocaleState {
  const factory LocaleState({required Locale locale}) = _LocaleState;
}
