import 'package:breizh_blok_auth/breizh_blok_auth.dart';
import 'package:dio/dio.dart';
import 'package:mocktail/mocktail.dart';

class MockAuth extends Mock implements Auth {}

class MockDio extends Mock implements Dio {}

class MockErrorInterceptorHandler extends Mock
    implements ErrorInterceptorHandler {}

class MockRequestInterceptorHandler extends Mock
    implements RequestInterceptorHandler {}
