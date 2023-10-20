// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';

import 'package:breizh_blok_mobile/app_http_client.dart';
import 'package:breizh_blok_mobile/database/app_database.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';

void main() {
  driftRuntimeOptions.dontWarnAboutMultipleDatabases = true;
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
    final httpClient = AppHttpClient(
      database: database,
      httpClient: mockClient,
    );

    final storedRequests = await database.select(database.requests).get();
    expect(storedRequests.length, equals(0));

    expect(
      jsonDecode(
        await httpClient.get(
          Uri.http('example.com', '/foo'),
        ),
      ),
      {'foo': '/foo'},
    );

    final firstStoredRequest = await (database.select(database.requests)
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

    final secondStoredRequest = await (database.select(database.requests)
          ..where((tbl) => tbl.requestPath.equals('/bar?foo=bar')))
        .getSingle();

    expect(
      jsonDecode(secondStoredRequest.responseBody),
      {'foo': '/bar'},
    );
  });

  test(
      'in offline context, persisted requests are returned if the path matches',
      () async {
    final mockClient = MockClient((request) async {
      throw http.ClientException('client exception');
    });
    final database = AppDatabase(NativeDatabase.memory());
    final httpClient = AppHttpClient(
      database: database,
      httpClient: mockClient,
    );

    await database
        .into(database.requests)
        .insert(const Request(requestPath: '/foo', responseBody: 'bar'));

    expect(
      await httpClient.get(
        Uri.http('example.com', '/foo'),
      ),
      'bar',
    );
  });

  test(
      'in offline context, an error is thrown if there is no persisted request',
      () async {
    final mockClient = MockClient((request) async {
      throw http.ClientException('client exception');
    });
    final database = AppDatabase(NativeDatabase.memory());
    final httpClient = AppHttpClient(
      database: database,
      httpClient: mockClient,
    );

    await database
        .into(database.requests)
        .insert(const Request(requestPath: '/foo', responseBody: 'bar'));

    await expectLater(
      httpClient.get(
        Uri.http('example.com', '/bar'),
      ),
      throwsA(const TypeMatcher<http.ClientException>()),
    );
  });

  test(
      '''an error is thrown if api responds with HttpException, even if there is persisted request''',
      () async {
    final mockClient = MockClient((request) async {
      throw const HttpException('not found');
    });
    final database = AppDatabase(NativeDatabase.memory());
    final httpClient = AppHttpClient(
      database: database,
      httpClient: mockClient,
    );

    await database
        .into(database.requests)
        .insert(const Request(requestPath: '/foo', responseBody: 'bar'));

    await expectLater(
      httpClient.get(
        Uri.http('example.com', '/foo'),
      ),
      throwsA(const TypeMatcher<HttpException>()),
    );
  });
}
