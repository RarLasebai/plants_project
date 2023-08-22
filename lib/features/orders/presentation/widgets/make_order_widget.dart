import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:plants_project/core/utils/colors/colors.dart';
import 'package:plants_project/core/utils/widgets/txt_style.dart';
import 'package:plants_project/features/orders/presentation/screens/place_order_screen.dart';

class MakeOrderWidget extends StatelessWidget {
  const MakeOrderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset("assets/images/g1.png"),
        Padding(
          padding:
              const EdgeInsets.only(top: 25, bottom: 8, left: 16, right: 16),
          child: Column(
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TxtStyle("Delivery Amount", 16, fontWeight: FontWeight.bold),
                  TxtStyle("20.20", 18, fontWeight: FontWeight.bold)
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Divider(color: Colors.white),
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TxtStyle("Total Amount", 18, fontWeight: FontWeight.bold),
                  TxtStyle("20.20", 20, fontWeight: FontWeight.bold)
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Divider(color: Colors.white),
              ),
              GestureDetector(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PlaceOrderScreen())),
                child: Container(
                  padding: const EdgeInsets.only(
                      right: 21, top: 16, bottom: 22, left: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(42.r),
                    color: primarySoft,
                  ),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const TxtStyle("Make Order", 18,
                            fontWeight: FontWeight.bold),
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              color: primaryDark,
                              borderRadius: BorderRadius.circular(38.r)),
                          child: const SpinKitThreeBounce(
                            color: Colors.white,
                            size: 16,
                          ),
                        )
                      ]),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
