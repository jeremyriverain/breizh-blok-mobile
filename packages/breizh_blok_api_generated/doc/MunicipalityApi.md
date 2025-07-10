# breizh_blok_api_generated.api.MunicipalityApi

## Load the API package
```dart
import 'package:breizh_blok_api_generated/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**apiMunicipalitiesGetCollection**](MunicipalityApi.md#apimunicipalitiesgetcollection) | **GET** /municipalities | Retrieves the collection of Municipality resources.
[**apiMunicipalitiesIdGet**](MunicipalityApi.md#apimunicipalitiesidget) | **GET** /municipalities/{id} | Retrieves a Municipality resource.


# **apiMunicipalitiesGetCollection**
> ApiMunicipalitiesGetCollection200Response apiMunicipalitiesGetCollection(page)

Retrieves the collection of Municipality resources.

Retrieves the collection of Municipality resources.

### Example
```dart
import 'package:breizh_blok_api_generated/api.dart';
// TODO Configure API key authorization: JWT
//defaultApiClient.getAuthentication<ApiKeyAuth>('JWT').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('JWT').apiKeyPrefix = 'Bearer';

final api = BreizhBlokApiGenerated().getMunicipalityApi();
final int page = 56; // int | The collection page number

try {
    final response = api.apiMunicipalitiesGetCollection(page);
    print(response);
} catch on DioException (e) {
    print('Exception when calling MunicipalityApi->apiMunicipalitiesGetCollection: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page** | **int**| The collection page number | [optional] [default to 1]

### Return type

[**ApiMunicipalitiesGetCollection200Response**](ApiMunicipalitiesGetCollection200Response.md)

### Authorization

[JWT](../README.md#JWT)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/ld+json, application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiMunicipalitiesIdGet**
> MunicipalityJsonldMunicipalityItemGet apiMunicipalitiesIdGet(id)

Retrieves a Municipality resource.

Retrieves a Municipality resource.

### Example
```dart
import 'package:breizh_blok_api_generated/api.dart';
// TODO Configure API key authorization: JWT
//defaultApiClient.getAuthentication<ApiKeyAuth>('JWT').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('JWT').apiKeyPrefix = 'Bearer';

final api = BreizhBlokApiGenerated().getMunicipalityApi();
final String id = id_example; // String | Municipality identifier

try {
    final response = api.apiMunicipalitiesIdGet(id);
    print(response);
} catch on DioException (e) {
    print('Exception when calling MunicipalityApi->apiMunicipalitiesIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| Municipality identifier | 

### Return type

[**MunicipalityJsonldMunicipalityItemGet**](MunicipalityJsonldMunicipalityItemGet.md)

### Authorization

[JWT](../README.md#JWT)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/ld+json, application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

