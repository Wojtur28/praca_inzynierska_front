# praca_inzynierska_api.api.SteamReviewsApi

## Load the API package
```dart
import 'package:praca_inzynierska_api/api.dart';
```

All URIs are relative to *http://localhost:8080*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getGameReviews**](SteamReviewsApi.md#getgamereviews) | **GET** /games/{gameId}/reviews | Retrieve paginated reviews for a specific game


# **getGameReviews**
> BuiltList<SteamReview> getGameReviews(gameId, page, size)

Retrieve paginated reviews for a specific game

### Example
```dart
import 'package:praca_inzynierska_api/api.dart';

final api = PracaInzynierskaApi().getSteamReviewsApi();
final String gameId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 
final int page = 56; // int | The page index (zero-based).
final int size = 56; // int | The number of items per page.

try {
    final response = api.getGameReviews(gameId, page, size);
    print(response);
} catch on DioException (e) {
    print('Exception when calling SteamReviewsApi->getGameReviews: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **gameId** | **String**|  | 
 **page** | **int**| The page index (zero-based). | [optional] [default to 0]
 **size** | **int**| The number of items per page. | [optional] [default to 10]

### Return type

[**BuiltList&lt;SteamReview&gt;**](SteamReview.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

