import 'dart:async';

import 'package:breizh_blok_mobile/data/data_sources/api/model/api_order_param.dart';
import 'package:breizh_blok_mobile/data/data_sources/local/app_database.dart';
import 'package:breizh_blok_mobile/data/data_sources/local/model/downloaded_boulder_area.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'list_downloaded_boulder_areas_view_model.freezed.dart';

class ListDownloadedBoulderAreasViewModel
    extends
        Bloc<
          ListDownloadedBoulderAreasEvents,
          ListDownloadedBoulderAreasStates
        > {
  ListDownloadedBoulderAreasViewModel({required this.database})
    : super(const ListDownloadedBoulderAreasLoading()) {
    on<ListDownloadedBoulderAreasEvents>((event, emit) async {
      switch (event) {
        case ListDownloadedBoulderAreasRequested(:final orderParam):
          {
            try {
              emit(const ListDownloadedBoulderAreasLoading());

              await _streamSubscription?.cancel();

              final stream = _getDownloadsStream(orderParam: orderParam);
              _streamSubscription = stream.listen((event) => {});

              await emit.forEach(
                stream,
                onData:
                    (boulderAreas) => ListDownloadedBoulderAreasOK(
                      boulderAreas: boulderAreas,
                      orderParam: orderParam,
                    ),
                onError:
                    (_, _) =>
                        ListDownloadedBoulderAreasError(orderParam: orderParam),
              );
            } catch (e) {
              emit(ListDownloadedBoulderAreasError(orderParam: orderParam));
            }
          }
      }
    });

    add(
      const ListDownloadedBoulderAreasRequested(
        orderParam: ApiOrderParam(
          name: kIdOrderParam,
          direction: kDescendantDirection,
        ),
      ),
    );
  }

  final AppDatabase database;

  StreamSubscription<List<DownloadedBoulderArea>>? _streamSubscription;

  Stream<List<DownloadedBoulderArea>> _getDownloadsStream({
    required ApiOrderParam orderParam,
  }) {
    return database.allDownloads(orderParam: orderParam);
  }

  @override
  Future<void> close() async {
    await _streamSubscription?.cancel();
    return super.close();
  }
}

@freezed
sealed class ListDownloadedBoulderAreasEvents
    with _$ListDownloadedBoulderAreasEvents {
  const ListDownloadedBoulderAreasEvents._();

  const factory ListDownloadedBoulderAreasEvents.requested({
    required ApiOrderParam orderParam,
  }) = ListDownloadedBoulderAreasRequested;
}

@freezed
sealed class ListDownloadedBoulderAreasStates
    with _$ListDownloadedBoulderAreasStates {
  const ListDownloadedBoulderAreasStates._();

  const factory ListDownloadedBoulderAreasStates.loading() =
      ListDownloadedBoulderAreasLoading;
  const factory ListDownloadedBoulderAreasStates.ok({
    required List<DownloadedBoulderArea> boulderAreas,
    required ApiOrderParam orderParam,
  }) = ListDownloadedBoulderAreasOK;
  const factory ListDownloadedBoulderAreasStates.error({
    required ApiOrderParam orderParam,
  }) = ListDownloadedBoulderAreasError;
}
