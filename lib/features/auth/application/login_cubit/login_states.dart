import 'package:plants_project/features/auth/data/model/user_model.dart';

abstract class LoginStates {}

class LoginInitialState extends LoginStates {}

class LoginLoadingState extends LoginStates {}

// class LoginSavedSuccessState extends LoginStates {}

class LoginSuccessState extends LoginStates {
  final UserModel userModel;
  LoginSuccessState(this.userModel);
}

class UserNotFoundState extends LoginStates {}

// class UserNotSavedLocally implements LoginStates {
//   final String message;
//   UserNotSavedLocally(this.message);
// }

class LoginErrorState implements LoginStates {
  final String message;
  LoginErrorState(this.message);
}

class LoginChangePassVisibiltyState extends LoginStates {}
