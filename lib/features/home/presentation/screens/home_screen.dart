import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plants_project/core/utils/widgets/loading_widget.dart';
import 'package:plants_project/core/utils/widgets/txt_style.dart';
import 'package:plants_project/features/auth/application/auth_cubit/auth_cubit.dart';
import 'package:plants_project/features/auth/application/auth_cubit/auth_states.dart';
import 'package:plants_project/features/auth/data/model/user_model.dart';
import 'package:plants_project/features/home/application/home_cubit/home_cubit.dart';
import 'package:plants_project/features/home/application/home_cubit/home_states.dart';
import 'package:plants_project/features/home/presentation/screens/plant_details_screen.dart';
import 'package:plants_project/features/home/presentation/widgets/home_header_widget.dart';
import 'package:plants_project/features/home/presentation/widgets/plant_type_widget.dart';
import 'package:plants_project/features/home/presentation/widgets/plant_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> categories = ["Plants", "Flowers"];
    return BlocConsumer<AuthCubit, AuthStates>(
        listener: (context, authState) {},
        builder: (context, authState) {
          if (authState is AuthGetUser) {
            final UserModel user = authState.userModel;
            return BlocProvider(
              create: (context) => HomeCubit()..getPlants("Plants"),
              child: SafeArea(
                  child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: SingleChildScrollView(
                  child: BlocConsumer<HomeCubit, HomeStates>(
                      listener: (context, state) {},
                      builder: (context, homeState) {
                        HomeCubit homeCubit = HomeCubit.get(context);

                        return Column(
                          children: [
                            //HEADER
                            HomeHeaderWidget(
                                isMain: true,
                                text: "Let’s Make our \nLives",
                                boldText: " Greener!",
                                userModel: user),

                            //PLANTS TYPE
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 53, bottom: 32),
                              child: SingleChildScrollView(
                                physics: const ScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SizedBox(
                                      height: 56.h,
                                      child: ListView.builder(
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          shrinkWrap: true,
                                          scrollDirection: Axis.horizontal,
                                          itemCount: categories.length,
                                          itemBuilder: (context, index) {
                                            return GestureDetector(
                                              onTap: () {
                                                if (homeCubit.selectedIndex ==
                                                    index) {
                                                  homeCubit.selectedIndex =
                                                      null;
                                                } else {
                                                  homeCubit.selectedIndex =
                                                      index;
                                                }
                                                homeCubit
                                                    .plantTypeChanges(index);
                                                homeCubit
                                                    .plantTypeChanges(index);
                                                homeCubit.getPlants(
                                                    categories[index]);
                                              },
                                              child: PlanTypeWidget(
                                                  isSelected:
                                                      homeCubit.selectedIndex ==
                                                              index
                                                          ? true
                                                          : false,
                                                  title: categories[index]),
                                            );
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
                            BlocBuilder<HomeCubit, HomeStates>(
                                builder: (context, state) {
                              if (state is HomeLoadingState) {
                                return const LoadingWidget();
                              } else if (state is PlantsLoadedState) {
                                return SingleChildScrollView(
                                  physics: const ScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: [
                                      ...state.plantModel
                                          .map((plant) => GestureDetector(
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            PlantDetailsScreen(
                                                                plant: plant,
                                                                userId: user
                                                                    .userId)));
                                              },
                                              child: BlocProvider.value(
                                                value: homeCubit,
                                                child: PlantWidget(
                                                  plant: plant,
                                                  homeCubit: homeCubit,
                                                ),
                                              )))
                                          .toList(),
                                    ],
                                  ),
                                );
                              } else {
                                return const LoadingWidget();
                                //  const Center(
                                //   child: TxtStyle("There is no data yet", 30,
                                //       fontWeight: FontWeight.bold),
                                // );
                              }
                            }),
                          ],
                        );
                      }),
                ),
              )),
            );
          } else {
            return const Center(child: TxtStyle("Authintication Faild", 30));
          }
        });
  }
}
