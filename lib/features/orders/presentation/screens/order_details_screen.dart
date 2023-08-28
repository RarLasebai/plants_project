import 'package:flutter/material.dart';
import 'package:plants_project/core/utils/widgets/txt_style.dart';
import 'package:plants_project/features/orders/data/models/order_model.dart';
import 'package:plants_project/features/orders/presentation/widgets/item_widget.dart';
import 'package:plants_project/features/orders/presentation/widgets/orders_main_bar.dart';

class OrderDetailsScreen extends StatelessWidget {
  final OrderModel orderModel;
  const OrderDetailsScreen({super.key, required this.orderModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            OrdersMainBar(
              isOrderDetails: true,
              orderStatus: orderModel.orderStatus,
            ),
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          end: Alignment.topCenter,
                          begin: Alignment.bottomCenter,
                          colors: [
                        Color(0xffA5CBFF),
                        Color(0xffDCEBFE),
                        Colors.white,
                      ])),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 70.0, left: 24, right: 24, bottom: 43),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: orderModel.items.length,
                              itemBuilder: (context, index) {
                                return ItemWidget(
                                    cartItem: orderModel.items[index]);
                              }),
                          Stack(
                            children: [
                              Image.asset("assets/images/g1.png"),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 25, bottom: 8, left: 16, right: 16),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const TxtStyle("Delivery Amount", 16,
                                            fontWeight: FontWeight.bold),
                                        TxtStyle(orderModel.deliveryCost, 18,
                                            fontWeight: FontWeight.bold)
                                      ],
                                    ),
                                    const Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 8.0),
                                      child: Divider(color: Colors.white),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const TxtStyle("Total Amount", 18,
                                            fontWeight: FontWeight.bold),
                                        TxtStyle(orderModel.orderTotalCost, 20,
                                            fontWeight: FontWeight.bold)
                                      ],
                                    ),
                                    const Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 8.0),
                                      child: Divider(color: Colors.white),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const TxtStyle("Location", 16,
                                            fontWeight: FontWeight.bold),
                                        TxtStyle(orderModel.location, 16,
                                            fontWeight: FontWeight.bold)
                                      ],
                                    ),
                                    const Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 8.0),
                                      child: Divider(color: Colors.white),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const TxtStyle("Phone", 16,
                                            fontWeight: FontWeight.bold),
                                        TxtStyle(orderModel.phone, 16,
                                            fontWeight: FontWeight.bold)
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const Positioned(
                  right: 175,
                  left: 175,
                  child: Divider(
                    color: Colors.black,
                    thickness: 4,
                  ),
                ),
                const Positioned(
                    left: 25,
                    top: 31,
                    child: TxtStyle("Order Details", 24,
                        fontWeight: FontWeight.bold)),
              ],
            ),
          ],
        ),
      )),
    );
  }
}
