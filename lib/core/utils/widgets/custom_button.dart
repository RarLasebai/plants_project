import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../colors/colors.dart';
import 'txt_style.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Color color;
  final int width;
  const CustomButton({
    required this.text,
    required this.onTap,
    this.width = 382,
    this.color = primary,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 22),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 54.h,
          width: width.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            color: color,
          ),
          child: Center(
            child: TxtStyle(
              text,
              21,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
