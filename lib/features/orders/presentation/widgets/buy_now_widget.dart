import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plants_project/core/utils/colors/colors.dart';
import 'package:plants_project/core/utils/widgets/txt_style.dart';
import 'package:plants_project/features/orders/presentation/widgets/order_text_field.dart';

class BuyNowWidget extends StatelessWidget {
  const BuyNowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController locationController = TextEditingController();
    TextEditingController phoneController = TextEditingController();

    return Stack(
      children: [
        Image.asset("assets/images/g2.png"),
        Padding(
          padding:
              const EdgeInsets.only(top: 25, bottom: 8, left: 16, right: 16),
          child: Column(
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TxtStyle("Delivery Amount", 16, fontWeight: FontWeight.bold),
                  TxtStyle("20.20", 16, fontWeight: FontWeight.bold)
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Divider(color: Colors.white),
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TxtStyle("Total Amount", 16, fontWeight: FontWeight.bold),
                  TxtStyle("20.20", 16, fontWeight: FontWeight.bold)
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Divider(color: Colors.white),
              ),
              OrderTextField(controller: locationController, hint: "Location"),
              SizedBox(
                height: 5.h,
              ),
              OrderTextField(controller: phoneController, hint: "Phone"),
              SizedBox(height: 5.h),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 13, horizontal: 16),
                decoration: BoxDecoration(
                    color: primaryDark,
                    borderRadius: BorderRadius.circular(42.r),
                    border: Border.all(color: Colors.yellow)),
                child: const TxtStyle("BUY NOW", 14,
                    fontWeight: FontWeight.bold, color: Colors.white),
              )
            ],
          ),
        )
      ],
    );
  }
}
