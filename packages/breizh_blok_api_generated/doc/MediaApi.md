# breizh_blok_api_generated.api.MediaApi

## Load the API package
```dart
import 'package:breizh_blok_api_generated/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**apiMediaGetCollection**](MediaApi.md#apimediagetcollection) | **GET** /media | Retrieves the collection of Media resources.
[**apiMediaIdGet**](MediaApi.md#apimediaidget) | **GET** /media/{id} | Retrieves a Media resource.


# **apiMediaGetCollection**
> ApiMediaGetCollection200Response apiMediaGetCollection(page)

Retrieves the collection of Media resources.

Retrieves the collection of Media resources.

### Example
```dart
import 'package:breizh_blok_api_generated/api.dart';
// TODO Configure API key authorization: JWT
//defaultApiClient.getAuthentication<ApiKeyAuth>('JWT').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('JWT').apiKeyPrefix = 'Bearer';

final api = BreizhBlokApiGenerated().getMediaApi();
final int page = 56; // int | The collection page number

try {
    final response = api.apiMediaGetCollection(page);
    print(response);
} catch on DioException (e) {
    print('Exception when calling MediaApi->apiMediaGetCollection: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page** | **int**| The collection page number | [optional] [default to 1]

### Return type

[**ApiMediaGetCollection200Response**](ApiMediaGetCollection200Response.md)

### Authorization

[JWT](../README.md#JWT)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/ld+json, application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiMediaIdGet**
> MediaJsonld apiMediaIdGet(id)

Retrieves a Media resource.

Retrieves a Media resource.

### Example
```dart
import 'package:breizh_blok_api_generated/api.dart';
// TODO Configure API key authorization: JWT
//defaultApiClient.getAuthentication<ApiKeyAuth>('JWT').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('JWT').apiKeyPrefix = 'Bearer';

final api = BreizhBlokApiGenerated().getMediaApi();
final String id = id_example; // String | Media identifier

try {
    final response = api.apiMediaIdGet(id);
    print(response);
} catch on DioException (e) {
    print('Exception when calling MediaApi->apiMediaIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| Media identifier | 

### Return type

[**MediaJsonld**](MediaJsonld.md)

### Authorization

[JWT](../README.md#JWT)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/ld+json, application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

