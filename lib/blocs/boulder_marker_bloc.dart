import 'package:breizh_blok_mobile/blocs/boulder_filter_bloc.dart';
import 'package:breizh_blok_mobile/data/repositories/boulder_marker/boulder_marker_repository.dart';
import 'package:breizh_blok_mobile/domain/models/boulder_marker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'boulder_marker_bloc.freezed.dart';

class BoulderMarkerBloc extends Bloc<BoulderMarkerEvent, BoulderMarkerState> {
  BoulderMarkerBloc({
    required this.repository,
  }) : super(
          const BoulderMarkerState(
            markers: [],
            isLoading: false,
            error: '',
          ),
        ) {
    on<BoulderMarkerRequested>((event, emit) async {
      try {
        emit(state.copyWith(isLoading: true, error: ''));

        // ignore: omit_local_variable_types
        final Map<String, List<String>> queryParams = {
          'pagination': ['false'],
          'groups[]': ['Boulder:map'],
          'rock.boulderArea.id[]': event.filterState.boulderAreas
              .map((e) => e.iri.replaceAll('/boulder_areas/', ''))
              .toList(),
        };

        final data = await repository.findBy(
          queryParams: queryParams,
          offlineFirst: event.offlineFirst,
        );
        emit(
          state.copyWith(
            markers: data,
          ),
        );
      } catch (error) {
        emit(
          state.copyWith(
            error: error.toString(),
          ),
        );
      } finally {
        emit(
          state.copyWith(
            isLoading: false,
          ),
        );
      }
    });
  }
  final BoulderMarkerRepository repository;
}

abstract class BoulderMarkerEvent {}

class BoulderMarkerRequested extends BoulderMarkerEvent {
  BoulderMarkerRequested({
    required this.filterState,
    this.offlineFirst = false,
  });

  final BoulderFilterState filterState;
  final bool offlineFirst;
}

@freezed
abstract class BoulderMarkerState with _$BoulderMarkerState {
  const factory BoulderMarkerState({
    required List<BoulderMarker> markers,
    required bool isLoading,
    required String error,
  }) = _BoulderMarkerState;
}
