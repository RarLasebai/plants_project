import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plants_project/core/utils/colors/colors.dart';
import 'package:plants_project/core/utils/widgets/txt_style.dart';

class FavoriteWidget extends StatelessWidget {
  const FavoriteWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Stack(
              children: [
                Image.asset(
                  "assets/images/linearColor.png",
                  height: 80.h,
                  width: 80.w,
                ),
                Positioned(
                    left: 18,
                    top: 6,
                    child: Image.asset("assets/images/plant2.png")),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(left: 12, right: 87),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TxtStyle("Mini Cacti", 20, fontWeight: FontWeight.bold),
                    TxtStyle("Description", 14, color: secondaryFont)
                  ]),
            ),
            const TxtStyle("20.22", 16, fontWeight: FontWeight.bold),
          ],
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 24),
          child: Divider(color: secondaryFont),
        )
      ],
    );
  }
}
