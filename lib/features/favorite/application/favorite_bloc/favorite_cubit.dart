import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plants_project/features/favorite/application/favorite_bloc/favorite_states.dart';
import 'package:plants_project/features/home/data/model/plant_model.dart';

class FavoriteCubit extends Cubit<FavoriteStates> {
  FavoriteCubit() : super(FavoriteInitialState());

  static FavoriteCubit get(context) => BlocProvider.of(context);
//vars
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  
  Future getPlants() async {
    List<PlantModel> plants = [];
    emit(FavoriteLoadingState());
    try {
      QuerySnapshot query = await firestore
          .collection("plants")
          .where("isFav", isEqualTo: "true")
          .get();

      if (query.docs.isNotEmpty) {
        query.docs.map<List<PlantModel>>((e) {
          final data = e.data() as Map<String, dynamic>;

          final PlantModel plantModel = PlantModel.fromMap(data);
          plants.add(plantModel);
          return plants;
        }).toList();
        emit(FavoritePlantsLoadedState(plants: plants));
      } else {
        emit(FavoriteErrorState("Something went wrong when getting the plants!"));
      }
    } catch (e) {
      emit(FavoriteErrorState(e.toString()));
    }
  }

}
