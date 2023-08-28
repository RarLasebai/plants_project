import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plants_project/core/utils/colors/colors.dart';
import 'package:plants_project/core/utils/widgets/txt_style.dart';
import 'package:plants_project/features/home/data/model/plant_model.dart';
import 'package:plants_project/features/home/presentation/widgets/add_to_cart_widget.dart';

class PlantWidget extends StatelessWidget {
  final PlantModel plant;
  const PlantWidget({super.key, required this.plant});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Container(
        // width: 253.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(42.r),
            border: Border.all(color: primary)),
        padding:
            const EdgeInsets.only(top: 19, bottom: 34, left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //plant image
            Stack(
              children: [
                Container(
                    height: 243.h,
                    width: 285.w,
                    decoration: BoxDecoration(
                      color: softBlue,
                      borderRadius: BorderRadius.circular(23.r),
                    ),
                    child: Image.network(plant.plantImage)),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.favorite,
                      color: Colors.red,
                    ))
              ],
            ),
            SizedBox(height: 10.h),
            TxtStyle(
              plant.plantName,
              24,
              textAlignm: TextAlign.center,
              fontWeight: FontWeight.bold,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 18),
              child: SizedBox(
                  width: 253.w,
                  child: TxtStyle(
                    plant.plantDesc,
                    14,
                    color: darkGrey,
                    longText: true,
                    isDescribtion: true,
                    textAlignm: TextAlign.center,
                  )),
            ),

            //Cart

             AddToCartWidget(price: plant.plantPrice)
          ],
        ),
      ),
    );
  }
}
