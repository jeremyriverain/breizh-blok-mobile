import 'package:breizh_blok_http_client/src/result.dart';
import 'package:dio/dio.dart' as d;

abstract interface class HttpClient {}

class Response<T> {
  Response({required this.data, required this.statusCode});

  final T data;
  final int statusCode;
}

class HttpClientImpl implements HttpClient {
  HttpClientImpl({required this.dio, required this.responseMapper});

  final d.Dio dio;
  final ResponseMapper responseMapper;

  Future<Result<Response<T>>> post<T>(String path, {Object? data}) async {
    try {
      final dioResponse = await dio.post<T>(path, data: data);
      return ResultOk(responseMapper.toResponse(dioResponse));
    } on LogicException catch (e) {
      return ResultError(e);
    } catch (e) {
      return ResultError(Exception(e.toString()));
    }
  }
}

class LogicException implements Exception {
  LogicException({required this.message});

  final String message;
}

class ResponseMapper {
  Response<T> toResponse<T>(d.Response<T> dioResponse) {
    final data = dioResponse.data;
    if (data == null) {
      throw LogicException(message: 'data should not be null');
    }

    final statusCode = dioResponse.statusCode;
    if (statusCode == null) {
      throw LogicException(message: 'statusCode should not be null');
    }

    return Response<T>(data: data, statusCode: statusCode);
  }
}
