// Mocks generated by Mockito 5.4.5 from annotations
// in breizh_blok_mobile/test/ui/boulder/view_models/boulder_bloc_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i7;

import 'package:breizh_blok_mobile/data/data_sources/api/api_client.dart'
    as _i4;
import 'package:breizh_blok_mobile/data/data_sources/api/model/paginated_collection.dart'
    as _i6;
import 'package:breizh_blok_mobile/data/data_sources/local/app_database.dart'
    as _i2;
import 'package:breizh_blok_mobile/data/repositories/boulder/boulder_repository.dart'
    as _i9;
import 'package:breizh_blok_mobile/domain/models/boulder/boulder.dart' as _i5;
import 'package:http/http.dart' as _i3;
import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i8;

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

class _FakeAppDatabase_0 extends _i1.SmartFake implements _i2.AppDatabase {
  _FakeAppDatabase_0(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

class _FakeClient_1 extends _i1.SmartFake implements _i3.Client {
  _FakeClient_1(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

class _FakeApiClient_2 extends _i1.SmartFake implements _i4.ApiClient {
  _FakeApiClient_2(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

class _FakeBoulder_3 extends _i1.SmartFake implements _i5.Boulder {
  _FakeBoulder_3(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

class _FakePaginatedCollection_4<T> extends _i1.SmartFake
    implements _i6.PaginatedCollection<T> {
  _FakePaginatedCollection_4(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

/// A class which mocks [ApiClient].
///
/// See the documentation for Mockito's code generation for more information.
class MockApiClient extends _i1.Mock implements _i4.ApiClient {
  @override
  _i2.AppDatabase get database =>
      (super.noSuchMethod(
            Invocation.getter(#database),
            returnValue: _FakeAppDatabase_0(this, Invocation.getter(#database)),
            returnValueForMissingStub: _FakeAppDatabase_0(
              this,
              Invocation.getter(#database),
            ),
          )
          as _i2.AppDatabase);

  @override
  _i3.Client get httpClient =>
      (super.noSuchMethod(
            Invocation.getter(#httpClient),
            returnValue: _FakeClient_1(this, Invocation.getter(#httpClient)),
            returnValueForMissingStub: _FakeClient_1(
              this,
              Invocation.getter(#httpClient),
            ),
          )
          as _i3.Client);

  @override
  _i7.Future<String> get(
    Uri? uri, {
    Map<String, String>? headers,
    Duration? timeout = const Duration(seconds: 7),
    bool? offlineFirst = false,
  }) =>
      (super.noSuchMethod(
            Invocation.method(
              #get,
              [uri],
              {
                #headers: headers,
                #timeout: timeout,
                #offlineFirst: offlineFirst,
              },
            ),
            returnValue: _i7.Future<String>.value(
              _i8.dummyValue<String>(
                this,
                Invocation.method(
                  #get,
                  [uri],
                  {
                    #headers: headers,
                    #timeout: timeout,
                    #offlineFirst: offlineFirst,
                  },
                ),
              ),
            ),
            returnValueForMissingStub: _i7.Future<String>.value(
              _i8.dummyValue<String>(
                this,
                Invocation.method(
                  #get,
                  [uri],
                  {
                    #headers: headers,
                    #timeout: timeout,
                    #offlineFirst: offlineFirst,
                  },
                ),
              ),
            ),
          )
          as _i7.Future<String>);

  @override
  String normalizeRequestPath(Uri? uri) =>
      (super.noSuchMethod(
            Invocation.method(#normalizeRequestPath, [uri]),
            returnValue: _i8.dummyValue<String>(
              this,
              Invocation.method(#normalizeRequestPath, [uri]),
            ),
            returnValueForMissingStub: _i8.dummyValue<String>(
              this,
              Invocation.method(#normalizeRequestPath, [uri]),
            ),
          )
          as String);
}

/// A class which mocks [BoulderRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockBoulderRepository extends _i1.Mock implements _i9.BoulderRepository {
  @override
  _i4.ApiClient get httpClient =>
      (super.noSuchMethod(
            Invocation.getter(#httpClient),
            returnValue: _FakeApiClient_2(this, Invocation.getter(#httpClient)),
            returnValueForMissingStub: _FakeApiClient_2(
              this,
              Invocation.getter(#httpClient),
            ),
          )
          as _i4.ApiClient);

  @override
  _i7.Future<_i5.Boulder> find(String? id) =>
      (super.noSuchMethod(
            Invocation.method(#find, [id]),
            returnValue: _i7.Future<_i5.Boulder>.value(
              _FakeBoulder_3(this, Invocation.method(#find, [id])),
            ),
            returnValueForMissingStub: _i7.Future<_i5.Boulder>.value(
              _FakeBoulder_3(this, Invocation.method(#find, [id])),
            ),
          )
          as _i7.Future<_i5.Boulder>);

  @override
  _i7.Future<_i6.PaginatedCollection<_i5.Boulder>> findBy({
    Map<String, List<String>>? queryParams,
    bool? offlineFirst = false,
    Duration? timeout,
  }) =>
      (super.noSuchMethod(
            Invocation.method(#findBy, [], {
              #queryParams: queryParams,
              #offlineFirst: offlineFirst,
              #timeout: timeout,
            }),
            returnValue: _i7.Future<_i6.PaginatedCollection<_i5.Boulder>>.value(
              _FakePaginatedCollection_4<_i5.Boulder>(
                this,
                Invocation.method(#findBy, [], {
                  #queryParams: queryParams,
                  #offlineFirst: offlineFirst,
                  #timeout: timeout,
                }),
              ),
            ),
            returnValueForMissingStub:
                _i7.Future<_i6.PaginatedCollection<_i5.Boulder>>.value(
                  _FakePaginatedCollection_4<_i5.Boulder>(
                    this,
                    Invocation.method(#findBy, [], {
                      #queryParams: queryParams,
                      #offlineFirst: offlineFirst,
                      #timeout: timeout,
                    }),
                  ),
                ),
          )
          as _i7.Future<_i6.PaginatedCollection<_i5.Boulder>>);
}
