import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plants_project/core/utils/colors/colors.dart';
import 'package:plants_project/core/utils/functions/utils_functios.dart';
import 'package:plants_project/core/utils/widgets/custom_button.dart';
import 'package:plants_project/core/utils/widgets/loading_widget.dart';
import 'package:plants_project/core/utils/widgets/txt_style.dart';
import 'package:plants_project/features/auth/application/signup_cubit/signup_cubit.dart';
import 'package:plants_project/features/auth/application/signup_cubit/signup_states.dart';
import 'package:plants_project/features/auth/presentation/screens/login_screen.dart';
import 'package:plants_project/features/auth/presentation/screens/verify_email_screen.dart';
import 'package:plants_project/features/auth/presentation/widgets/auth_text_field.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupCubit(),
      child:
          BlocConsumer<SignupCubit, SignupStates>(listener: (context, state) {
        // if (state is SignupSuccessState) {
        //   Navigator.pushAndRemoveUntil(
        //       context,
        //       MaterialPageRoute(builder: (context) => const HomeLayout()),
        //       (Route<dynamic> route) => false);
        // }
        if (state is SignupErrorState) {
          showToast(context, "Something went wrong Try again later!");
        }
      }, builder: (context, state) {
        SignupCubit signupCubit = SignupCubit.get(context);

        return Scaffold(
          resizeToAvoidBottomInset: true,
          body: Form(
            key: signupCubit.signupFormKey,
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 64, bottom: 24.0, left: 24.0, right: 24.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(child: Image.asset("assets/images/logo.png")),
                    SizedBox(height: 69.h),
                    const TxtStyle("Sign-Up", 32),
                    AuthTextField(
                        hint: "User Name",
                        controller: signupCubit.userNameController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Enter Your Name";
                          } else {
                            return null;
                          }
                        }),
                    AuthTextField(
                      hint: "Email",
                      controller: signupCubit.emailController,
                      isEmail: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Enter Your Email";
                        } else {
                          return null;
                        }
                      },
                    ),
                    AuthTextField(
                      hint: "Password",
                      controller: signupCubit.passController,
                      isPass: signupCubit.isPassword,
                      suffixIcon: signupCubit.suffixIcon,
                      suffixOnTap: signupCubit.changePassVisibilty,
                      isPassField: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Enter Your Password";
                        } else {
                          return null;
                        }
                      },
                    ),
                    AuthTextField(
                      hint: "Confirm Password",
                      controller: signupCubit.confirmPassController,
                      isPass: signupCubit.isPassword,
                      suffixIcon: signupCubit.suffixIcon,
                      suffixOnTap: signupCubit.changePassVisibilty,
                      isPassField: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please Confirm Your Password";
                        } else if (value != signupCubit.passController.text) {
                          return "Passwords doesn't match!";
                        } else {
                          return null;
                        }
                      },
                    ),
                    ConditionalBuilder(
                        condition: state is! SignupLoadingState,
                        fallback: (context) => const LoadingWidget(),
                        builder: (context) {
                          return CustomButton(
                              text: "Register",
                              onTap: () {
                                if (signupCubit.signupFormKey.currentState!
                                    .validate()) {
                                  signupCubit.signuprUser(
                                      email: signupCubit.emailController.text,
                                      password: signupCubit.passController.text,
                                      name:
                                          signupCubit.userNameController.text);
                                }
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            BlocProvider.value(
                                              value: signupCubit,
                                              child: VerifyEmailScreen(
                                                  signupCubit),
                                            )));
                              });
                        }),
                    SizedBox(height: 8.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const TxtStyle("Already Have an Account? ", 18,
                            color: darkGrey),
                        GestureDetector(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginScreen())),
                          child: const TxtStyle(
                            "Login!",
                            18,
                            textDecoration: TextDecoration.underline,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
