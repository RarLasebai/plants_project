import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plants_project/core/utils/widgets/txt_style.dart';
import 'package:plants_project/features/home/presentation/screens/plant_details_screen.dart';
import 'package:plants_project/features/home/presentation/widgets/home_header_widget.dart';
import 'package:plants_project/features/home/presentation/widgets/plant_type_widget.dart';
import 'package:plants_project/features/home/presentation/widgets/plant_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.all(24.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            //HEADER
            const HomeHeaderWidget(
                normalText: "Let’s Make our \nLives", boldText: " Greener!"),

            //PLANTS TYPE
            Padding(
              padding: const EdgeInsets.only(top: 53, bottom: 32),
              child: SingleChildScrollView(
                physics: const ScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 56.h,
                      child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: 15,
                          itemBuilder: (context, index) {
                            return const PlanTypeWidget(
                                isSelected: false, title: "typeuuuuu");
                          }),
                    ),
                  ],
                ),
              ),
            ),
            //HEADER 2:
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const TxtStyle("Plant Collection", 24),
                IconButton(
                  icon: const Icon(Icons.arrow_forward),
                  onPressed: () {},
                )
              ],
            ),
            //plant widget
            SingleChildScrollView(
              physics: const ScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const PlantDetailsScreen())),
                      child: const PlantWidget()),
                  const PlantWidget(),
                  const PlantWidget(),
                  const PlantWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
