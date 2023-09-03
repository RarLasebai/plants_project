import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plants_project/core/utils/colors/colors.dart';
import 'package:plants_project/core/utils/widgets/loading_widget.dart';
import 'package:plants_project/core/utils/widgets/txt_style.dart';
import 'package:plants_project/features/profile/application/profile_cubit/profile_cubit.dart';
import 'package:plants_project/features/profile/application/profile_cubit/profile_states.dart';

import '../widgets/logout_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit()..getUser(),
      child: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TxtStyle("Profile", 32, fontWeight: FontWeight.bold),
            BlocConsumer<ProfileCubit, ProfileStates>(
                listener: (context, state) {},
                builder: (context, state) {
                  if (state is ProfileLoadingState) {
                    return const LoadingWidget();
                  } else if (state is ProfileLoadedState) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 70.h),
                        TxtStyle(state.userModel.userName, 20,
                            fontWeight: FontWeight.bold),
                        TxtStyle(state.userModel.userEmail!, 20,
                            fontWeight: FontWeight.bold),
                        SizedBox(height: 20.h),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(34.r)),
                          child: ListTile(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24.r)),
                            leading: const Icon(Icons.control_point_rounded,
                                color: Colors.blue),
                            title: TxtStyle(
                              "Points: ${state.userModel.userPoints}",
                              18,
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                            tileColor: softBlue,
                          ),
                        ),
                        const LogoutWidget()
                      ],
                    );
                  } else {
                    return const LogoutWidget();
                  }
                }),
          ],
        ),
      )),
    );
  }
}
