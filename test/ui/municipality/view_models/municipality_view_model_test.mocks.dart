// Mocks generated by Mockito 5.4.5 from annotations
// in breizh_blok_mobile/test/ui/municipality/view_models/municipality_view_model_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i6;

import 'package:breizh_blok_mobile/data/data_sources/api/api_client.dart'
    as _i2;
import 'package:breizh_blok_mobile/data/data_sources/api/model/paginated_collection.dart'
    as _i4;
import 'package:breizh_blok_mobile/data/repositories/municipality/municipality_repository.dart'
    as _i5;
import 'package:breizh_blok_mobile/domain/models/municipality/municipality.dart'
    as _i3;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: must_be_immutable
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeApiClient_0 extends _i1.SmartFake implements _i2.ApiClient {
  _FakeApiClient_0(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

class _FakeMunicipality_1 extends _i1.SmartFake implements _i3.Municipality {
  _FakeMunicipality_1(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

class _FakePaginatedCollection_2<T> extends _i1.SmartFake
    implements _i4.PaginatedCollection<T> {
  _FakePaginatedCollection_2(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

/// A class which mocks [MunicipalityRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockMunicipalityRepository extends _i1.Mock
    implements _i5.MunicipalityRepository {
  @override
  _i2.ApiClient get httpClient =>
      (super.noSuchMethod(
            Invocation.getter(#httpClient),
            returnValue: _FakeApiClient_0(this, Invocation.getter(#httpClient)),
            returnValueForMissingStub: _FakeApiClient_0(
              this,
              Invocation.getter(#httpClient),
            ),
          )
          as _i2.ApiClient);
  @override
  _i6.Future<_i3.Municipality> find(String? id) =>
      (super.noSuchMethod(
            Invocation.method(#find, [id]),
            returnValue: _i6.Future<_i3.Municipality>.value(
              _FakeMunicipality_1(this, Invocation.method(#find, [id])),
            ),
            returnValueForMissingStub: _i6.Future<_i3.Municipality>.value(
              _FakeMunicipality_1(this, Invocation.method(#find, [id])),
            ),
          )
          as _i6.Future<_i3.Municipality>);
  @override
  _i6.Future<_i4.PaginatedCollection<_i3.Municipality>> findBy({
    Map<String, List<String>>? queryParams,
  }) =>
      (super.noSuchMethod(
            Invocation.method(#findBy, [], {#queryParams: queryParams}),
            returnValue:
                _i6.Future<_i4.PaginatedCollection<_i3.Municipality>>.value(
                  _FakePaginatedCollection_2<_i3.Municipality>(
                    this,
                    Invocation.method(#findBy, [], {#queryParams: queryParams}),
                  ),
                ),
            returnValueForMissingStub:
                _i6.Future<_i4.PaginatedCollection<_i3.Municipality>>.value(
                  _FakePaginatedCollection_2<_i3.Municipality>(
                    this,
                    Invocation.method(#findBy, [], {#queryParams: queryParams}),
                  ),
                ),
          )
          as _i6.Future<_i4.PaginatedCollection<_i3.Municipality>>);
}
