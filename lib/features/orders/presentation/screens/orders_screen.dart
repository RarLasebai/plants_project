import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plants_project/core/utils/widgets/txt_style.dart';
import 'package:plants_project/features/orders/presentation/screens/order_details_screen.dart';
import 'package:plants_project/features/orders/presentation/widgets/order_widget.dart';
import 'package:plants_project/features/orders/presentation/widgets/success_dialog.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TxtStyle("Orders", 32, fontWeight: FontWeight.bold),
          SizedBox(height: 70.h),
          GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const OrderDetailsScreen()));
              },
              child: const OrderWidget()),
          GestureDetector(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) => const SuccessDialog());
              },
              child: const OrderWidget())
        ],
      ),
    ));
  }
}
