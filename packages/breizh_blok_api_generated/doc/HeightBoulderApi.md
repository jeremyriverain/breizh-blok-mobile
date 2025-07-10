# breizh_blok_api_generated.api.HeightBoulderApi

## Load the API package
```dart
import 'package:breizh_blok_api_generated/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**apiHeightBouldersGetCollection**](HeightBoulderApi.md#apiheightbouldersgetcollection) | **GET** /height_boulders | Retrieves the collection of HeightBoulder resources.
[**apiHeightBouldersIdGet**](HeightBoulderApi.md#apiheightbouldersidget) | **GET** /height_boulders/{id} | Retrieves a HeightBoulder resource.


# **apiHeightBouldersGetCollection**
> ApiHeightBouldersGetCollection200Response apiHeightBouldersGetCollection(page, pagination)

Retrieves the collection of HeightBoulder resources.

Retrieves the collection of HeightBoulder resources.

### Example
```dart
import 'package:breizh_blok_api_generated/api.dart';
// TODO Configure API key authorization: JWT
//defaultApiClient.getAuthentication<ApiKeyAuth>('JWT').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('JWT').apiKeyPrefix = 'Bearer';

final api = BreizhBlokApiGenerated().getHeightBoulderApi();
final int page = 56; // int | The collection page number
final bool pagination = true; // bool | Enable or disable pagination

try {
    final response = api.apiHeightBouldersGetCollection(page, pagination);
    print(response);
} catch on DioException (e) {
    print('Exception when calling HeightBoulderApi->apiHeightBouldersGetCollection: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page** | **int**| The collection page number | [optional] [default to 1]
 **pagination** | **bool**| Enable or disable pagination | [optional] 

### Return type

[**ApiHeightBouldersGetCollection200Response**](ApiHeightBouldersGetCollection200Response.md)

### Authorization

[JWT](../README.md#JWT)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/ld+json, application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiHeightBouldersIdGet**
> HeightBoulderJsonldHeightBoulderRead apiHeightBouldersIdGet(id)

Retrieves a HeightBoulder resource.

Retrieves a HeightBoulder resource.

### Example
```dart
import 'package:breizh_blok_api_generated/api.dart';
// TODO Configure API key authorization: JWT
//defaultApiClient.getAuthentication<ApiKeyAuth>('JWT').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('JWT').apiKeyPrefix = 'Bearer';

final api = BreizhBlokApiGenerated().getHeightBoulderApi();
final String id = id_example; // String | HeightBoulder identifier

try {
    final response = api.apiHeightBouldersIdGet(id);
    print(response);
} catch on DioException (e) {
    print('Exception when calling HeightBoulderApi->apiHeightBouldersIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| HeightBoulder identifier | 

### Return type

[**HeightBoulderJsonldHeightBoulderRead**](HeightBoulderJsonldHeightBoulderRead.md)

### Authorization

[JWT](../README.md#JWT)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/ld+json, application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

