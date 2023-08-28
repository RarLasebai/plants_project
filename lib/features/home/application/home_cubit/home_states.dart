import 'package:plants_project/features/home/data/model/plant_model.dart';

abstract class HomeStates {}

class HomeInitialState extends HomeStates {}

class HomeLoadingState extends HomeStates {}

class PlantsLoadedState extends HomeStates {
  final List<PlantModel> plantModel;
  PlantsLoadedState(this.plantModel);
}

class PlantTypeIndexChangeState extends HomeStates {}

class HomeErrorState implements HomeStates {
  final String message;
  HomeErrorState(this.message);
}
