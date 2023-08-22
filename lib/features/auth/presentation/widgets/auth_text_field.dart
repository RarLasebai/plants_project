import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plants_project/core/utils/colors/colors.dart';
import 'package:plants_project/core/utils/widgets/txt_style.dart';

class AuthTextField extends StatelessWidget {
  final String hint;
  final TextEditingController? controller;
  final int width;
  final bool isNumbers, isPass, isPassField;
  final VoidCallback? onTap;
  // final VoidCallback? onChanged;
  final void Function()? suffixOnTap;
  final void Function(String)? onChanged;

  final IconData suffixIcon;

  final FormFieldValidator<String> validator;

  const AuthTextField({
    required this.hint,
    required this.controller,
    required this.validator,
    this.suffixIcon = Icons.visibility_outlined,
    this.suffixOnTap,
    this.isNumbers = false,
    this.isPass = false,
    this.isPassField = false,
    this.onTap,
    this.onChanged,
    this.width = 382,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20.h),
        TxtStyle(hint, 14, fontWeight: FontWeight.bold),
        SizedBox(height: 5.h),
        Center(
          child: Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: TextFormField(
              onChanged: onChanged,
              obscureText: isPass,
              keyboardType:
                  isNumbers ? TextInputType.number : TextInputType.text,
              // inputFormatters: isPhone == true
              //     ? [
              //         LengthLimitingTextInputFormatter(8),
              //       ]
              //     : null,
              validator: validator,
              controller: controller,
              cursorColor: primary,
              style: TextStyle(
                  fontFamily: 'InriaSans',
                  color: Colors.black,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.bold),
              decoration: InputDecoration(
                fillColor: softGrey,
                filled: true,
                disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    borderSide: const BorderSide(color: primary)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    borderSide: const BorderSide(color: primary)),
                hintText: hint,
                hintStyle: TextStyle(
                    fontFamily: 'InriaSans',
                    color: darkGrey,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold),
                errorStyle: TextStyle(
                    height: 0,
                    fontFamily: 'InriaSans',
                    color: Colors.red,
                    fontSize: 9.sp,
                    fontWeight: FontWeight.bold),
                focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    borderSide: const BorderSide(color: Colors.red)),
                errorBorder: OutlineInputBorder(
                  gapPadding: 0,
                  borderSide: const BorderSide(color: Colors.red),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                enabledBorder: OutlineInputBorder(
                  gapPadding: 0,
                  borderSide: const BorderSide(color: darkGrey),
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
