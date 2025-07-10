# breizh_blok_api_generated.api.BoulderAreaApi

## Load the API package
```dart
import 'package:breizh_blok_api_generated/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**apiBoulderAreasGetCollection**](BoulderAreaApi.md#apiboulderareasgetcollection) | **GET** /boulder_areas | Retrieves the collection of BoulderArea resources.
[**apiBoulderAreasIdGet**](BoulderAreaApi.md#apiboulderareasidget) | **GET** /boulder_areas/{id} | Retrieves a BoulderArea resource.


# **apiBoulderAreasGetCollection**
> ApiBoulderAreasGetCollection200Response apiBoulderAreasGetCollection(page)

Retrieves the collection of BoulderArea resources.

Retrieves the collection of BoulderArea resources.

### Example
```dart
import 'package:breizh_blok_api_generated/api.dart';
// TODO Configure API key authorization: JWT
//defaultApiClient.getAuthentication<ApiKeyAuth>('JWT').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('JWT').apiKeyPrefix = 'Bearer';

final api = BreizhBlokApiGenerated().getBoulderAreaApi();
final int page = 56; // int | The collection page number

try {
    final response = api.apiBoulderAreasGetCollection(page);
    print(response);
} catch on DioException (e) {
    print('Exception when calling BoulderAreaApi->apiBoulderAreasGetCollection: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page** | **int**| The collection page number | [optional] [default to 1]

### Return type

[**ApiBoulderAreasGetCollection200Response**](ApiBoulderAreasGetCollection200Response.md)

### Authorization

[JWT](../README.md#JWT)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/ld+json, application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiBoulderAreasIdGet**
> BoulderAreaJsonldBoulderAreaItemGet apiBoulderAreasIdGet(id)

Retrieves a BoulderArea resource.

Retrieves a BoulderArea resource.

### Example
```dart
import 'package:breizh_blok_api_generated/api.dart';
// TODO Configure API key authorization: JWT
//defaultApiClient.getAuthentication<ApiKeyAuth>('JWT').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('JWT').apiKeyPrefix = 'Bearer';

final api = BreizhBlokApiGenerated().getBoulderAreaApi();
final String id = id_example; // String | BoulderArea identifier

try {
    final response = api.apiBoulderAreasIdGet(id);
    print(response);
} catch on DioException (e) {
    print('Exception when calling BoulderAreaApi->apiBoulderAreasIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| BoulderArea identifier | 

### Return type

[**BoulderAreaJsonldBoulderAreaItemGet**](BoulderAreaJsonldBoulderAreaItemGet.md)

### Authorization

[JWT](../README.md#JWT)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/ld+json, application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

