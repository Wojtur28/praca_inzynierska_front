# praca_inzynierska_api.model.SteamGame

## Load the model package
```dart
import 'package:praca_inzynierska_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **String** | Unique identifier of the Steam game. | [optional] 
**appId** | **int** | Steam API identifier for the game. | [optional] 
**title** | **String** | Title of the game. | [optional] 
**reviewsTotal** | **int** | Total number of reviews for the game. | [optional] 
**reviewsScoreFancy** | **String** | Average review score in a fancy format (e.g., \"Very Positive\"). | [optional] 
**releaseDate** | [**Date**](Date.md) | Release date of the game. | [optional] 
**launchPrice** | **String** | Launch price of the game. | [optional] 
**tags** | **String** | Tags associated with the game, stored as a comma-separated string. | [optional] 
**steamPage** | **String** | URL to the game's Steam page. | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


