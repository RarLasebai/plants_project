import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plants_project/core/utils/functions/utils_functios.dart';
import 'package:plants_project/features/auth/data/model/user_model.dart';
import 'package:plants_project/features/profile/application/profile_cubit/profile_states.dart';

class ProfileCubit extends Cubit<ProfileStates> {
  ProfileCubit() : super(ProfileInitialState());

  static ProfileCubit get(context) => BlocProvider.of(context);
//vars
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  getUser() async {
    final UserModel user = await getDataFromSharedPref();
    emit(ProfileLoadingState());
    firestore.collection("users").doc(user.userId).get().then((value) {
      final UserModel userModel = UserModel.fromMap(value.data()!);
      emit(ProfileLoadedState(userModel));
      storeDataLocally(userModel);
    });
  }
}
