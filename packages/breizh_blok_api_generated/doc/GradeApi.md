# breizh_blok_api_generated.api.GradeApi

## Load the API package
```dart
import 'package:breizh_blok_api_generated/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**apiGradesGetCollection**](GradeApi.md#apigradesgetcollection) | **GET** /grades | Retrieves the collection of Grade resources.
[**apiGradesIdGet**](GradeApi.md#apigradesidget) | **GET** /grades/{id} | Retrieves a Grade resource.


# **apiGradesGetCollection**
> ApiGradesGetCollection200Response apiGradesGetCollection(page, pagination, orderLeftSquareBracketNameRightSquareBracket, existsLeftSquareBracketBouldersRightSquareBracket)

Retrieves the collection of Grade resources.

Retrieves the collection of Grade resources.

### Example
```dart
import 'package:breizh_blok_api_generated/api.dart';
// TODO Configure API key authorization: JWT
//defaultApiClient.getAuthentication<ApiKeyAuth>('JWT').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('JWT').apiKeyPrefix = 'Bearer';

final api = BreizhBlokApiGenerated().getGradeApi();
final int page = 56; // int | The collection page number
final bool pagination = true; // bool | Enable or disable pagination
final String orderLeftSquareBracketNameRightSquareBracket = orderLeftSquareBracketNameRightSquareBracket_example; // String | 
final bool existsLeftSquareBracketBouldersRightSquareBracket = true; // bool | 

try {
    final response = api.apiGradesGetCollection(page, pagination, orderLeftSquareBracketNameRightSquareBracket, existsLeftSquareBracketBouldersRightSquareBracket);
    print(response);
} catch on DioException (e) {
    print('Exception when calling GradeApi->apiGradesGetCollection: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page** | **int**| The collection page number | [optional] [default to 1]
 **pagination** | **bool**| Enable or disable pagination | [optional] 
 **orderLeftSquareBracketNameRightSquareBracket** | **String**|  | [optional] [default to 'asc']
 **existsLeftSquareBracketBouldersRightSquareBracket** | **bool**|  | [optional] 

### Return type

[**ApiGradesGetCollection200Response**](ApiGradesGetCollection200Response.md)

### Authorization

[JWT](../README.md#JWT)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/ld+json, application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiGradesIdGet**
> GradeJsonldGradeRead apiGradesIdGet(id)

Retrieves a Grade resource.

Retrieves a Grade resource.

### Example
```dart
import 'package:breizh_blok_api_generated/api.dart';
// TODO Configure API key authorization: JWT
//defaultApiClient.getAuthentication<ApiKeyAuth>('JWT').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('JWT').apiKeyPrefix = 'Bearer';

final api = BreizhBlokApiGenerated().getGradeApi();
final String id = id_example; // String | Grade identifier

try {
    final response = api.apiGradesIdGet(id);
    print(response);
} catch on DioException (e) {
    print('Exception when calling GradeApi->apiGradesIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| Grade identifier | 

### Return type

[**GradeJsonldGradeRead**](GradeJsonldGradeRead.md)

### Authorization

[JWT](../README.md#JWT)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/ld+json, application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

