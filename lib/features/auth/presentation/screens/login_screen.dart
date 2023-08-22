import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plants_project/core/utils/colors/colors.dart';
import 'package:plants_project/core/utils/screens/home_layout.dart';
import 'package:plants_project/core/utils/widgets/custom_button.dart';
import 'package:plants_project/core/utils/widgets/txt_style.dart';
import 'package:plants_project/features/auth/presentation/screens/forget_password_screen.dart';
import 'package:plants_project/features/auth/presentation/screens/signup_screen.dart';
import 'package:plants_project/features/auth/presentation/widgets/auth_text_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passController = TextEditingController();

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: const EdgeInsets.only(
            top: 64, bottom: 24.0, left: 24.0, right: 24.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(child: Image.asset("assets/images/logo.png")),
              SizedBox(height: 129.h),
              const TxtStyle("Login", 32),
              AuthTextField(
                  hint: "Email",
                  controller: emailController,
                  validator: (v) {
                    return "";
                  }),
              AuthTextField(
                  hint: "Password",
                  controller: passController,
                  validator: (v) {
                    return "";
                  }),
              CustomButton(
                text: "Login",
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HomeLayout())),
              ),
              SizedBox(height: 8.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const TxtStyle("Forgot Your Password? ", 18, color: darkGrey),
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
    );
  }
}
