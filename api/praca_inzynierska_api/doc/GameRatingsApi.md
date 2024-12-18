# praca_inzynierska_api.api.GameRatingsApi

## Load the API package
```dart
import 'package:praca_inzynierska_api/api.dart';
```

All URIs are relative to *http://localhost:8080*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createGameRating**](GameRatingsApi.md#creategamerating) | **POST** /games/{gameId}/ratings | Create a new rating for a game
[**getGameRatings**](GameRatingsApi.md#getgameratings) | **GET** /games/{gameId}/ratings | Retrieve paginated game ratings for a specific Steam game


# **createGameRating**
> GameRating createGameRating(gameId, createGameRating)

Create a new rating for a game

### Example
```dart
import 'package:praca_inzynierska_api/api.dart';

final api = PracaInzynierskaApi().getGameRatingsApi();
final String gameId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | The ID of the game to rate
final CreateGameRating createGameRating = ; // CreateGameRating | Rating details

try {
    final response = api.createGameRating(gameId, createGameRating);
    print(response);
} catch on DioException (e) {
    print('Exception when calling GameRatingsApi->createGameRating: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **gameId** | **String**| The ID of the game to rate | 
 **createGameRating** | [**CreateGameRating**](CreateGameRating.md)| Rating details | 

### Return type

[**GameRating**](GameRating.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getGameRatings**
> BuiltList<GameRating> getGameRatings(gameId, page, size)

Retrieve paginated game ratings for a specific Steam game

### Example
```dart
import 'package:praca_inzynierska_api/api.dart';

final api = PracaInzynierskaApi().getGameRatingsApi();
final String gameId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | ID of the Steam game to retrieve ratings for
final int page = 56; // int | The page index (zero-based).
final int size = 56; // int | The number of items per page.

try {
    final response = api.getGameRatings(gameId, page, size);
    print(response);
} catch on DioException (e) {
    print('Exception when calling GameRatingsApi->getGameRatings: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **gameId** | **String**| ID of the Steam game to retrieve ratings for | 
 **page** | **int**| The page index (zero-based). | [optional] [default to 0]
 **size** | **int**| The number of items per page. | [optional] [default to 10]

### Return type

[**BuiltList&lt;GameRating&gt;**](GameRating.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

