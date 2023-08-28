import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plants_project/core/utils/colors/colors.dart';
import 'package:plants_project/core/utils/widgets/loading_widget.dart';
import 'package:plants_project/core/utils/widgets/txt_style.dart';
import 'package:plants_project/features/auth/data/model/user_model.dart';
import 'package:plants_project/features/home/application/cart_cubit/cart_cubit.dart';
import 'package:plants_project/features/home/application/cart_cubit/cart_states.dart';
import 'package:plants_project/features/orders/application/order_cubit/order_cubit.dart';
import 'package:plants_project/features/orders/presentation/screens/order_form_screen.dart';
import 'package:plants_project/features/orders/presentation/widgets/item_widget.dart';
import 'package:plants_project/features/orders/presentation/widgets/orders_main_bar.dart';

class CartScreen extends StatelessWidget {
  final UserModel? user;
  const CartScreen({super.key, this.user});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CartCubit()..getCartItems(userId: user!.userId),
        ),
        BlocProvider(
          create: (context) => OrderCubit(),
        ),
      ],
      child: Scaffold(
        body: SafeArea(
            child: Center(
          child: SingleChildScrollView(
            child: BlocConsumer<CartCubit, CartStates>(
                listener: (context, states) {},
                builder: (context, state) {
                  CartCubit cartCubit = CartCubit.get(context);
                  if (state is CartEmptyState) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/images/empty-cart.png",
                            height: 150.h),
                        const TxtStyle("Your Cart is Empty!", 30),
                      ],
                    );
                  } else if (state is CartItemsLoadedState) {
                    for (var element in state.cartItems) {
                      cartCubit.total = cartCubit.total + element.total;
                    }
                    return Column(children: [
                      OrdersMainBar(
                          isCart: true, numberOfItems: state.cartItems.length),
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
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount: state.cartItems.length,
                                        itemBuilder: (context, index) {
                                          return ItemWidget(
                                              cartItem: state.cartItems[index]);
                                        }),
                                    //
                                    Stack(
                                      children: [
                                        Image.asset("assets/images/g1.png"),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 25,
                                              bottom: 8,
                                              left: 16,
                                              right: 16),
                                          child: Column(
                                            children: [
                                              const Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  TxtStyle(
                                                      "Delivery Amount", 16,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                  TxtStyle("0.04", 18,
                                                      fontWeight:
                                                          FontWeight.bold)
                                                ],
                                              ),
                                              const Padding(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 8.0),
                                                child: Divider(
                                                    color: Colors.white),
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  const TxtStyle(
                                                      "Total Amount", 18,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                  TxtStyle(
                                                      "${cartCubit.total}", 20,
                                                      fontWeight:
                                                          FontWeight.bold)
                                                ],
                                              ),
                                              const Padding(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 8.0),
                                                child: Divider(
                                                    color: Colors.white),
                                              ),
                                              GestureDetector(
                                                onTap: () => Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            OrderFormScreen(
                                                                cartItems: state
                                                                    .cartItems))),
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 21,
                                                          top: 16,
                                                          bottom: 22,
                                                          left: 12),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            42.r),
                                                    color: primarySoft,
                                                  ),
                                                  child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        const TxtStyle(
                                                            "Make Order", 18,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                        Container(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8),
                                                          decoration: BoxDecoration(
                                                              color:
                                                                  primaryDark,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          38.r)),
                                                          child: const Icon(
                                                              Icons
                                                                  .arrow_forward_ios,
                                                              color:
                                                                  Colors.white),
                                                        )
                                                      ]),
                                                ),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ))))
                      ])
                    ]);
                  } else {
                    return const LoadingWidget();
                  }
                }),
          ),
        )),
      ),
    );
  }
}
