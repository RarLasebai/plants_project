import 'package:flutter/material.dart';
import 'package:plants_project/features/orders/presentation/widgets/background_shape_widget.dart';
import 'package:plants_project/features/orders/presentation/widgets/orders_main_bar.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            OrdersMainBar(isCart: true),
            BackGroundShapeWidget(isMakeOrder: true),
          ],
        ),
      )),
    );
  }
}
