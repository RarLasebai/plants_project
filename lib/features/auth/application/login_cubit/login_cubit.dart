import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plants_project/core/utils/functions/utils_functios.dart';
import 'package:plants_project/features/auth/application/login_cubit/login_states.dart';
import 'package:plants_project/features/auth/data/model/user_model.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

//variables
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

//methods

  void login({
    required String email,
    required String password,
  }) async {
    emit(LoginLoadingState());
    firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      final userId = value.user!.uid;
      firestore.collection("users").doc(userId).get().then((value) {
        final UserModel userModel = UserModel.fromMap(value.data()!);
        emit(LoginSuccessState(userModel));
        storeDataLocally(userModel);
      });
    }).catchError((error) {
      emit(LoginErrorState(error.toString()));
    });
  }
    //show-hide password
  IconData suffixIcon = Icons.visibility_outlined;
  bool isPassword = true;
  void changePassVisibilty() {
    isPassword = !isPassword;
    suffixIcon =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;

    emit(LoginChangePassVisibiltyState());
  }
}
