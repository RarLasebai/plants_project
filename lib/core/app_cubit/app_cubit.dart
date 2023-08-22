import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plants_project/features/favorite/presentation/screens/favorite_screen.dart';
import 'package:plants_project/features/home/presentation/screens/home_screen.dart';
import 'package:plants_project/features/orders/presentation/screens/orders_screen.dart';

import 'app_states.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  //Variables
  //Bottom Navigation Bar
  int currentIndex = 0;

  List<Widget> screens = [
    const HomeScreen(),
    const FavoriteScreen(),
    const OrdersScreen()
  ];

  //Methods
  //Bottom Navigation Bar
  void changeBottomNavBarScreen(int index) {
    currentIndex = index;
    emit(BottomNavBarChangeScreenState());
  }

 

  // Future signOut() async {
  //   await auth.signOut();
  //   final SharedPreferences sharedPreferences =
  //       await SharedPreferences.getInstance();
  //   sharedPreferences.setBool("is_signed_in", false);
  //   sharedPreferences.clear();
  // }
}
