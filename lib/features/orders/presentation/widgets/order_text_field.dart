import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plants_project/core/utils/colors/colors.dart';

class OrderTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  const OrderTextField({super.key, required this.controller, required this.hint});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 60.h,
        padding:
            const EdgeInsets.only(right: 21, top: 16, bottom: 22, left: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(42.r),
          color: primarySoft,
        ),
        child: TextFormField(
          controller: controller,
          style: TextStyle(
              fontFamily: 'InriaSans',
              color: Colors.black,
              fontSize: 16.sp,
              fontWeight: FontWeight.bold),
          decoration:  InputDecoration.collapsed(hintText: hint),
        ));
  }
}
