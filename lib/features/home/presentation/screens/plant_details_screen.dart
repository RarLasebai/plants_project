import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plants_project/core/utils/colors/colors.dart';
import 'package:plants_project/core/utils/functions/utils_functios.dart';
import 'package:plants_project/core/utils/screens/home_layout.dart';
import 'package:plants_project/core/utils/widgets/loading_widget.dart';
import 'package:plants_project/core/utils/widgets/txt_style.dart';
import 'package:plants_project/features/home/application/add_to_cart_cubit/add_to_cart_cubit.dart';
import 'package:plants_project/features/home/application/add_to_cart_cubit/add_to_cart_states.dart';
import 'package:plants_project/features/home/data/model/plant_model.dart';
import 'package:plants_project/features/home/presentation/widgets/add_to_cart_widget.dart';
import 'package:plants_project/features/home/presentation/widgets/home_header_widget.dart';

class PlantDetailsScreen extends StatelessWidget {
  final String? userId;
  final PlantModel plant;
  const PlantDetailsScreen({super.key, required this.plant, this.userId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddToCartCubit(),
      child: SafeArea(
        child: Scaffold(
          body: Padding(
              padding: const EdgeInsets.only(top: 24.0, bottom: 24),
              child: SingleChildScrollView(
                  child: Column(children: [
                //HEADER
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: HomeHeaderWidget(text: plant.plantName),
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
                          height: 250.h,
                        ),
                      ),
                    ),
                    Image.network(
                      plant.plantImage,
                      height: 400.h,
                    ),
                  ],
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 40, bottom: 50),
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

                SizedBox(
                  height: 180.h,
                  child: BlocConsumer<AddToCartCubit, AddToCartStates>(
                      listener: (context, states) {
                    AddToCartCubit cubit = AddToCartCubit.get(context);

                    if (states is AddToCartSuccessState) {
                      showToast(context,
                          "${cubit.quantity} pieces added to your cart.",
                          color: Colors.green);
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomeLayout()),
                          (route) => false);
                    }
                  }, builder: (context, state) {
                    AddToCartCubit cubit = AddToCartCubit.get(context);
                    return Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                            onTap: () => cubit.minus(),
                            child: Image.asset("assets/images/min.png")),
                        const Spacer(),
                        ConditionalBuilder(
                            condition: state is! AddToCartLoadingState,
                            fallback: (context) => const LoadingWidget(),
                            builder: (context) {
                              return TxtStyle("${cubit.quantity}", 50,
                                  fontWeight: FontWeight.bold);
                            }),
                        const Spacer(),
                        GestureDetector(
                            onTap: () => cubit.plus(),
                            child: Image.asset("assets/images/plus.png")),
                      ],
                    );
                  }),
                ),
                BlocBuilder<AddToCartCubit, AddToCartStates>(
                    builder: (context, state) {
                  AddToCartCubit c = AddToCartCubit.get(context);
                  return GestureDetector(
                    onTap: () {
                      c.addToCart(plant: plant, userId: userId!);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: AddToCartWidget(
                          isDetailScreen: true, price: plant.plantPrice),
                    ),
                  );
                })
              ]))),
        ),
      ),
    );
  }
}
