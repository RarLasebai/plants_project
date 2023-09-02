import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plants_project/core/utils/functions/utils_functios.dart';
import 'package:plants_project/features/home/data/model/plant_model.dart';

import '../../../auth/data/model/user_model.dart';
import 'home_states.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);

  //vars
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  int currentIndex = 0;
  int? selectedIndex = 0;
  var fav = Colors.white;
  //methods

  void plantTypeChanges(int index) {
    currentIndex = index;
    emit(PlantTypeIndexChangeState());
  }

  Future getPlants(String categeory) async {
    List<PlantModel> plants = [];
    emit(HomeLoadingState());
    try {
      QuerySnapshot query = await firestore
          .collection("plants")
          .where("plantCateg", isEqualTo: categeory)
          .get();

      if (query.docs.isNotEmpty) {
        query.docs.map<List<PlantModel>>((e) {
          final data = e.data() as Map<String, dynamic>;

          final PlantModel plantModel = PlantModel.fromMap(data);
          plants.add(plantModel);
          return plants;
        }).toList();
        emit(PlantsLoadedState(plants));
      } else {
        emit(HomeErrorState("Something went wrong when getting the plants!"));
      }
    } catch (e) {
      emit(HomeErrorState(e.toString()));
    }
  }

  Future addToFav(String plantId, String cat) async {
    UserModel user = await getDataFromSharedPref();
    //store in the firestore
    emit(AddPlantToFavLoadingState());
    try {
      if (user.favPlants!.contains(plantId)) {
        await firestore.collection("users").doc(user.userId).update({
          "favPlants": FieldValue.arrayRemove([plantId]),
        });
        await firestore.collection("plants").doc(plantId).update({
          "isFav": "false",
        });
        fav = Colors.white;
        emit(RemovePlantFromFavSuccessState());
      } else {
        await firestore.collection("users").doc(user.userId).update({
          "favPlants": FieldValue.arrayUnion([plantId]),
        });
        await firestore.collection("plants").doc(plantId).update({
          "isFav": "true",
        });
        fav = Colors.red;

        emit(AddPlantToFavSuccessState());
      }
              getPlants(cat);

      QuerySnapshot query = await firestore
          .collection("users")
          .where("userId", isEqualTo: user.userId)
          .get();

      // ignore: avoid_function_literals_in_foreach_calls
      query.docs.forEach((element) async {
        final data = element.data() as Map<String, dynamic>;
        UserModel user = UserModel.fromMap(data);
        await storeDataLocally(user);
      });
    } catch (e) {
      emit(HomeErrorState(e.toString()));
    }
  }
}
