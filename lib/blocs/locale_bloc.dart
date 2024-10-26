import 'package:breizh_blok_mobile/constants.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleBloc extends Bloc<LocaleEvent, LocaleState> {
  LocaleBloc({
    required this.locale,
  }) : super(
          LocaleState(
            locale: locale,
          ),
        ) {
    on<LocaleUpdated>((event, emit) async {
      emit(LocaleState(locale: event.locale));
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(kLocalePrefs, event.locale.languageCode);
    });
  }
  final Locale locale;
}

abstract class LocaleEvent {}

class LocaleUpdated extends LocaleEvent {
  LocaleUpdated({
    required this.locale,
  });

  final Locale locale;
}

class LocaleState extends Equatable {
  const LocaleState({
    required this.locale,
  });

  final Locale locale;

  @override
  List<Object?> get props => [locale];
}
