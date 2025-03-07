import 'package:breizh_blok_mobile/data/repositories/boulder_area/boulder_area_repository.dart';
import 'package:breizh_blok_mobile/domain/models/boulder_area/boulder_area.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'boulder_area_view_model.freezed.dart';

class BoulderAreaViewModel extends Bloc<BoulderAreaEvents, BoulderAreaStates> {
  BoulderAreaViewModel({required this.repository, required this.id})
    : super(const BoulderAreaLoading()) {
    on<BoulderAreaEvents>((event, emit) async {
      switch (event) {
        case BoulderAreaRequested():
          {
            try {
              emit(const BoulderAreaLoading());
              final boulderArea = await _findBoulderArea();
              emit(BoulderAreaOK(boulderArea: boulderArea));
            } catch (e) {
              emit(BoulderAreaError(error: e));
            }
          }
      }
    });
    add(const BoulderAreaRequested());
  }

  final BoulderAreaRepository repository;
  final String id;

  Future<BoulderArea> _findBoulderArea() {
    return repository.find(id);
  }
}

@freezed
sealed class BoulderAreaEvents with _$BoulderAreaEvents {
  const BoulderAreaEvents._();

  const factory BoulderAreaEvents.requested() = BoulderAreaRequested;
}

@freezed
sealed class BoulderAreaStates with _$BoulderAreaStates {
  const BoulderAreaStates._();

  const factory BoulderAreaStates.loading() = BoulderAreaLoading;
  const factory BoulderAreaStates.ok({required BoulderArea boulderArea}) =
      BoulderAreaOK;
  const factory BoulderAreaStates.error({Object? error}) = BoulderAreaError;
}
