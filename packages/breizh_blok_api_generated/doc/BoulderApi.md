# breizh_blok_api_generated.api.BoulderApi

## Load the API package
```dart
import 'package:breizh_blok_api_generated/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**apiBouldersGetCollection**](BoulderApi.md#apibouldersgetcollection) | **GET** /boulders | Retrieves the collection of Boulder resources.
[**apiBouldersIdGet**](BoulderApi.md#apibouldersidget) | **GET** /boulders/{id} | Retrieves a Boulder resource.


# **apiBouldersGetCollection**
> ApiBouldersGetCollection200Response apiBouldersGetCollection(page, itemsPerPage, pagination, orderLeftSquareBracketIdRightSquareBracket, orderLeftSquareBracketNameRightSquareBracket, orderLeftSquareBracketGradePeriodNameRightSquareBracket, id, idLeftSquareBracketRightSquareBracket, name, gradePeriodName, gradePeriodNameLeftSquareBracketRightSquareBracket, rockPeriodBoulderAreaPeriodId, rockPeriodBoulderAreaPeriodIdLeftSquareBracketRightSquareBracket, rockPeriodBoulderAreaPeriodName, rockPeriodBoulderAreaPeriodNameLeftSquareBracketRightSquareBracket, rockPeriodBoulderAreaPeriodMunicipalityPeriodName, rockPeriodBoulderAreaPeriodMunicipalityPeriodNameLeftSquareBracketRightSquareBracket, rockPeriodId, rockPeriodIdLeftSquareBracketRightSquareBracket, term, createdAtLeftSquareBracketBeforeRightSquareBracket, createdAtLeftSquareBracketStrictlyBeforeRightSquareBracket, createdAtLeftSquareBracketAfterRightSquareBracket, createdAtLeftSquareBracketStrictlyAfterRightSquareBracket, groupsLeftSquareBracketRightSquareBracket)

Retrieves the collection of Boulder resources.

Retrieves the collection of Boulder resources.

### Example
```dart
import 'package:breizh_blok_api_generated/api.dart';
// TODO Configure API key authorization: JWT
//defaultApiClient.getAuthentication<ApiKeyAuth>('JWT').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('JWT').apiKeyPrefix = 'Bearer';

final api = BreizhBlokApiGenerated().getBoulderApi();
final int page = 56; // int | The collection page number
final int itemsPerPage = 56; // int | The number of items per page
final bool pagination = true; // bool | Enable or disable pagination
final String orderLeftSquareBracketIdRightSquareBracket = orderLeftSquareBracketIdRightSquareBracket_example; // String | 
final String orderLeftSquareBracketNameRightSquareBracket = orderLeftSquareBracketNameRightSquareBracket_example; // String | 
final String orderLeftSquareBracketGradePeriodNameRightSquareBracket = orderLeftSquareBracketGradePeriodNameRightSquareBracket_example; // String | 
final int id = 56; // int | 
final BuiltList<int> idLeftSquareBracketRightSquareBracket = ; // BuiltList<int> | 
final String name = name_example; // String | 
final String gradePeriodName = gradePeriodName_example; // String | 
final BuiltList<String> gradePeriodNameLeftSquareBracketRightSquareBracket = ; // BuiltList<String> | 
final int rockPeriodBoulderAreaPeriodId = 56; // int | 
final BuiltList<int> rockPeriodBoulderAreaPeriodIdLeftSquareBracketRightSquareBracket = ; // BuiltList<int> | 
final String rockPeriodBoulderAreaPeriodName = rockPeriodBoulderAreaPeriodName_example; // String | 
final BuiltList<String> rockPeriodBoulderAreaPeriodNameLeftSquareBracketRightSquareBracket = ; // BuiltList<String> | 
final String rockPeriodBoulderAreaPeriodMunicipalityPeriodName = rockPeriodBoulderAreaPeriodMunicipalityPeriodName_example; // String | 
final BuiltList<String> rockPeriodBoulderAreaPeriodMunicipalityPeriodNameLeftSquareBracketRightSquareBracket = ; // BuiltList<String> | 
final int rockPeriodId = 56; // int | 
final BuiltList<int> rockPeriodIdLeftSquareBracketRightSquareBracket = ; // BuiltList<int> | 
final String term = term_example; // String | 
final String createdAtLeftSquareBracketBeforeRightSquareBracket = createdAtLeftSquareBracketBeforeRightSquareBracket_example; // String | 
final String createdAtLeftSquareBracketStrictlyBeforeRightSquareBracket = createdAtLeftSquareBracketStrictlyBeforeRightSquareBracket_example; // String | 
final String createdAtLeftSquareBracketAfterRightSquareBracket = createdAtLeftSquareBracketAfterRightSquareBracket_example; // String | 
final String createdAtLeftSquareBracketStrictlyAfterRightSquareBracket = createdAtLeftSquareBracketStrictlyAfterRightSquareBracket_example; // String | 
final BuiltList<String> groupsLeftSquareBracketRightSquareBracket = ; // BuiltList<String> | 

