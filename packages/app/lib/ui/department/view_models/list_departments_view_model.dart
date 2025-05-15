import 'package:breizh_blok_mobile/data/data_sources/api/model/paginated_collection.dart';
import 'package:breizh_blok_mobile/data/repositories/department/department_repository.dart';
import 'package:breizh_blok_mobile/domain/models/department/department.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'list_departments_view_model.freezed.dart';

class ListDepartmentsViewModel
    extends Bloc<ListDepartmentsEvents, ListDepartmentsStates> {
  ListDepartmentsViewModel({required this.repository})
    : super(const ListDepartmentsLoading()) {
    on<ListDepartmentsEvents>((event, emit) async {
      switch (event) {
        case ListDepartmentsRequested():
          {
            try {
              emit(const ListDepartmentsLoading());
              final departments = await _findAll();
              emit(ListDepartmentsOK(departments: departments));
            } catch (e) {
              emit(ListDepartmentsError(error: e));
            }
          }
      }
    });
    add(const ListDepartmentsRequested());
  }

  final DepartmentRepository repository;

  Future<PaginatedCollection<Department>> _findAll() {
    return repository.findAll();
  }
}

@freezed
sealed class ListDepartmentsEvents with _$ListDepartmentsEvents {
  const ListDepartmentsEvents._();

  const factory ListDepartmentsEvents.requested() = ListDepartmentsRequested;
}

@freezed
sealed class ListDepartmentsStates with _$ListDepartmentsStates {
  const ListDepartmentsStates._();

  const factory ListDepartmentsStates.loading() = ListDepartmentsLoading;
  const factory ListDepartmentsStates.ok({
    required PaginatedCollection<Department> departments,
  }) = ListDepartmentsOK;
  const factory ListDepartmentsStates.error({Object? error}) =
      ListDepartmentsError;
}
