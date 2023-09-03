import 'package:plants_project/features/auth/data/model/user_model.dart';

abstract class ProfileStates {}

class ProfileInitialState extends ProfileStates {}

class ProfileLoadingState implements ProfileStates {}

class ProfileLoadedState extends ProfileStates {
  final UserModel userModel;

  ProfileLoadedState(this.userModel);

}

class ProfileErrorState implements ProfileStates {
  final String message;
  ProfileErrorState(this.message);
}
