import 'package:breizh_blok_mobile/i18n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'locale_view_model.freezed.dart';

const kLocalePrefs = 'locale';

class LocaleViewModel extends Bloc<LocaleEvent, LocaleState> {
  LocaleViewModel({required this.locale}) : super(LocaleState(locale: locale)) {
    on<LocaleUpdated>((event, emit) async {
      emit(LocaleState(locale: event.locale));
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(kLocalePrefs, event.locale.languageCode);
    });
  }

  static Future<LocaleViewModel> create() async {
    final prefs = await SharedPreferences.getInstance();

    final localePref = prefs.getString(kLocalePrefs);

    if (localePref == null) {
      final platformLocale = WidgetsBinding.instance.platformDispatcher.locale;
      return LocaleViewModel(
        locale:
            AppLocalizations.supportedLocales.contains(platformLocale)
                ? platformLocale
                : const Locale('fr'),
      );
    }

    final localeFromPref = Locale(localePref);

    if (AppLocalizations.supportedLocales.contains(localeFromPref)) {
      return LocaleViewModel(locale: localeFromPref);
    }

    return LocaleViewModel(locale: const Locale('fr'));
  }

  final Locale locale;
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
