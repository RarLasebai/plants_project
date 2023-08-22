import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plants_project/core/utils/colors/colors.dart';
import 'package:plants_project/core/utils/widgets/txt_style.dart';
import 'package:plants_project/features/home/presentation/widgets/add_to_cart_widget.dart';
import 'package:plants_project/features/home/presentation/widgets/home_header_widget.dart';

class PlantDetailsScreen extends StatelessWidget {
  const PlantDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
            padding: const EdgeInsets.only(top: 24.0, bottom: 24),
            child: SingleChildScrollView(
                child: Column(children: [
              //HEADER
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: HomeHeaderWidget(
                    normalText: "The Potted\n", boldText: "Head"),
              ),

              //plant
              Stack(
                children: [
                  Positioned(
                    top: 220,
                    left: 45,
                    right: 45,
                    child: CircleAvatar(
                      radius: 90.r,
                      backgroundColor: Colors.white,
                      child: Image.asset(
                        "assets/images/linearColor.png",
                      ),
                    ),
                  ),
                  Image.asset(
                    "assets/images/plantt.png",
                  ),
                ],
              ),

              Padding(
                padding: const EdgeInsets.only(top: 40, bottom: 50),
                child: SizedBox(
                    width: 253.w,
                    child: const TxtStyle(
                      "Perfect for beginners or anyone looking for an easy-to-care-for plant",
                      14,
                      color: darkGrey,
                      longText: true,
                      isDescribtion: true,
                      textAlignm: TextAlign.center,
                    )),
              ),

              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset("assets/images/min.png"),
                  const Spacer(),
                  const TxtStyle("04", 50, fontWeight: FontWeight.bold),
                  const Spacer(),
                  Image.asset("assets/images/plus.png"),
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: AddToCartWidget(isDetailScreen: true),
              )
            ]))),
      ),
    );
  }
}
