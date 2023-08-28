import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plants_project/core/utils/colors/colors.dart';
import 'package:plants_project/core/utils/functions/utils_functios.dart';
import 'package:plants_project/core/utils/screens/home_layout.dart';
import 'package:plants_project/core/utils/widgets/custom_button.dart';
import 'package:plants_project/core/utils/widgets/loading_widget.dart';
import 'package:plants_project/core/utils/widgets/txt_style.dart';
import 'package:plants_project/features/auth/application/login_cubit/login_cubit.dart';
import 'package:plants_project/features/auth/application/login_cubit/login_states.dart';
import 'package:plants_project/features/auth/presentation/screens/forget_password_screen.dart';
import 'package:plants_project/features/auth/presentation/screens/signup_screen.dart';
import 'package:plants_project/features/auth/presentation/widgets/auth_text_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(listener: (context, state) {
        if (state is LoginSuccessState) {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                  builder: (context) => const HomeLayout()),
              (Route<dynamic> route) => false);
        } else if (state is LoginErrorState) {
          showToast(context, "Something went wrong Try again later!");
        }
      }, builder: (context, state) {
        LoginCubit loginCubit = LoginCubit.get(context);

        return Scaffold(
          resizeToAvoidBottomInset: true,
          body: Form(
            key: loginCubit.loginFormKey,
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 64, bottom: 24.0, left: 24.0, right: 24.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(child: Image.asset("assets/images/logo.png")),
                    SizedBox(height: 129.h),
                    const TxtStyle("Login", 32),
                    AuthTextField(
                        hint: "Email",
                        isEmail: true,
                        controller: loginCubit.emailController,
                        validator: (v) {
                          if (v == null || v.isEmpty) {
                            return "Enter Your Email";
                          } else {
                            return null;
                          }
                        }),
                    AuthTextField(
                        hint: "Password",
                        controller: loginCubit.passController,
                        isPassField: true,
                        isPass: loginCubit.isPassword,
                        suffixIcon: loginCubit.suffixIcon,
                        suffixOnTap: loginCubit.changePassVisibilty,
                        validator: (v) {
                          if (v == null || v.isEmpty) {
                            return "Enter Your Password";
                          } else {
                            return null;
                          }
                        }),
                    ConditionalBuilder(
                        condition: state is! LoginLoadingState,
                        fallback: (context) => const LoadingWidget(),
                        builder: (context) {
                          return CustomButton(
                              text: "Login",
                              onTap: () {
                                if (loginCubit.loginFormKey.currentState!
                                    .validate()) {
                                  loginCubit.login(
                                      email: loginCubit.emailController.text,
                                      password: loginCubit.passController.text);
                                }
                              });
                        }),
                    SizedBox(height: 8.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const TxtStyle("Forgot Your Password? ", 18,
                            color: darkGrey),
                        GestureDetector(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const ForgetPasswordScreen())),
                          child: const TxtStyle(
                            "Restore!",
                            18,
                            textDecoration: TextDecoration.underline,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const TxtStyle("Don’t Have an Account? ", 18,
                            color: darkGrey),
                        GestureDetector(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignupScreen())),
                          child: const TxtStyle(
                            "Register!",
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
