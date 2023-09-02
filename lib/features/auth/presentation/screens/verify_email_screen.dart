import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plants_project/core/utils/screens/home_layout.dart';
import 'package:plants_project/core/utils/widgets/custom_button.dart';
import 'package:plants_project/core/utils/widgets/txt_style.dart';
import 'package:plants_project/features/auth/application/signup_cubit/signup_cubit.dart';
import 'package:plants_project/features/auth/application/signup_cubit/signup_states.dart';

class VerifyEmailScreen extends StatelessWidget {
  final SignupCubit signupCubit;
  const VerifyEmailScreen(this.signupCubit, {super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: BlocProvider.of<SignupCubit>(context),
      child: Scaffold(
          body: Padding(
              padding: const EdgeInsets.only(
                  top: 64, bottom: 24.0, left: 24.0, right: 24.0),
              child: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    Center(
                      child: Image.asset("assets/images/logo.png"),
                    ),
                    SizedBox(height: 69.h),
                    const TxtStyle(
                        "We Sent A Verification Code, Check Your Email", 32),
                    BlocConsumer<SignupCubit, SignupStates>(
                        listener: (context, state) {},
                        builder: (context, state) {
                          SignupCubit cubit = SignupCubit.get(context);
                          if (state is EmailVerifiedState) {
                            return CustomButton(
                                text: "Continue",
                                onTap: () {
                                  if (cubit.emailVerifed == true) {
                                    Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const HomeLayout()),
                                        (Route<dynamic> route) => false);
                                  }
                                });
                          } else {
                            return CustomButton(
                                text: "Continue",
                                onTap: () {},
                                color: Colors.grey);
                          }
                        })
                  ])))),
    );
  }
}
