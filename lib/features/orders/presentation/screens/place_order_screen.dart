import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plants_project/core/utils/colors/colors.dart';
import 'package:plants_project/core/utils/functions/utils_functios.dart';
import 'package:plants_project/core/utils/screens/home_layout.dart';
import 'package:plants_project/core/utils/widgets/loading_widget.dart';
import 'package:plants_project/core/utils/widgets/txt_style.dart';
import 'package:plants_project/features/home/data/model/cart_model.dart';
import 'package:plants_project/features/orders/application/order_cubit/order_cubit.dart';
import 'package:plants_project/features/orders/application/order_cubit/order_states.dart';
import 'package:plants_project/features/orders/presentation/widgets/item_widget.dart';
import 'package:plants_project/features/orders/presentation/widgets/orders_main_bar.dart';

class PlaceOrderScreen extends StatelessWidget {
  final OrderCubit orderCubit;
  // ignore: non_constant_identifier_names
  final List<CartItemModel> items;
  const PlaceOrderScreen(
      {super.key, required this.orderCubit, required this.items});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
        value: BlocProvider.of<OrderCubit>(context),
        child: Scaffold(
            body: SafeArea(
                child: SingleChildScrollView(
                    child: Column(children: [
          const OrdersMainBar(isCart: false),
          Stack(children: [
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
                            itemCount: items.length,
                            itemBuilder: (context, index) {
                              return ItemWidget(cartItem: items[index]);
                            }),
                        Stack(
                          children: [
                            Image.asset("assets/images/g2.png"),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 45, bottom: 8, left: 16, right: 16),
                              child: Column(
                                children: [
                                  const Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      TxtStyle("Delivery Amount", 18,
                                          fontWeight: FontWeight.bold),
                                      TxtStyle("20.20", 18,
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
                                      TxtStyle("${orderCubit.total}", 18,
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
                                      const TxtStyle("Location", 18,
                                          fontWeight: FontWeight.bold),
                                      TxtStyle(
                                          orderCubit.locationController.text,
                                          18,
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
                                      const TxtStyle("Phone", 18,
                                          fontWeight: FontWeight.bold),
                                      TxtStyle(
                                          orderCubit.phoneController.text, 18,
                                          fontWeight: FontWeight.bold)
                                    ],
                                  ),
                                  SizedBox(height: 15.h),
                                  BlocConsumer<OrderCubit, OrderStates>(
                                      listener: (context, state) {
                                    if (state is PlaceOrderSuccessState) {
                                      showToast(context,
                                          "Your Order Placed Successfully! :)",
                                          color: Colors.green);
                                      Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const HomeLayout()),
                                          (route) => false);
                                    }
                                  }, builder: (context, state) {
                                    OrderCubit cubit = OrderCubit.get(context);
                                    return ConditionalBuilder(
                                        fallback: (context) =>
                                            const LoadingWidget(
                                                color: Colors.white),
                                        condition: state is! OrderLoadingState,
                                        builder: (context) {
                                          return GestureDetector(
                                            onTap: () {
                                              cubit.placeOrder();
                                            },
                                            child: Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 13,
                                                      horizontal: 16),
                                              decoration: BoxDecoration(
                                                  color: primaryDark,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          42.r),
                                                  border: Border.all(
                                                      color: Colors.yellow)),
                                              child: const TxtStyle(
                                                  "BUY NOW", 14,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                            ),
                                          );
                                        });
                                  })
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  )),
            ),
          ])
        ])))));
  }
}
