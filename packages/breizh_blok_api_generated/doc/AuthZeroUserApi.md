# breizh_blok_api_generated.api.AuthZeroUserApi

## Load the API package
```dart
import 'package:breizh_blok_api_generated/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**apiUsersIdGet**](AuthZeroUserApi.md#apiusersidget) | **GET** /users/{id} | Retrieves a AuthZeroUser resource.


# **apiUsersIdGet**
> AuthZeroUserJsonldAuthZeroUserRead apiUsersIdGet(id)

Retrieves a AuthZeroUser resource.

Retrieves a AuthZeroUser resource.

### Example
```dart
import 'package:breizh_blok_api_generated/api.dart';
// TODO Configure API key authorization: JWT
//defaultApiClient.getAuthentication<ApiKeyAuth>('JWT').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('JWT').apiKeyPrefix = 'Bearer';

final api = BreizhBlokApiGenerated().getAuthZeroUserApi();
final String id = id_example; // String | AuthZeroUser identifier

try {
    final response = api.apiUsersIdGet(id);
    print(response);
} catch on DioException (e) {
    print('Exception when calling AuthZeroUserApi->apiUsersIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| AuthZeroUser identifier | 

### Return type

[**AuthZeroUserJsonldAuthZeroUserRead**](AuthZeroUserJsonldAuthZeroUserRead.md)

### Authorization

[JWT](../README.md#JWT)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/ld+json, application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

