import 'package:flutter/material.dart';
import 'package:plants_project/features/orders/presentation/widgets/background_shape_widget.dart';
import 'package:plants_project/features/orders/presentation/widgets/orders_main_bar.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            OrdersMainBar(),
            BackGroundShapeWidget(),
          ],
        ),
      )),
    );
  }
}
