import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plants_project/features/home/data/model/plant_model.dart';

import 'home_states.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);

  //vars
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  int currentIndex = 0;
  int? selectedIndex = 0;
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
}
