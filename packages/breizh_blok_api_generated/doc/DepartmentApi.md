# breizh_blok_api_generated.api.DepartmentApi

## Load the API package
```dart
import 'package:breizh_blok_api_generated/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**apiDepartmentsGetCollection**](DepartmentApi.md#apidepartmentsgetcollection) | **GET** /departments | Retrieves the collection of Department resources.
[**apiDepartmentsIdGet**](DepartmentApi.md#apidepartmentsidget) | **GET** /departments/{id} | Retrieves a Department resource.


# **apiDepartmentsGetCollection**
> ApiDepartmentsGetCollection200Response apiDepartmentsGetCollection(page, pagination, orderLeftSquareBracketNameRightSquareBracket)

Retrieves the collection of Department resources.

Retrieves the collection of Department resources.

### Example
```dart
import 'package:breizh_blok_api_generated/api.dart';
// TODO Configure API key authorization: JWT
//defaultApiClient.getAuthentication<ApiKeyAuth>('JWT').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('JWT').apiKeyPrefix = 'Bearer';

final api = BreizhBlokApiGenerated().getDepartmentApi();
final int page = 56; // int | The collection page number
final bool pagination = true; // bool | Enable or disable pagination
final String orderLeftSquareBracketNameRightSquareBracket = orderLeftSquareBracketNameRightSquareBracket_example; // String | 

try {
    final response = api.apiDepartmentsGetCollection(page, pagination, orderLeftSquareBracketNameRightSquareBracket);
    print(response);
} catch on DioException (e) {
    print('Exception when calling DepartmentApi->apiDepartmentsGetCollection: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page** | **int**| The collection page number | [optional] [default to 1]
 **pagination** | **bool**| Enable or disable pagination | [optional] 
 **orderLeftSquareBracketNameRightSquareBracket** | **String**|  | [optional] [default to 'asc']

### Return type

[**ApiDepartmentsGetCollection200Response**](ApiDepartmentsGetCollection200Response.md)

### Authorization

[JWT](../README.md#JWT)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/ld+json, application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiDepartmentsIdGet**
> DepartmentJsonldDepartmentRead apiDepartmentsIdGet(id)

Retrieves a Department resource.

Retrieves a Department resource.

### Example
```dart
import 'package:breizh_blok_api_generated/api.dart';
// TODO Configure API key authorization: JWT
//defaultApiClient.getAuthentication<ApiKeyAuth>('JWT').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('JWT').apiKeyPrefix = 'Bearer';

final api = BreizhBlokApiGenerated().getDepartmentApi();
final String id = id_example; // String | Department identifier

try {
    final response = api.apiDepartmentsIdGet(id);
    print(response);
} catch on DioException (e) {
    print('Exception when calling DepartmentApi->apiDepartmentsIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| Department identifier | 

### Return type

[**DepartmentJsonldDepartmentRead**](DepartmentJsonldDepartmentRead.md)

### Authorization

[JWT](../README.md#JWT)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/ld+json, application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

