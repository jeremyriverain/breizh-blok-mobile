# breizh_blok_api_generated.api.BoulderFeedbackApi

## Load the API package
```dart
import 'package:breizh_blok_api_generated/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**apiBoulderFeedbacksGetCollection**](BoulderFeedbackApi.md#apiboulderfeedbacksgetcollection) | **GET** /boulder_feedbacks | Retrieves the collection of BoulderFeedback resources.
[**apiBoulderFeedbacksIdGet**](BoulderFeedbackApi.md#apiboulderfeedbacksidget) | **GET** /boulder_feedbacks/{id} | Retrieves a BoulderFeedback resource.
[**apiBoulderFeedbacksPost**](BoulderFeedbackApi.md#apiboulderfeedbackspost) | **POST** /boulder_feedbacks | Creates a BoulderFeedback resource.


# **apiBoulderFeedbacksGetCollection**
> ApiBoulderFeedbacksGetCollection200Response apiBoulderFeedbacksGetCollection(page)

Retrieves the collection of BoulderFeedback resources.

Retrieves the collection of BoulderFeedback resources.

### Example
```dart
import 'package:breizh_blok_api_generated/api.dart';
// TODO Configure API key authorization: JWT
//defaultApiClient.getAuthentication<ApiKeyAuth>('JWT').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('JWT').apiKeyPrefix = 'Bearer';

final api = BreizhBlokApiGenerated().getBoulderFeedbackApi();
final int page = 56; // int | The collection page number

try {
    final response = api.apiBoulderFeedbacksGetCollection(page);
    print(response);
} catch on DioException (e) {
    print('Exception when calling BoulderFeedbackApi->apiBoulderFeedbacksGetCollection: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page** | **int**| The collection page number | [optional] [default to 1]

### Return type

[**ApiBoulderFeedbacksGetCollection200Response**](ApiBoulderFeedbacksGetCollection200Response.md)

### Authorization

[JWT](../README.md#JWT)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/ld+json, application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiBoulderFeedbacksIdGet**
> BoulderFeedbackJsonldBoulderFeedbackRead apiBoulderFeedbacksIdGet(id)

Retrieves a BoulderFeedback resource.

Retrieves a BoulderFeedback resource.

### Example
```dart
import 'package:breizh_blok_api_generated/api.dart';
// TODO Configure API key authorization: JWT
//defaultApiClient.getAuthentication<ApiKeyAuth>('JWT').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('JWT').apiKeyPrefix = 'Bearer';

final api = BreizhBlokApiGenerated().getBoulderFeedbackApi();
final String id = id_example; // String | BoulderFeedback identifier

try {
    final response = api.apiBoulderFeedbacksIdGet(id);
    print(response);
} catch on DioException (e) {
    print('Exception when calling BoulderFeedbackApi->apiBoulderFeedbacksIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| BoulderFeedback identifier | 

### Return type

[**BoulderFeedbackJsonldBoulderFeedbackRead**](BoulderFeedbackJsonldBoulderFeedbackRead.md)

### Authorization

[JWT](../README.md#JWT)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/ld+json, application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiBoulderFeedbacksPost**
> BoulderFeedbackJsonldBoulderFeedbackRead apiBoulderFeedbacksPost(boulderFeedbackJsonldBoulderFeedbackWrite)

Creates a BoulderFeedback resource.

Creates a BoulderFeedback resource.

### Example
```dart
import 'package:breizh_blok_api_generated/api.dart';
// TODO Configure API key authorization: JWT
//defaultApiClient.getAuthentication<ApiKeyAuth>('JWT').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('JWT').apiKeyPrefix = 'Bearer';

final api = BreizhBlokApiGenerated().getBoulderFeedbackApi();
final BoulderFeedbackJsonldBoulderFeedbackWrite boulderFeedbackJsonldBoulderFeedbackWrite = ; // BoulderFeedbackJsonldBoulderFeedbackWrite | The new BoulderFeedback resource

try {
    final response = api.apiBoulderFeedbacksPost(boulderFeedbackJsonldBoulderFeedbackWrite);
    print(response);
} catch on DioException (e) {
    print('Exception when calling BoulderFeedbackApi->apiBoulderFeedbacksPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **boulderFeedbackJsonldBoulderFeedbackWrite** | [**BoulderFeedbackJsonldBoulderFeedbackWrite**](BoulderFeedbackJsonldBoulderFeedbackWrite.md)| The new BoulderFeedback resource | 

### Return type

[**BoulderFeedbackJsonldBoulderFeedbackRead**](BoulderFeedbackJsonldBoulderFeedbackRead.md)

### Authorization

[JWT](../README.md#JWT)

### HTTP request headers

 - **Content-Type**: application/ld+json, application/json
 - **Accept**: application/ld+json, application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

