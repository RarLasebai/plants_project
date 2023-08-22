import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plants_project/core/utils/colors/colors.dart';
import 'package:plants_project/features/orders/presentation/screens/cart_screen.dart';

class HomeHeaderWidget extends StatelessWidget {
  final String normalText, boldText;
  const HomeHeaderWidget(
      {super.key, required this.normalText, required this.boldText});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text.rich(TextSpan(
            text: normalText,
            style: const TextStyle(fontSize: 32, fontFamily: "InriaSans"),
            children: [
              TextSpan(
                text: boldText,
                style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    fontFamily: "InriaSans"),
              )
            ])),
        GestureDetector(
          onTap: () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => const CartScreen())),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 8),
            decoration: BoxDecoration(
                border: Border.all(color: secondaryFont),
                borderRadius: BorderRadius.circular(12.r)),
            child: Image.asset("assets/icons/bag.png", color: secondaryFont),
          ),
        )
      ],
    );
  }
}
