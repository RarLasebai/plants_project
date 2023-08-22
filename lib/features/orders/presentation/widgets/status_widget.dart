import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plants_project/core/utils/colors/colors.dart';
import 'package:plants_project/core/utils/widgets/txt_style.dart';

class StatusWidget extends StatelessWidget {
  final bool isOrdersScreen;
  final String text;
  const StatusWidget(
      {super.key, required this.text, this.isOrdersScreen = true});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24.r),
          color: isOrdersScreen ? Colors.white : primary),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 22),
      child: TxtStyle(text, 16, fontWeight: FontWeight.bold),
    );
  }
}