try {
    final response = api.apiBouldersGetCollection(page, itemsPerPage, pagination, orderLeftSquareBracketIdRightSquareBracket, orderLeftSquareBracketNameRightSquareBracket, orderLeftSquareBracketGradePeriodNameRightSquareBracket, id, idLeftSquareBracketRightSquareBracket, name, gradePeriodName, gradePeriodNameLeftSquareBracketRightSquareBracket, rockPeriodBoulderAreaPeriodId, rockPeriodBoulderAreaPeriodIdLeftSquareBracketRightSquareBracket, rockPeriodBoulderAreaPeriodName, rockPeriodBoulderAreaPeriodNameLeftSquareBracketRightSquareBracket, rockPeriodBoulderAreaPeriodMunicipalityPeriodName, rockPeriodBoulderAreaPeriodMunicipalityPeriodNameLeftSquareBracketRightSquareBracket, rockPeriodId, rockPeriodIdLeftSquareBracketRightSquareBracket, term, createdAtLeftSquareBracketBeforeRightSquareBracket, createdAtLeftSquareBracketStrictlyBeforeRightSquareBracket, createdAtLeftSquareBracketAfterRightSquareBracket, createdAtLeftSquareBracketStrictlyAfterRightSquareBracket, groupsLeftSquareBracketRightSquareBracket);
    print(response);
} catch on DioException (e) {
    print('Exception when calling BoulderApi->apiBouldersGetCollection: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page** | **int**| The collection page number | [optional] [default to 1]
 **itemsPerPage** | **int**| The number of items per page | [optional] [default to 30]
 **pagination** | **bool**| Enable or disable pagination | [optional] 
 **orderLeftSquareBracketIdRightSquareBracket** | **String**|  | [optional] [default to 'asc']
 **orderLeftSquareBracketNameRightSquareBracket** | **String**|  | [optional] [default to 'asc']
 **orderLeftSquareBracketGradePeriodNameRightSquareBracket** | **String**|  | [optional] [default to 'asc']
 **id** | **int**|  | [optional] 
 **idLeftSquareBracketRightSquareBracket** | [**BuiltList&lt;int&gt;**](int.md)|  | [optional] 
 **name** | **String**|  | [optional] 
 **gradePeriodName** | **String**|  | [optional] 
 **gradePeriodNameLeftSquareBracketRightSquareBracket** | [**BuiltList&lt;String&gt;**](String.md)|  | [optional] 
 **rockPeriodBoulderAreaPeriodId** | **int**|  | [optional] 
 **rockPeriodBoulderAreaPeriodIdLeftSquareBracketRightSquareBracket** | [**BuiltList&lt;int&gt;**](int.md)|  | [optional] 
 **rockPeriodBoulderAreaPeriodName** | **String**|  | [optional] 
 **rockPeriodBoulderAreaPeriodNameLeftSquareBracketRightSquareBracket** | [**BuiltList&lt;String&gt;**](String.md)|  | [optional] 
 **rockPeriodBoulderAreaPeriodMunicipalityPeriodName** | **String**|  | [optional] 
 **rockPeriodBoulderAreaPeriodMunicipalityPeriodNameLeftSquareBracketRightSquareBracket** | [**BuiltList&lt;String&gt;**](String.md)|  | [optional] 
 **rockPeriodId** | **int**|  | [optional] 
 **rockPeriodIdLeftSquareBracketRightSquareBracket** | [**BuiltList&lt;int&gt;**](int.md)|  | [optional] 
 **term** | **String**|  | [optional] 
 **createdAtLeftSquareBracketBeforeRightSquareBracket** | **String**|  | [optional] 
 **createdAtLeftSquareBracketStrictlyBeforeRightSquareBracket** | **String**|  | [optional] 
 **createdAtLeftSquareBracketAfterRightSquareBracket** | **String**|  | [optional] 
 **createdAtLeftSquareBracketStrictlyAfterRightSquareBracket** | **String**|  | [optional] 
 **groupsLeftSquareBracketRightSquareBracket** | [**BuiltList&lt;String&gt;**](String.md)|  | [optional] 

### Return type

[**ApiBouldersGetCollection200Response**](ApiBouldersGetCollection200Response.md)

### Authorization

[JWT](../README.md#JWT)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/ld+json, application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiBouldersIdGet**
> BoulderJsonldBoulderItemGet apiBouldersIdGet(id)

Retrieves a Boulder resource.

Retrieves a Boulder resource.

### Example
```dart
import 'package:breizh_blok_api_generated/api.dart';
// TODO Configure API key authorization: JWT
//defaultApiClient.getAuthentication<ApiKeyAuth>('JWT').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('JWT').apiKeyPrefix = 'Bearer';

final api = BreizhBlokApiGenerated().getBoulderApi();
final String id = id_example; // String | Boulder identifier

try {
    final response = api.apiBouldersIdGet(id);
    print(response);
} catch on DioException (e) {
    print('Exception when calling BoulderApi->apiBouldersIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| Boulder identifier | 

### Return type

[**BoulderJsonldBoulderItemGet**](BoulderJsonldBoulderItemGet.md)

### Authorization

[JWT](../README.md#JWT)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/ld+json, application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

