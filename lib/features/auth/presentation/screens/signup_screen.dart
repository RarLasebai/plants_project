import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plants_project/core/utils/colors/colors.dart';
import 'package:plants_project/core/utils/widgets/custom_button.dart';
import 'package:plants_project/core/utils/widgets/txt_style.dart';
import 'package:plants_project/features/auth/presentation/screens/login_screen.dart';
import 'package:plants_project/features/auth/presentation/widgets/auth_text_field.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passController = TextEditingController();

    TextEditingController userNameController = TextEditingController();
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
              SizedBox(height: 69.h),
              const TxtStyle("Sign-Up", 32),
              AuthTextField(
                  hint: "User Name",
                  controller: userNameController,
                  validator: (v) {
                    return "";
                  }),
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
              AuthTextField(
                  hint: "Confirm Password",
                  controller: passController,
                  validator: (v) {
                    return "";
                  }),
              CustomButton(text: "Register", onTap: () {}),
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
    );
  }
}
