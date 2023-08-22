import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plants_project/core/utils/colors/colors.dart';
import 'package:plants_project/core/utils/widgets/custom_button.dart';
import 'package:plants_project/core/utils/widgets/txt_style.dart';
import 'package:plants_project/features/auth/presentation/widgets/auth_text_field.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController forgetPassController = TextEditingController();
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
              SizedBox(height: 169.h),
              const TxtStyle("Restore Password", 32),
              AuthTextField(
                  hint: "Email",
                  controller: forgetPassController,
                  validator: (v) {
                    return "";
                  }),
              CustomButton(text: "Restore", onTap: () {}),
              SizedBox(height: 8.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const TxtStyle("Remember the Password? ", 18,
                      color: darkGrey),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
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
