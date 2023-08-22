import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:plants_project/core/utils/colors/colors.dart';
import 'package:plants_project/core/utils/widgets/txt_style.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        ],
      ),
    );
  }
}
