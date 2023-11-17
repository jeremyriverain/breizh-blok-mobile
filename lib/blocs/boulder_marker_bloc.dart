import 'package:breizh_blok_mobile/blocs/boulder_filter_bloc.dart';
import 'package:breizh_blok_mobile/models/boulder_marker.dart';
import 'package:breizh_blok_mobile/models/order_query_param.dart';
import 'package:breizh_blok_mobile/repositories/boulder_marker_repository.dart';
import 'package:breizh_blok_mobile/utils/boulder_list_query_params_builder.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          ...BoulderListQueryParamsBuilder.compute(
            filterState: event.filterState,
            orderQueryParam: event.orderQueryParam,
            grades: {},
          ),
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
    required this.orderQueryParam,
    this.offlineFirst = false,
  });

  final BoulderFilterState filterState;
  final OrderQueryParam orderQueryParam;
  final bool offlineFirst;
}

class BoulderMarkerState extends Equatable {
  const BoulderMarkerState({
    required this.markers,
    required this.isLoading,
    required this.error,
  });

  final List<BoulderMarker> markers;
  final bool isLoading;
  final String error;

  @override
  List<Object?> get props => [markers, isLoading, error];

  BoulderMarkerState copyWith({
    List<BoulderMarker>? markers,
    bool? isLoading,
    String? error,
  }) {
    return BoulderMarkerState(
      markers: markers ?? this.markers,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}
