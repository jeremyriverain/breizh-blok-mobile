import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TermsOfUseBloc extends Bloc<TermsOfUseEvent, bool?> {
  static const String termsOfUseAcceptanceKey = 'hasAcceptedTermsOfUse';

  TermsOfUseBloc() : super(null) {
    on<TermsOfUseAcceptanceRequested>((event, emit) async {
      try {
        final prefs = await SharedPreferences.getInstance();
        final hasAccepted = prefs.getBool(termsOfUseAcceptanceKey) ?? false;
        emit(hasAccepted);
      } catch (_) {}
    });

    on<TermsOfUseAccepted>((event, emit) async {
      emit(true);
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool(termsOfUseAcceptanceKey, true);
    });
  }
}

abstract class TermsOfUseEvent {}

class TermsOfUseAcceptanceRequested extends TermsOfUseEvent {}

class TermsOfUseAccepted extends TermsOfUseEvent {}
