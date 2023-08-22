import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plants_project/core/utils/widgets/txt_style.dart';
import 'package:plants_project/features/favorite/presentation/widgets/favorite_widget.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TxtStyle("Favorite", 32, fontWeight: FontWeight.bold),
          SizedBox(height: 70.h),
          const FavoriteWidget(),
          const FavoriteWidget()
        ],
      ),
    ));
  }
}
