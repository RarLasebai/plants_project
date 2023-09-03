// ignore_for_file: use_build_context_synchronously

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plants_project/core/utils/functions/utils_functios.dart';
import 'package:plants_project/core/utils/screens/home_layout.dart';
import 'package:plants_project/core/utils/widgets/custom_button.dart';
import 'package:plants_project/core/utils/widgets/loading_widget.dart';
import 'package:plants_project/core/utils/widgets/txt_style.dart';
import 'package:plants_project/features/orders/application/order_cubit/order_cubit.dart';
import 'package:plants_project/features/orders/application/order_cubit/order_states.dart';
import 'package:plants_project/features/orders/data/models/order_model.dart';
import 'package:plants_project/features/orders/presentation/widgets/item_widget.dart';
import 'package:plants_project/features/orders/presentation/widgets/orders_main_bar.dart';

class OrderDetailsScreen extends StatelessWidget {
  final OrderCubit orderCubit;
  final OrderModel orderModel;
  const OrderDetailsScreen(
      {super.key, required this.orderModel, required this.orderCubit});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: BlocProvider.of<OrderCubit>(context),
      child: Scaffold(
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
                                          TxtStyle(
                                              orderModel.orderTotalCost, 20,
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
                            ),
                            BlocBuilder<OrderCubit, OrderStates>(
                                builder: (context, state) {
                              OrderCubit cubit = OrderCubit.get(context);
                              return ConditionalBuilder(
                                  condition: state is! OrderLoadingState,
                                  builder: (context) => CustomButton(
                                      text: "Confirm Order",
                                      onTap: () async {
                                        await cubit.confirmOrder(orderModel);
                                        showToast(context,
                                            "Congrats! You've got extra points!",
                                            color: Colors.green);
                                        Navigator.pushAndRemoveUntil(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const HomeLayout()),
                                            (route) => false);
                                      }),
                                  fallback: (context) => const LoadingWidget());
                            })
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
      ),
    );
  }
}
