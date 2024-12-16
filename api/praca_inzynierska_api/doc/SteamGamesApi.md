# praca_inzynierska_api.api.SteamGamesApi

## Load the API package
```dart
import 'package:praca_inzynierska_api/api.dart';
```

All URIs are relative to *http://localhost:8080*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getSteamGameDetail**](SteamGamesApi.md#getsteamgamedetail) | **GET** /games/{gameId}/detail | Retrieve Steam game details for a specific game
[**getSteamGames**](SteamGamesApi.md#getsteamgames) | **GET** /games | Retrieve paginated list of Steam games


# **getSteamGameDetail**
> SteamGameDetail getSteamGameDetail(gameId)

Retrieve Steam game details for a specific game

### Example
```dart
import 'package:praca_inzynierska_api/api.dart';

final api = PracaInzynierskaApi().getSteamGamesApi();
final String gameId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | ID of the Steam game to retrieve details for

try {
    final response = api.getSteamGameDetail(gameId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling SteamGamesApi->getSteamGameDetail: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **gameId** | **String**| ID of the Steam game to retrieve details for | 

### Return type

[**SteamGameDetail**](SteamGameDetail.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getSteamGames**
> BuiltList<SteamGame> getSteamGames(page, size)

Retrieve paginated list of Steam games

### Example
```dart
import 'package:praca_inzynierska_api/api.dart';

final api = PracaInzynierskaApi().getSteamGamesApi();
final int page = 56; // int | 
final int size = 56; // int | 

try {
    final response = api.getSteamGames(page, size);
    print(response);
} catch on DioException (e) {
    print('Exception when calling SteamGamesApi->getSteamGames: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page** | **int**|  | [optional] [default to 0]
 **size** | **int**|  | [optional] [default to 10]

### Return type

[**BuiltList&lt;SteamGame&gt;**](SteamGame.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

