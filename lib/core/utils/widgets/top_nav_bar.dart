import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plants_project/core/utils/colors/colors.dart';

import 'txt_style.dart';

class TopNavBar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final double titleSize;
  @override
  final Size preferredSize;
  TopNavBar(this.title, {Key? key, this.titleSize = 32})
      : preferredSize = Size.fromHeight(500.0.h),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: false,
      title: TxtStyle(title, 32),
      elevation: 0,
      actions: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 8),
          decoration: BoxDecoration(
              border: Border.all(color: secondaryFont),
              borderRadius: BorderRadius.circular(12.r)),
          child: Image.asset("assets/icons/bag.png", color: secondaryFont),
        )
      ],
    );
  }
}
