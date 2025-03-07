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
              final boulderAreas = await _findAll(orderParam: orderParam);
              emit(
                ListDownloadedBoulderAreasOK(
                  boulderAreas: boulderAreas,
                  orderParam: orderParam,
                ),
              );
            } catch (e) {
              emit(ListDownloadedBoulderAreasError(error: e));
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

  Future<List<DownloadedBoulderArea>> _findAll({
    required ApiOrderParam orderParam,
  }) async {
    return database.allDownloads(orderParam: orderParam);
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
  const factory ListDownloadedBoulderAreasStates.error({Object? error}) =
      ListDownloadedBoulderAreasError;
}
