import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plants_project/core/utils/functions/utils_functios.dart';
import 'package:plants_project/features/auth/application/signup_cubit/signup_states.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:plants_project/features/auth/data/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignupCubit extends Cubit<SignupStates> {
  SignupCubit() : super(SignupInitialState());

  static SignupCubit get(context) => BlocProvider.of(context);

//variables
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();
  bool emailVerifed = false;
//methods

  void signuprUser(
      {required String email,
      required String password,
      required String name}) async {
    emit(SignupLoadingState());
    firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      value.user!.sendEmailVerification();
      if (value.user!.emailVerified == true) {
        emailVerifed = true;
      } else {
        emailVerifed = false;
      }
      emit(EmailVerifiedState());
      final UserModel userModel = UserModel(
          userName: name,
          userId: value.user!.uid,
          userPassword: password,
          userPoints: "0",
          userEmail: email);
      createUser(userModel: userModel);
    }).catchError((error) {
      emit(SignupErrorState(error.toString()));
    });
  }

  void createUser({required UserModel userModel}) async {
    firestore
        .collection("users")
        .doc(userModel.userId)
        .set(userModel.toMap())
        .then((value) {
      emit(SignupSuccessState(userModel));
      storeDataLocally(userModel);
    }).catchError((error) {
      emit(SignupErrorState(error.toString()));
    });
  }

  IconData suffixIcon = Icons.visibility_outlined;
  bool isPassword = true;
  void changePassVisibilty() {
    isPassword = !isPassword;
    suffixIcon =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;

    emit(SignupChangePassVisibiltyState());
  }
}
