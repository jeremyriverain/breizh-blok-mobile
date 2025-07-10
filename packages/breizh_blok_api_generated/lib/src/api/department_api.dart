//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'dart:async';

import 'package:built_value/serializer.dart';
import 'package:dio/dio.dart';

import 'package:breizh_blok_api_generated/src/api_util.dart';
import 'package:breizh_blok_api_generated/src/model/api_departments_get_collection200_response.dart';
import 'package:breizh_blok_api_generated/src/model/department_jsonld_department_read.dart';

class DepartmentApi {
  final Dio _dio;

  final Serializers _serializers;

  const DepartmentApi(this._dio, this._serializers);

  /// Retrieves the collection of Department resources.
  /// Retrieves the collection of Department resources.
  ///
  /// Parameters:
  /// * [page] - The collection page number
  /// * [pagination] - Enable or disable pagination
  /// * [existsLeftSquareBracketMunicipalitiesPeriodBoulderAreasPeriodRocksPeriodBouldersRightSquareBracket] -
  /// * [orderLeftSquareBracketNameRightSquareBracket] -
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [ApiDepartmentsGetCollection200Response] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<ApiDepartmentsGetCollection200Response>>
      apiDepartmentsGetCollection({
    int? page = 1,
    bool? pagination,
    bool?
        existsLeftSquareBracketMunicipalitiesPeriodBoulderAreasPeriodRocksPeriodBouldersRightSquareBracket,
    String? orderLeftSquareBracketNameRightSquareBracket = 'asc',
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/departments';
    final _options = Options(
      method: r'GET',
      headers: <String, dynamic>{
        ...?headers,
      },
      extra: <String, dynamic>{
        'secure': <Map<String, String>>[
          {
            'type': 'apiKey',
            'name': 'JWT',
            'keyName': 'Authorization',
            'where': 'header',
          },
        ],
        ...?extra,
      },
      validateStatus: validateStatus,
    );

    final _queryParameters = <String, dynamic>{
      if (page != null)
        r'page': encodeQueryParameter(_serializers, page, const FullType(int)),
      if (pagination != null)
        r'pagination': encodeQueryParameter(
            _serializers, pagination, const FullType(bool)),
      if (existsLeftSquareBracketMunicipalitiesPeriodBoulderAreasPeriodRocksPeriodBouldersRightSquareBracket !=
          null)
        r'exists[municipalities.boulderAreas.rocks.boulders]': encodeQueryParameter(
            _serializers,
            existsLeftSquareBracketMunicipalitiesPeriodBoulderAreasPeriodRocksPeriodBouldersRightSquareBracket,
            const FullType(bool)),
      if (orderLeftSquareBracketNameRightSquareBracket != null)
        r'order[name]': encodeQueryParameter(
            _serializers,
            orderLeftSquareBracketNameRightSquareBracket,
            const FullType(String)),
    };

    final _response = await _dio.request<Object>(
      _path,
      options: _options,
      queryParameters: _queryParameters,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    ApiDepartmentsGetCollection200Response? _responseData;

    try {
      final rawResponse = _response.data;
      _responseData = rawResponse == null
          ? null
          : _serializers.deserialize(
              rawResponse,
              specifiedType:
                  const FullType(ApiDepartmentsGetCollection200Response),
            ) as ApiDepartmentsGetCollection200Response;
    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<ApiDepartmentsGetCollection200Response>(
      data: _responseData,
      headers: _response.headers,
      isRedirect: _response.isRedirect,
      requestOptions: _response.requestOptions,
      redirects: _response.redirects,
      statusCode: _response.statusCode,
      statusMessage: _response.statusMessage,
      extra: _response.extra,
    );
  }

  /// Retrieves a Department resource.
  /// Retrieves a Department resource.
  ///
  /// Parameters:
  /// * [id] - Department identifier
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [DepartmentJsonldDepartmentRead] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<DepartmentJsonldDepartmentRead>> apiDepartmentsIdGet({
    required String id,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/departments/{id}'.replaceAll(
        '{' r'id' '}',
        encodeQueryParameter(_serializers, id, const FullType(String))
            .toString());
    final _options = Options(
      method: r'GET',
      headers: <String, dynamic>{
        ...?headers,
      },
      extra: <String, dynamic>{
        'secure': <Map<String, String>>[
          {
            'type': 'apiKey',
            'name': 'JWT',
            'keyName': 'Authorization',
            'where': 'header',
          },
        ],
        ...?extra,
      },
      validateStatus: validateStatus,
    );

    final _response = await _dio.request<Object>(
      _path,
      options: _options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    DepartmentJsonldDepartmentRead? _responseData;

    try {
      final rawResponse = _response.data;
      _responseData = rawResponse == null
          ? null
          : _serializers.deserialize(
              rawResponse,
              specifiedType: const FullType(DepartmentJsonldDepartmentRead),
            ) as DepartmentJsonldDepartmentRead;
    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<DepartmentJsonldDepartmentRead>(
      data: _responseData,
      headers: _response.headers,
      isRedirect: _response.isRedirect,
      requestOptions: _response.requestOptions,
      redirects: _response.redirects,
      statusCode: _response.statusCode,
      statusMessage: _response.statusMessage,
      extra: _response.extra,
    );
  }
}
