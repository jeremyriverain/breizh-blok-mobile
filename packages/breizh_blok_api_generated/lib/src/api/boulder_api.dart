//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'dart:async';

import 'package:built_value/serializer.dart';
import 'package:dio/dio.dart';

import 'package:breizh_blok_api_generated/src/api_util.dart';
import 'package:breizh_blok_api_generated/src/model/api_boulders_get_collection200_response.dart';
import 'package:breizh_blok_api_generated/src/model/boulder_jsonld_boulder_item_get.dart';
import 'package:built_collection/built_collection.dart';

class BoulderApi {
  final Dio _dio;

  final Serializers _serializers;

  const BoulderApi(this._dio, this._serializers);

  /// Retrieves the collection of Boulder resources.
  /// Retrieves the collection of Boulder resources.
  ///
  /// Parameters:
  /// * [page] - The collection page number
  /// * [itemsPerPage] - The number of items per page
  /// * [pagination] - Enable or disable pagination
  /// * [orderLeftSquareBracketIdRightSquareBracket] -
  /// * [orderLeftSquareBracketNameRightSquareBracket] -
  /// * [orderLeftSquareBracketGradePeriodNameRightSquareBracket] -
  /// * [id] -
  /// * [idLeftSquareBracketRightSquareBracket] -
  /// * [name] -
  /// * [gradePeriodName] -
  /// * [gradePeriodNameLeftSquareBracketRightSquareBracket] -
  /// * [rockPeriodBoulderAreaPeriodId] -
  /// * [rockPeriodBoulderAreaPeriodIdLeftSquareBracketRightSquareBracket] -
  /// * [rockPeriodBoulderAreaPeriodName] -
  /// * [rockPeriodBoulderAreaPeriodNameLeftSquareBracketRightSquareBracket] -
  /// * [rockPeriodBoulderAreaPeriodMunicipalityPeriodName] -
  /// * [rockPeriodBoulderAreaPeriodMunicipalityPeriodNameLeftSquareBracketRightSquareBracket] -
  /// * [rockPeriodId] -
  /// * [rockPeriodIdLeftSquareBracketRightSquareBracket] -
  /// * [term] -
  /// * [createdAtLeftSquareBracketBeforeRightSquareBracket] -
  /// * [createdAtLeftSquareBracketStrictlyBeforeRightSquareBracket] -
  /// * [createdAtLeftSquareBracketAfterRightSquareBracket] -
  /// * [createdAtLeftSquareBracketStrictlyAfterRightSquareBracket] -
  /// * [groupsLeftSquareBracketRightSquareBracket] -
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [ApiBouldersGetCollection200Response] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<ApiBouldersGetCollection200Response>>
      apiBouldersGetCollection({
    int? page = 1,
    int? itemsPerPage = 30,
    bool? pagination,
    String? orderLeftSquareBracketIdRightSquareBracket = 'asc',
    String? orderLeftSquareBracketNameRightSquareBracket = 'asc',
    String? orderLeftSquareBracketGradePeriodNameRightSquareBracket = 'asc',
    int? id,
    BuiltList<int>? idLeftSquareBracketRightSquareBracket,
    String? name,
    String? gradePeriodName,
    BuiltList<String>? gradePeriodNameLeftSquareBracketRightSquareBracket,
    int? rockPeriodBoulderAreaPeriodId,
    BuiltList<int>?
        rockPeriodBoulderAreaPeriodIdLeftSquareBracketRightSquareBracket,
    String? rockPeriodBoulderAreaPeriodName,
    BuiltList<String>?
        rockPeriodBoulderAreaPeriodNameLeftSquareBracketRightSquareBracket,
    String? rockPeriodBoulderAreaPeriodMunicipalityPeriodName,
    BuiltList<String>?
        rockPeriodBoulderAreaPeriodMunicipalityPeriodNameLeftSquareBracketRightSquareBracket,
    int? rockPeriodId,
    BuiltList<int>? rockPeriodIdLeftSquareBracketRightSquareBracket,
    String? term,
    String? createdAtLeftSquareBracketBeforeRightSquareBracket,
    String? createdAtLeftSquareBracketStrictlyBeforeRightSquareBracket,
    String? createdAtLeftSquareBracketAfterRightSquareBracket,
    String? createdAtLeftSquareBracketStrictlyAfterRightSquareBracket,
    BuiltList<String>? groupsLeftSquareBracketRightSquareBracket,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/boulders';
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
      if (itemsPerPage != null)
        r'itemsPerPage': encodeQueryParameter(
            _serializers, itemsPerPage, const FullType(int)),
      if (pagination != null)
        r'pagination': encodeQueryParameter(
            _serializers, pagination, const FullType(bool)),
      if (orderLeftSquareBracketIdRightSquareBracket != null)
        r'order[id]': encodeQueryParameter(_serializers,
            orderLeftSquareBracketIdRightSquareBracket, const FullType(String)),
      if (orderLeftSquareBracketNameRightSquareBracket != null)
        r'order[name]': encodeQueryParameter(
            _serializers,
            orderLeftSquareBracketNameRightSquareBracket,
            const FullType(String)),
      if (orderLeftSquareBracketGradePeriodNameRightSquareBracket != null)
        r'order[grade.name]': encodeQueryParameter(
            _serializers,
            orderLeftSquareBracketGradePeriodNameRightSquareBracket,
            const FullType(String)),
      if (id != null)
        r'id': encodeQueryParameter(_serializers, id, const FullType(int)),
      if (idLeftSquareBracketRightSquareBracket != null)
        r'id[]': encodeCollectionQueryParameter<int>(
          _serializers,
          idLeftSquareBracketRightSquareBracket,
          const FullType(BuiltList, [FullType(int)]),
          format: ListFormat.multi,
        ),
      if (name != null)
        r'name':
            encodeQueryParameter(_serializers, name, const FullType(String)),
      if (gradePeriodName != null)
        r'grade.name': encodeQueryParameter(
            _serializers, gradePeriodName, const FullType(String)),
      if (gradePeriodNameLeftSquareBracketRightSquareBracket != null)
        r'grade.name[]': encodeCollectionQueryParameter<String>(
          _serializers,
          gradePeriodNameLeftSquareBracketRightSquareBracket,
          const FullType(BuiltList, [FullType(String)]),
          format: ListFormat.multi,
        ),
      if (rockPeriodBoulderAreaPeriodId != null)
        r'rock.boulderArea.id': encodeQueryParameter(
            _serializers, rockPeriodBoulderAreaPeriodId, const FullType(int)),
      if (rockPeriodBoulderAreaPeriodIdLeftSquareBracketRightSquareBracket !=
          null)
        r'rock.boulderArea.id[]': encodeCollectionQueryParameter<int>(
          _serializers,
          rockPeriodBoulderAreaPeriodIdLeftSquareBracketRightSquareBracket,
          const FullType(BuiltList, [FullType(int)]),
          format: ListFormat.multi,
        ),
      if (rockPeriodBoulderAreaPeriodName != null)
        r'rock.boulderArea.name': encodeQueryParameter(_serializers,
            rockPeriodBoulderAreaPeriodName, const FullType(String)),
      if (rockPeriodBoulderAreaPeriodNameLeftSquareBracketRightSquareBracket !=
          null)
        r'rock.boulderArea.name[]': encodeCollectionQueryParameter<String>(
          _serializers,
          rockPeriodBoulderAreaPeriodNameLeftSquareBracketRightSquareBracket,
          const FullType(BuiltList, [FullType(String)]),
          format: ListFormat.multi,
        ),
      if (rockPeriodBoulderAreaPeriodMunicipalityPeriodName != null)
        r'rock.boulderArea.municipality.name': encodeQueryParameter(
            _serializers,
            rockPeriodBoulderAreaPeriodMunicipalityPeriodName,
            const FullType(String)),
      if (rockPeriodBoulderAreaPeriodMunicipalityPeriodNameLeftSquareBracketRightSquareBracket !=
          null)
        r'rock.boulderArea.municipality.name[]':
            encodeCollectionQueryParameter<String>(
          _serializers,
          rockPeriodBoulderAreaPeriodMunicipalityPeriodNameLeftSquareBracketRightSquareBracket,
          const FullType(BuiltList, [FullType(String)]),
          format: ListFormat.multi,
        ),
      if (rockPeriodId != null)
        r'rock.id': encodeQueryParameter(
            _serializers, rockPeriodId, const FullType(int)),
      if (rockPeriodIdLeftSquareBracketRightSquareBracket != null)
        r'rock.id[]': encodeCollectionQueryParameter<int>(
          _serializers,
          rockPeriodIdLeftSquareBracketRightSquareBracket,
          const FullType(BuiltList, [FullType(int)]),
          format: ListFormat.multi,
        ),
      if (term != null)
        r'term':
            encodeQueryParameter(_serializers, term, const FullType(String)),
      if (createdAtLeftSquareBracketBeforeRightSquareBracket != null)
        r'createdAt[before]': encodeQueryParameter(
            _serializers,
            createdAtLeftSquareBracketBeforeRightSquareBracket,
            const FullType(String)),
      if (createdAtLeftSquareBracketStrictlyBeforeRightSquareBracket != null)
        r'createdAt[strictly_before]': encodeQueryParameter(
            _serializers,
            createdAtLeftSquareBracketStrictlyBeforeRightSquareBracket,
            const FullType(String)),
      if (createdAtLeftSquareBracketAfterRightSquareBracket != null)
        r'createdAt[after]': encodeQueryParameter(
            _serializers,
            createdAtLeftSquareBracketAfterRightSquareBracket,
            const FullType(String)),
      if (createdAtLeftSquareBracketStrictlyAfterRightSquareBracket != null)
        r'createdAt[strictly_after]': encodeQueryParameter(
            _serializers,
            createdAtLeftSquareBracketStrictlyAfterRightSquareBracket,
            const FullType(String)),
      if (groupsLeftSquareBracketRightSquareBracket != null)
        r'groups[]': encodeCollectionQueryParameter<String>(
          _serializers,
          groupsLeftSquareBracketRightSquareBracket,
          const FullType(BuiltList, [FullType(String)]),
          format: ListFormat.multi,
        ),
    };

    final _response = await _dio.request<Object>(
      _path,
      options: _options,
      queryParameters: _queryParameters,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    ApiBouldersGetCollection200Response? _responseData;

    try {
      final rawResponse = _response.data;
      _responseData = rawResponse == null
          ? null
          : _serializers.deserialize(
              rawResponse,
              specifiedType:
                  const FullType(ApiBouldersGetCollection200Response),
            ) as ApiBouldersGetCollection200Response;
    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<ApiBouldersGetCollection200Response>(
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

  /// Retrieves a Boulder resource.
  /// Retrieves a Boulder resource.
  ///
  /// Parameters:
  /// * [id] - Boulder identifier
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [BoulderJsonldBoulderItemGet] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<BoulderJsonldBoulderItemGet>> apiBouldersIdGet({
    required String id,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/boulders/{id}'.replaceAll(
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

    BoulderJsonldBoulderItemGet? _responseData;

    try {
      final rawResponse = _response.data;
      _responseData = rawResponse == null
          ? null
          : _serializers.deserialize(
              rawResponse,
              specifiedType: const FullType(BoulderJsonldBoulderItemGet),
            ) as BoulderJsonldBoulderItemGet;
    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<BoulderJsonldBoulderItemGet>(
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
