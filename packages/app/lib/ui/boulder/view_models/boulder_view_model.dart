import 'package:breizh_blok_mobile/data/repositories/boulder/boulder_repository.dart';
import 'package:breizh_blok_mobile/domain/entities/boulder/boulder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'boulder_view_model.freezed.dart';

class BoulderViewModel extends Bloc<BoulderEvents, BoulderStates> {
  BoulderViewModel({required this.repository, required this.id})
    : super(const BoulderLoading()) {
    on<BoulderEvents>((event, emit) async {
      switch (event) {
        case BoulderRequested():
          {
            try {
              emit(const BoulderLoading());
              final boulder = await _findBoulder();
              emit(BoulderOK(boulder: boulder));
            } catch (e) {
              emit(BoulderError(error: e));
            }
          }
      }
    });
    add(const BoulderRequested());
  }

  final BoulderRepository repository;
  final String id;

  Future<Boulder> _findBoulder() {
    return repository.find(id);
  }
}

@freezed
sealed class BoulderEvents with _$BoulderEvents {
  const BoulderEvents._();

  const factory BoulderEvents.requested() = BoulderRequested;
}

@freezed
sealed class BoulderStates with _$BoulderStates {
  const BoulderStates._();

  const factory BoulderStates.loading() = BoulderLoading;
  const factory BoulderStates.ok({required Boulder boulder}) = BoulderOK;
  const factory BoulderStates.error({Object? error}) = BoulderError;
}
