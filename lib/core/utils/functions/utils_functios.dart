// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:plants_project/core/utils/screens/splash_screen.dart';
import 'package:plants_project/features/auth/data/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

void showToast(BuildContext context, String content,
    {Color color = Colors.red}) {
  Fluttertoast.showToast(
      msg: content,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 5,
      backgroundColor: color,
      textColor: Colors.white,
      fontSize: 16.0);
  // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(content)));
}

//store data locally
Future storeDataLocally(UserModel userModel) async {
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
  await sharedPreferences.setString(
      "user_model", jsonEncode(userModel.toMap()));
  print("data saved");
  setSignin();
}


Future setSignin() async {
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
  sharedPreferences.setBool("is_signed_in", true);
  print("user login saved");
}

Future signOut(BuildContext context) async {
  await FirebaseAuth.instance.signOut();
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
  sharedPreferences.setBool("is_signed_in", false);
  // ignore: use_build_context_synchronously
  Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(builder: (context) => const SplashScreen()),
    (Route<dynamic> route) => false,
  );
}
