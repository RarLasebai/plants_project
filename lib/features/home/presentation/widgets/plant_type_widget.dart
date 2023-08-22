import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plants_project/core/utils/colors/colors.dart';
import 'package:plants_project/core/utils/widgets/txt_style.dart';

class PlanTypeWidget extends StatelessWidget {
  final bool isSelected;
  final String title;
  const PlanTypeWidget({
    super.key,
    required this.isSelected,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 17),
        decoration: BoxDecoration(
            color: isSelected ? primary : Colors.white,
            borderRadius: BorderRadius.circular(24.r),
            border: Border.all(color: isSelected ? Colors.white : primary)),
        child: Center(
            child: TxtStyle(
          title,
          14,
          fontWeight: FontWeight.bold,
        )),
      ),
    );
  }
}
