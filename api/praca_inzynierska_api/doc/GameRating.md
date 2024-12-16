# praca_inzynierska_api.model.GameRating

## Load the model package
```dart
import 'package:praca_inzynierska_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **String** | Unique identifier of the rating. | [optional] 
**steamGame** | [**SteamGame**](SteamGame.md) |  | [optional] 
**user** | [**User**](User.md) |  | [optional] 
**rating** | **int** | The rating score given by the user. | [optional] 
**content** | **String** | Additional comments provided by the user. | [optional] 
**votesUp** | **int** | Number of upvotes for this rating. | [optional] 
**votesDown** | **int** | Number of downvotes for this rating. | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


