import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plants_project/core/utils/widgets/txt_style.dart';
import 'package:plants_project/features/favorite/application/favorite_bloc/favorite_cubit.dart';
import 'package:plants_project/features/favorite/application/favorite_bloc/favorite_states.dart';
import 'package:plants_project/features/favorite/presentation/widgets/favorite_widget.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavoriteCubit()..getPlants(),
      child: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(24),
        child: BlocConsumer<FavoriteCubit, FavoriteStates>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state is FavoritePlantsLoadedState) {
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const TxtStyle("Favorite", 32,
                          fontWeight: FontWeight.bold),
                      SizedBox(height: 70.h),
                      ...state.plants
                          .map((plant) => FavoriteWidget(plant: plant))
                          .toList()
                    ],
                  ),
                );
              } else {
                return Column(
                  children: [
                    const TxtStyle("Favorite", 32, fontWeight: FontWeight.bold),
                    SizedBox(height: 70.h),
                    const TxtStyle("Nothing To Show", 14),
                  ],
                );
              }
            }),
      )),
    );
  }
}
