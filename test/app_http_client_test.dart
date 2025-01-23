// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:breizh_blok_mobile/data/data_sources/api/api_client.dart';
import 'package:breizh_blok_mobile/data/data_sources/drift/app_database.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';

void main() {
  driftRuntimeOptions.dontWarnAboutMultipleDatabases = true;

  group('get', () {
    test('requests are persisted in the database', () async {
      final mockClient = MockClient((request) async {
        return http.Response(
          json.encode({
            'foo': request.url.path,
          }),
          200,
          request: request,
          headers: {'content-type': 'application/json'},
        );
      });
      final database = AppDatabase(NativeDatabase.memory());
      final httpClient = ApiClient(
        database: database,
        httpClient: mockClient,
      );

      final storedRequests = await database.select(database.dbRequests).get();
      expect(storedRequests.length, equals(0));

      expect(
        jsonDecode(
          await httpClient.get(
            Uri.http('example.com', '/foo'),
          ),
        ),
        {'foo': '/foo'},
      );

      final firstStoredRequest = await (database.select(database.dbRequests)
            ..where((tbl) => tbl.requestPath.equals('/foo')))
          .getSingle();

      expect(jsonDecode(firstStoredRequest.responseBody), {'foo': '/foo'});

      expect(
        jsonDecode(
          await httpClient.get(
            Uri.http('example.com', '/bar', {'foo': 'bar'}),
          ),
        ),
        {'foo': '/bar'},
      );

      final secondStoredRequest = await (database.select(database.dbRequests)
            ..where((tbl) => tbl.requestPath.equals('/bar?foo=bar')))
          .getSingle();

      expect(
        jsonDecode(secondStoredRequest.responseBody),
        {'foo': '/bar'},
      );
    });

    test(
        '''in offline context, persisted requests are returned if the path matches''',
        () async {
      final mockClient = MockClient((request) async {
        throw http.ClientException('client exception');
      });
      final database = AppDatabase(NativeDatabase.memory());
      final httpClient = ApiClient(
        database: database,
        httpClient: mockClient,
      );

      await database
          .into(database.dbRequests)
          .insert(const DbRequest(requestPath: '/foo', responseBody: 'bar'));

      expect(
        await httpClient.get(
          Uri.http('example.com', '/foo'),
        ),
        'bar',
      );
    });

    test(
        '''in offline context, an error is thrown if there is no persisted request''',
        () async {
      final mockClient = MockClient((request) async {
        throw http.ClientException('client exception');
      });
      final database = AppDatabase(NativeDatabase.memory());
      final httpClient = ApiClient(
        database: database,
        httpClient: mockClient,
      );

      await database
          .into(database.dbRequests)
          .insert(const DbRequest(requestPath: '/foo', responseBody: 'bar'));

      await expectLater(
        httpClient.get(
          Uri.http('example.com', '/bar'),
        ),
        throwsA(const TypeMatcher<http.ClientException>()),
      );
    });

    test(
        '''an error is thrown if api responds with HttpExceptionWithStatus, even if there is persisted request''',
        () async {
      final mockClient = MockClient((request) async {
        throw const HttpExceptionWithStatus(404, 'not found');
      });
      final database = AppDatabase(NativeDatabase.memory());
      final httpClient = ApiClient(
        database: database,
        httpClient: mockClient,
      );

      await database
          .into(database.dbRequests)
          .insert(const DbRequest(requestPath: '/foo', responseBody: 'bar'));

      await expectLater(
        httpClient.get(
          Uri.http('example.com', '/foo'),
        ),
        throwsA(const TypeMatcher<HttpExceptionWithStatus>()),
      );
    });

    test(
        '''stored request are returned first if offline first strategy is enabled''',
        () async {
      final mockClient = MockClient((request) async {
        return http.Response(
          json.encode({
            'bar': request.url.path,
          }),
          200,
          request: request,
          headers: {'content-type': 'application/json'},
        );
      });

      final database = AppDatabase(NativeDatabase.memory());
      final httpClient = ApiClient(
        database: database,
        httpClient: mockClient,
      );

      await database.into(database.dbRequests).insert(
            const DbRequest(
              requestPath: '/foo',
              responseBody: '{"from":"database"}',
            ),
          );

      // the response is returned from the database
      expect(
        jsonDecode(
          await httpClient.get(
            Uri.http('example.com', '/foo'),
            offlineFirst: true,
          ),
        ),
        {'from': 'database'},
      );

      await pumpEventQueue(times: 1);

      // the response from the network is fetched and persisted
      final request = await (database.select(database.dbRequests)
            ..where((tbl) => tbl.requestPath.equals('/foo')))
          .getSingle();

      expect(jsonDecode(request.responseBody), {'bar': '/foo'});
    });

    test('''
stored request are returned 
even if the attempt to persist the response from the network fails''',
        () async {
      final mockClient = MockClient((request) async {
        throw http.ClientException('client exception');
      });

      final database = AppDatabase(NativeDatabase.memory());
      final httpClient = ApiClient(
        database: database,
        httpClient: mockClient,
      );

      await database.into(database.dbRequests).insert(
            const DbRequest(
              requestPath: '/foo',
              responseBody: '{"from":"database"}',
            ),
          );

      // the response is returned from the database
      expect(
        jsonDecode(
          await httpClient.get(
            Uri.http('example.com', '/foo'),
            offlineFirst: true,
          ),
        ),
        {'from': 'database'},
      );
    });

    test(
        'network call is made if offline first enabled but no matching request',
        () async {
      final mockClient = MockClient((request) async {
        return http.Response(
          json.encode({
            'bar': request.url.path,
          }),
          200,
          request: request,
          headers: {'content-type': 'application/json'},
        );
      });

      final database = AppDatabase(NativeDatabase.memory());
      final httpClient = ApiClient(
        database: database,
        httpClient: mockClient,
      );

      final storedRequests = await database.select(database.dbRequests).get();
      expect(storedRequests.length, equals(0));

      expect(
        jsonDecode(
          await httpClient.get(
            Uri.http('example.com', '/foo'),
            offlineFirst: true,
          ),
        ),
        {'bar': '/foo'},
      );
    });
  });

  test('normalizeRequestPath sorts query parameters alphabetically', () {
    final database = AppDatabase(NativeDatabase.memory());
    final httpClient = ApiClient(
      database: database,
      httpClient: http.Client(),
    );
    expect(
      httpClient.normalizeRequestPath(Uri.https('foo.org', 'bar', {})),
      '/bar',
    );

    expect(
      httpClient.normalizeRequestPath(
        Uri.https('foo.org', 'bar', {
          'cd': 'foo',
          'ab': 'bar',
        }),
      ),
      '/bar?ab=bar&cd=foo',
    );

    const expectedPath = '/bar?ab=baz&ab=boo&ab=foo&cd=foo';
    expect(
      httpClient.normalizeRequestPath(
        Uri.https('foo.org', 'bar', {
          'cd': 'foo',
          'ab': ['boo', 'baz', 'foo'],
        }),
      ),
      expectedPath,
    );

    expect(
      httpClient.normalizeRequestPath(
        Uri.https('foo.org', 'bar', {
          'cd': 'foo',
          'ab': ['foo', 'boo', 'baz'],
        }),
      ),
      expectedPath,
    );
  });
}
