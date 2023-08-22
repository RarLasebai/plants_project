import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plants_project/core/utils/colors/colors.dart';
import 'package:plants_project/core/utils/widgets/txt_style.dart';

class AddToCartWidget extends StatelessWidget {
  final bool isDetailScreen;
  const AddToCartWidget({super.key, this.isDetailScreen = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(42.r),
          border: Border.all(color: Colors.yellow)),
      padding: const EdgeInsets.only(top: 18, bottom: 17, left: 15, right: 8),
      child: Row(
        children: [
          isDetailScreen
              ? CircleAvatar(
                  backgroundColor: primary,
                  child:
                      Image.asset("assets/icons/bag.png", color: Colors.black),
                )
              : Image.asset("assets/icons/bag.png", color: Colors.yellow),
          const TxtStyle("  Add to Cart", 14,
              fontWeight: FontWeight.bold, color: Colors.white),
          isDetailScreen ? const Spacer() : SizedBox(width: 60.w),
          const TxtStyle(" 50.00  ", 14,
              fontWeight: FontWeight.bold, color: Colors.white),
        ],
      ),
    );
  }
}
