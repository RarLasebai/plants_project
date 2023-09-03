import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plants_project/core/utils/colors/colors.dart';
import 'package:plants_project/core/utils/functions/utils_functios.dart';
import 'package:plants_project/core/utils/widgets/txt_style.dart';

class LogoutWidget extends StatelessWidget {
  const LogoutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(34.r)),
      child: ListTile(
        onTap: () {
          signOut(context);
        },
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(24.r)),
        leading: const Icon(Icons.logout, color: Colors.blue),
        title: const TxtStyle(
          "LOGOUT",
          18,
          color: Colors.blue,
          fontWeight: FontWeight.bold,
        ),
        tileColor: softBlue,
      ),
    );
  }
}
