import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plants_project/core/utils/colors/colors.dart';
import 'package:plants_project/core/utils/widgets/txt_style.dart';
import 'package:plants_project/features/home/data/model/plant_model.dart';

class FavoriteWidget extends StatelessWidget {
  final PlantModel plant;
  const FavoriteWidget({super.key, required this.plant});

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
                    child: Image.network(plant.plantImage,
                        height: 90.h, width: 90.w)),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TxtStyle(plant.plantName, 20, fontWeight: FontWeight.bold),
                    TxtStyle(plant.plantDesc, 14,
                        color: secondaryFont, longText: true)
                  ]),
            ),
            const Spacer(),
            TxtStyle("${plant.plantPrice}", 16, fontWeight: FontWeight.bold),
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
