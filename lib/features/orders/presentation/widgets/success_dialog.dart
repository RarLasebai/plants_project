import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plants_project/core/utils/colors/colors.dart';
import 'package:plants_project/core/utils/widgets/txt_style.dart';

class SuccessDialog extends StatelessWidget {
  const SuccessDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24.r)),
      elevation: 0.0,
      backgroundColor: Colors.white,
      child: Container(
        padding: const EdgeInsets.all(10),
        height: 250.h,
        decoration: BoxDecoration(
            border: Border.all(color: primary, width: 1.5),
            color: Colors.white,
            borderRadius: BorderRadius.circular(24.0.r)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/success.png",
            ),
            SizedBox(height: 23.h),
            const TxtStyle("Thank You!", 24, fontWeight: FontWeight.bold),
            const TxtStyle(
              "Your Life Will Be More\nGreener!",
              18,
              color: darkGrey,
              textAlignm: TextAlign.center,
              longText: true,
            )
          ],
        ),
      ),
    );
  }
}
