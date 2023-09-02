import 'package:plants_project/features/auth/data/model/user_model.dart';

abstract class SignupStates {}

class SignupInitialState extends SignupStates {}

class SignupLoadingState extends SignupStates {}

class SignupSuccessState extends SignupStates {
  final UserModel userModel;
  SignupSuccessState(this.userModel);
}

class SignupChangePassVisibiltyState extends SignupStates {}

class EmailVerifiedState extends SignupStates {}

class SignupErrorState implements SignupStates {
  final String message;
  SignupErrorState(this.message);
}
