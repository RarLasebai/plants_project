import 'package:flutter/material.dart';
import 'package:plants_project/core/utils/widgets/txt_style.dart';
import 'package:plants_project/features/orders/presentation/widgets/status_widget.dart';

class OrdersMainBar extends StatelessWidget {
  final bool isCart;
  const OrdersMainBar({super.key, this.isCart = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const TxtStyle("Order No.123", 32, fontWeight: FontWeight.bold),
          StatusWidget(
            isOrdersScreen: false,
            text: isCart ? "4" : "Status",
          )
        ],
      ),
    );
  }
}
