
import 'package:plants_project/features/home/data/model/plant_model.dart';

abstract class FavoriteStates {}

class FavoriteInitialState extends FavoriteStates {}

class FavoriteLoadingState implements FavoriteStates {}
class FavoritePlantsEmptyState implements FavoriteStates {}

class FavoritePlantsLoadedState extends FavoriteStates {
  List<PlantModel> plants;
  FavoritePlantsLoadedState({required this.plants});
}

class FavoriteErrorState implements FavoriteStates {
  final String message;
  FavoriteErrorState(this.message);
}
