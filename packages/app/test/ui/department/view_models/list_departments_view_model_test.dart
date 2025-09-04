import 'package:bloc_test/bloc_test.dart';
import 'package:breizh_blok_mobile/data/data_sources/api/model/paginated_collection.dart';
import 'package:breizh_blok_mobile/data/repositories/department/department_repository.dart';
import 'package:breizh_blok_mobile/domain/entities/department/department.dart';
import 'package:breizh_blok_mobile/ui/department/view_models/list_departments_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mocks.dart';
import '../../../test_utils.dart';

void main() {
  group('ListDepartmentsViewModel', () {
    late DepartmentRepository repository;

    const paginatedDepartments = PaginatedCollection<Department>(
      items: [fakeDepartment],
      totalItems: 1,
    );

    setUp(() {
      repository = MockDepartmentRepository();
    });

    blocTest<ListDepartmentsViewModel, ListDepartmentsStates>(
      'when it initializes, then it fetches the departments',
      setUp: () {
        when(
          () => repository.findAll(),
        ).thenAnswer((_) async => paginatedDepartments);
      },
      build: () => ListDepartmentsViewModel(repository: repository),
      expect: () => [
        const ListDepartmentsLoading(),
        const ListDepartmentsOK(departments: paginatedDepartments),
      ],
    );

    blocTest<ListDepartmentsViewModel, ListDepartmentsStates>(
      'the state is in error when the network call fails',
      setUp: () {
        when(() => repository.findAll()).thenThrow(Exception('foo'));
      },
      build: () => ListDepartmentsViewModel(repository: repository),
      expect: () => [
        const ListDepartmentsLoading(),
        isA<ListDepartmentsError>().having(
          (e) => e.error.toString(),
          'error',
          'Exception: foo',
        ),
      ],
    );

    blocTest<ListDepartmentsViewModel, ListDepartmentsStates>(
      'when departments are requested, then it fetches the departments',
      setUp: () {
        when(
          () => repository.findAll(),
        ).thenAnswer((_) async => paginatedDepartments);
      },
      build: () => ListDepartmentsViewModel(repository: repository),
      act: (bloc) => bloc.add(const ListDepartmentsEvents.requested()),
      expect: () => [
        const ListDepartmentsLoading(),
        const ListDepartmentsStates.ok(departments: paginatedDepartments),
        const ListDepartmentsLoading(),
        const ListDepartmentsStates.ok(departments: paginatedDepartments),
      ],
    );
  });
}
