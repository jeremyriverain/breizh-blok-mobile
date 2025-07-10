# breizh_blok_api_generated.api.RockApi

## Load the API package
```dart
import 'package:breizh_blok_api_generated/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**apiRocksGetCollection**](RockApi.md#apirocksgetcollection) | **GET** /rocks | Retrieves the collection of Rock resources.
[**apiRocksIdGet**](RockApi.md#apirocksidget) | **GET** /rocks/{id} | Retrieves a Rock resource.


# **apiRocksGetCollection**
> ApiRocksGetCollection200Response apiRocksGetCollection(page, pagination)

Retrieves the collection of Rock resources.

Retrieves the collection of Rock resources.

### Example
```dart
import 'package:breizh_blok_api_generated/api.dart';
// TODO Configure API key authorization: JWT
//defaultApiClient.getAuthentication<ApiKeyAuth>('JWT').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('JWT').apiKeyPrefix = 'Bearer';

final api = BreizhBlokApiGenerated().getRockApi();
final int page = 56; // int | The collection page number
final bool pagination = true; // bool | Enable or disable pagination

try {
    final response = api.apiRocksGetCollection(page, pagination);
    print(response);
} catch on DioException (e) {
    print('Exception when calling RockApi->apiRocksGetCollection: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page** | **int**| The collection page number | [optional] [default to 1]
 **pagination** | **bool**| Enable or disable pagination | [optional] 

### Return type

[**ApiRocksGetCollection200Response**](ApiRocksGetCollection200Response.md)

### Authorization

[JWT](../README.md#JWT)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/ld+json, application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiRocksIdGet**
> RockJsonldRockRead apiRocksIdGet(id)

Retrieves a Rock resource.

Retrieves a Rock resource.

### Example
```dart
import 'package:breizh_blok_api_generated/api.dart';
// TODO Configure API key authorization: JWT
//defaultApiClient.getAuthentication<ApiKeyAuth>('JWT').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('JWT').apiKeyPrefix = 'Bearer';

final api = BreizhBlokApiGenerated().getRockApi();
final String id = id_example; // String | Rock identifier

try {
    final response = api.apiRocksIdGet(id);
    print(response);
} catch on DioException (e) {
    print('Exception when calling RockApi->apiRocksIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| Rock identifier | 

### Return type

[**RockJsonldRockRead**](RockJsonldRockRead.md)

### Authorization

[JWT](../README.md#JWT)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/ld+json, application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

