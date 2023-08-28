import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:plants_project/core/utils/colors/colors.dart';
import 'package:plants_project/core/utils/functions/utils_functios.dart';
import 'package:plants_project/core/utils/screens/home_layout.dart';
import 'package:plants_project/core/utils/widgets/loading_widget.dart';
import 'package:plants_project/core/utils/widgets/txt_style.dart';
import 'package:plants_project/features/auth/application/auth_cubit/auth_cubit.dart';
import 'package:plants_project/features/auth/application/auth_cubit/auth_states.dart';
import 'package:plants_project/features/auth/presentation/screens/login_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AuthCubit()..checkSign(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 18.0),
                child: SizedBox(
                  width: 250.w,
                  // height: 150.h,
                  child: Image.asset(
                    "assets/images/logo.png",
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            ),
            const TxtStyle("Hello Green World!", 25),
            SizedBox(
              height: 150.h,
            ),
            const SpinKitThreeInOut(
              color: secondaryFont,
              size: 50,
            ),
            BlocConsumer<AuthCubit, AuthStates>(listener: (context, authState) {
              if (authState is AuthSuccessState) {
                Timer(
                    const Duration(seconds: 2),
                    () => Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const HomeLayout()),
                          (Route<dynamic> route) => false,
                        ));
              } else if (authState is AuthFailState) {
                {
                  Timer(
                      const Duration(seconds: 3),
                      () => Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginScreen()),
                            (Route<dynamic> route) => false,
                          ));
                }
              } else if (authState is AuthErrorState) {
                showToast(context, authState.message);
              }
            }, builder: (context, authState) {
              if (authState is AuthLoadingState) {
                return const LoadingWidget();
              } else {
                return const SizedBox();
              }
            })
          ],
        ),
      ),
    );
  }
}
