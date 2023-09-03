import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plants_project/core/utils/colors/colors.dart';
import 'package:plants_project/core/utils/widgets/txt_style.dart';
import 'package:plants_project/features/home/data/model/cart_model.dart';

class ItemWidget extends StatelessWidget {
  final CartItemModel cartItem;
  const ItemWidget({super.key, required this.cartItem});

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
                    // right: 1,
                    // top: 4,
                    child: Image.network(cartItem.plantImage,
                        height: 90.h, width: 90.w)),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TxtStyle(cartItem.plantName, 20,
                        fontWeight: FontWeight.bold),
                    TxtStyle("${cartItem.quantity} pieces", 16,
                        color: secondaryFont)
                  ]),
            ),
            const Spacer(),
            Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24.r),
                    color: Colors.white),
                child: TxtStyle("${cartItem.price}", 16,
                    fontWeight: FontWeight.bold)),
          ],
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 14),
          child: Divider(color: secondaryFont),
        )
      ],
    );
  }
}
