import 'package:flutter/material.dart';
import 'package:plants_project/core/utils/widgets/txt_style.dart';
import 'package:plants_project/features/orders/presentation/widgets/status_widget.dart';

class OrdersMainBar extends StatelessWidget {
  final bool isCart, isOrderDetails;
  final int? numberOfItems;
  final String? orderStatus;
  const OrdersMainBar(
      {super.key,
      this.isCart = false,
      this.isOrderDetails = false,
      this.orderStatus,
      this.numberOfItems});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TxtStyle(isCart ? "Cart" : "Order", 32, fontWeight: FontWeight.bold),
          StatusWidget(
            isOrdersScreen: false,
            text: isCart ? "$numberOfItems" : isOrderDetails ? orderStatus! : "Placing Order",
          )
        ],
      ),
    );
  }
}
