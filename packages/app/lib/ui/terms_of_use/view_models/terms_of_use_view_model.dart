import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'terms_of_use_view_model.freezed.dart';

class TermsOfUseViewModel extends Bloc<TermsOfUseEvents, bool?> {
  TermsOfUseViewModel({required this.preferences}) : super(null) {
    on<TermsOfUseEvents>((event, emit) async {
      switch (event) {
        case TermsOfUseAcceptanceRequested():
          _onTermsOfUseRequested(emit);
        case TermsOfUseAccepted():
          _onTermsOfUseAccepted(emit);
      }
    });

    add(const TermsOfUseAcceptanceRequested());
  }
  static const String termsOfUseAcceptanceKey = 'hasAcceptedTermsOfUse';

  final SharedPreferences preferences;

  void _onTermsOfUseRequested(Emitter<bool?> emit) {
    try {
      final hasAccepted = preferences.getBool(termsOfUseAcceptanceKey) ?? false;
      emit(hasAccepted);
    } catch (_) {}
  }

  void _onTermsOfUseAccepted(Emitter<bool?> emit) {
    emit(true);
    preferences.setBool(termsOfUseAcceptanceKey, true);
  }
}

@freezed
sealed class TermsOfUseEvents with _$TermsOfUseEvents {
  const TermsOfUseEvents._();

  const factory TermsOfUseEvents.requested() = TermsOfUseAcceptanceRequested;
  const factory TermsOfUseEvents.accepted() = TermsOfUseAccepted;
}
