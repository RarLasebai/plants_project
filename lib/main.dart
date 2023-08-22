import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plants_project/features/auth/presentation/screens/login_screen.dart';

import 'bloc_obs.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      useInheritedMediaQuery: true,
      builder: (BuildContext context, Widget? child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Plants App",
        theme: ThemeData(scaffoldBackgroundColor: Colors.white),
        home: const LoginScreen(),
      ),
    );
  }
}
