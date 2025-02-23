// Mocks generated by Mockito 5.4.4 from annotations
// in breizh_blok_mobile/test/data/services/local/download_area_service_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i7;
import 'dart:typed_data' as _i8;

import 'package:breizh_blok_mobile/data/data_sources/local/model/image_boulder_cache.dart'
    as _i6;
import 'package:file/file.dart' as _i5;
import 'package:flutter_cache_manager/flutter_cache_manager.dart' as _i2;
import 'package:flutter_cache_manager/src/cache_store.dart' as _i3;
import 'package:flutter_cache_manager/src/web/web_helper.dart' as _i4;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeCacheManager_0 extends _i1.SmartFake implements _i2.CacheManager {
  _FakeCacheManager_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeConfig_1 extends _i1.SmartFake implements _i2.Config {
  _FakeConfig_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeCacheStore_2 extends _i1.SmartFake implements _i3.CacheStore {
  _FakeCacheStore_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeWebHelper_3 extends _i1.SmartFake implements _i4.WebHelper {
  _FakeWebHelper_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeFile_4 extends _i1.SmartFake implements _i5.File {
  _FakeFile_4(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeFileInfo_5 extends _i1.SmartFake implements _i2.FileInfo {
  _FakeFileInfo_5(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [ImageBoulderCache].
///
/// See the documentation for Mockito's code generation for more information.
class MockImageBoulderCache extends _i1.Mock implements _i6.ImageBoulderCache {
  @override
  _i2.CacheManager get cache => (super.noSuchMethod(
        Invocation.getter(#cache),
        returnValue: _FakeCacheManager_0(
          this,
          Invocation.getter(#cache),
        ),
        returnValueForMissingStub: _FakeCacheManager_0(
          this,
          Invocation.getter(#cache),
        ),
      ) as _i2.CacheManager);
}

/// A class which mocks [CacheManager].
///
/// See the documentation for Mockito's code generation for more information.
class MockCacheManager extends _i1.Mock implements _i2.CacheManager {
  @override
  _i2.Config get config => (super.noSuchMethod(
        Invocation.getter(#config),
        returnValue: _FakeConfig_1(
          this,
          Invocation.getter(#config),
        ),
        returnValueForMissingStub: _FakeConfig_1(
          this,
          Invocation.getter(#config),
        ),
      ) as _i2.Config);
  @override
  _i3.CacheStore get store => (super.noSuchMethod(
        Invocation.getter(#store),
        returnValue: _FakeCacheStore_2(
          this,
          Invocation.getter(#store),
        ),
        returnValueForMissingStub: _FakeCacheStore_2(
          this,
          Invocation.getter(#store),
        ),
      ) as _i3.CacheStore);
  @override
  _i4.WebHelper get webHelper => (super.noSuchMethod(
        Invocation.getter(#webHelper),
        returnValue: _FakeWebHelper_3(
          this,
          Invocation.getter(#webHelper),
        ),
        returnValueForMissingStub: _FakeWebHelper_3(
          this,
          Invocation.getter(#webHelper),
        ),
      ) as _i4.WebHelper);
  @override
  _i7.Future<_i5.File> getSingleFile(
    String? url, {
    String? key,
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #getSingleFile,
          [url],
          {
            #key: key,
            #headers: headers,
          },
        ),
        returnValue: _i7.Future<_i5.File>.value(_FakeFile_4(
          this,
          Invocation.method(
            #getSingleFile,
            [url],
            {
              #key: key,
              #headers: headers,
            },
          ),
        )),
        returnValueForMissingStub: _i7.Future<_i5.File>.value(_FakeFile_4(
          this,
          Invocation.method(
            #getSingleFile,
            [url],
            {
              #key: key,
              #headers: headers,
            },
          ),
        )),
      ) as _i7.Future<_i5.File>);
  @override
  _i7.Stream<_i2.FileInfo> getFile(
    String? url, {
    String? key,
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #getFile,
          [url],
          {
            #key: key,
            #headers: headers,
          },
        ),
        returnValue: _i7.Stream<_i2.FileInfo>.empty(),
        returnValueForMissingStub: _i7.Stream<_i2.FileInfo>.empty(),
      ) as _i7.Stream<_i2.FileInfo>);
  @override
  _i7.Stream<_i2.FileResponse> getFileStream(
    String? url, {
    String? key,
    Map<String, String>? headers,
    bool? withProgress = false,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #getFileStream,
          [url],
          {
            #key: key,
            #headers: headers,
            #withProgress: withProgress,
          },
        ),
        returnValue: _i7.Stream<_i2.FileResponse>.empty(),
        returnValueForMissingStub: _i7.Stream<_i2.FileResponse>.empty(),
      ) as _i7.Stream<_i2.FileResponse>);
  @override
  _i7.Future<_i2.FileInfo> downloadFile(
    String? url, {
    String? key,
    Map<String, String>? authHeaders,
    bool? force = false,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #downloadFile,
          [url],
          {
            #key: key,
            #authHeaders: authHeaders,
            #force: force,
          },
        ),
        returnValue: _i7.Future<_i2.FileInfo>.value(_FakeFileInfo_5(
          this,
          Invocation.method(
            #downloadFile,
            [url],
            {
              #key: key,
              #authHeaders: authHeaders,
              #force: force,
            },
          ),
        )),
        returnValueForMissingStub:
            _i7.Future<_i2.FileInfo>.value(_FakeFileInfo_5(
          this,
          Invocation.method(
            #downloadFile,
            [url],
            {
              #key: key,
              #authHeaders: authHeaders,
              #force: force,
            },
          ),
        )),
      ) as _i7.Future<_i2.FileInfo>);
  @override
  _i7.Future<_i2.FileInfo?> getFileFromCache(
    String? key, {
    bool? ignoreMemCache = false,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #getFileFromCache,
          [key],
          {#ignoreMemCache: ignoreMemCache},
        ),
        returnValue: _i7.Future<_i2.FileInfo?>.value(),
        returnValueForMissingStub: _i7.Future<_i2.FileInfo?>.value(),
      ) as _i7.Future<_i2.FileInfo?>);
  @override
  _i7.Future<_i2.FileInfo?> getFileFromMemory(String? key) =>
      (super.noSuchMethod(
        Invocation.method(
          #getFileFromMemory,
          [key],
        ),
        returnValue: _i7.Future<_i2.FileInfo?>.value(),
        returnValueForMissingStub: _i7.Future<_i2.FileInfo?>.value(),
      ) as _i7.Future<_i2.FileInfo?>);
  @override
  _i7.Future<_i5.File> putFile(
    String? url,
    _i8.Uint8List? fileBytes, {
    String? key,
    String? eTag,
    Duration? maxAge = const Duration(days: 30),
    String? fileExtension = r'file',
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #putFile,
          [
            url,
            fileBytes,
          ],
          {
            #key: key,
            #eTag: eTag,
            #maxAge: maxAge,
            #fileExtension: fileExtension,
          },
        ),
        returnValue: _i7.Future<_i5.File>.value(_FakeFile_4(
          this,
          Invocation.method(
            #putFile,
            [
              url,
              fileBytes,
            ],
            {
              #key: key,
              #eTag: eTag,
              #maxAge: maxAge,
              #fileExtension: fileExtension,
            },
          ),
        )),
        returnValueForMissingStub: _i7.Future<_i5.File>.value(_FakeFile_4(
          this,
          Invocation.method(
            #putFile,
            [
              url,
              fileBytes,
            ],
            {
              #key: key,
              #eTag: eTag,
              #maxAge: maxAge,
              #fileExtension: fileExtension,
            },
          ),
        )),
      ) as _i7.Future<_i5.File>);
  @override
  _i7.Future<_i5.File> putFileStream(
    String? url,
    _i7.Stream<List<int>>? source, {
    String? key,
    String? eTag,
    Duration? maxAge = const Duration(days: 30),
    String? fileExtension = r'file',
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #putFileStream,
          [
            url,
            source,
          ],
          {
            #key: key,
            #eTag: eTag,
            #maxAge: maxAge,
            #fileExtension: fileExtension,
          },
        ),
        returnValue: _i7.Future<_i5.File>.value(_FakeFile_4(
          this,
          Invocation.method(
            #putFileStream,
            [
              url,
              source,
            ],
            {
              #key: key,
              #eTag: eTag,
              #maxAge: maxAge,
              #fileExtension: fileExtension,
            },
          ),
        )),
        returnValueForMissingStub: _i7.Future<_i5.File>.value(_FakeFile_4(
          this,
          Invocation.method(
            #putFileStream,
            [
              url,
              source,
            ],
            {
              #key: key,
              #eTag: eTag,
              #maxAge: maxAge,
              #fileExtension: fileExtension,
            },
          ),
        )),
      ) as _i7.Future<_i5.File>);
  @override
  _i7.Future<void> removeFile(String? key) => (super.noSuchMethod(
        Invocation.method(
          #removeFile,
          [key],
        ),
        returnValue: _i7.Future<void>.value(),
        returnValueForMissingStub: _i7.Future<void>.value(),
      ) as _i7.Future<void>);
  @override
  _i7.Future<void> emptyCache() => (super.noSuchMethod(
        Invocation.method(
          #emptyCache,
          [],
        ),
        returnValue: _i7.Future<void>.value(),
        returnValueForMissingStub: _i7.Future<void>.value(),
      ) as _i7.Future<void>);
  @override
  _i7.Future<void> dispose() => (super.noSuchMethod(
        Invocation.method(
          #dispose,
          [],
        ),
        returnValue: _i7.Future<void>.value(),
        returnValueForMissingStub: _i7.Future<void>.value(),
      ) as _i7.Future<void>);
}
