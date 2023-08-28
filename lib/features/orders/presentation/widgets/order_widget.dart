import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plants_project/core/utils/colors/colors.dart';
import 'package:plants_project/core/utils/widgets/txt_style.dart';
import 'package:plants_project/features/orders/data/models/order_model.dart';

import 'status_widget.dart';

class OrderWidget extends StatelessWidget {
  final OrderModel orderModel;
  const OrderWidget({super.key, required this.orderModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Container(
        padding:
            const EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24.r), color: softBlue),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TxtStyle(orderModel.orderNo, 20, fontWeight: FontWeight.bold),
              StatusWidget(
                text: orderModel.orderStatus,
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(top: 11, bottom: 13, right: 50, left: 50),
            child: Divider(
              color: Colors.white,
            ),
          ),
          TxtStyle(
              "${orderModel.items.length} Items - ${orderModel.orderTotalCost}",
              16,
              fontWeight: FontWeight.bold,
              color: secondaryFont)
        ]),
      ),
    );
  }
}
