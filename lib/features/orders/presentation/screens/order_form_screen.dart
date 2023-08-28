import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plants_project/core/utils/colors/colors.dart';
import 'package:plants_project/core/utils/widgets/txt_style.dart';
import 'package:plants_project/features/home/data/model/cart_model.dart';
import 'package:plants_project/features/orders/application/order_cubit/order_cubit.dart';
import 'package:plants_project/features/orders/application/order_cubit/order_states.dart';
import 'package:plants_project/features/orders/presentation/screens/place_order_screen.dart';
import 'package:plants_project/features/orders/presentation/widgets/order_text_field.dart';
import 'package:plants_project/features/orders/presentation/widgets/orders_main_bar.dart';

class OrderFormScreen extends StatelessWidget {
  final List<CartItemModel> cartItems;

  const OrderFormScreen({super.key, required this.cartItems});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => OrderCubit(),
        child: SafeArea(
          child: Column(
            children: [
              const OrdersMainBar(isCart: false),
              Padding(
                padding: const EdgeInsets.all(24),
                child: BlocBuilder<OrderCubit, OrderStates>(
                    builder: (context, state) {
                  OrderCubit orderCubit = OrderCubit.get(context);
                  orderCubit.cartItems = cartItems;

                  for (var item in cartItems) {
                    orderCubit.total = orderCubit.total + item.total;
                  }
                  return Form(
                    key: orderCubit.orderFormKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const TxtStyle("Please Fill The Form:", 20,
                            fontWeight: FontWeight.bold),
                        SizedBox(height: 5.h),
                        OrderTextField(
                            controller: orderCubit.locationController,
                            hint: "Location"),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: OrderTextField(
                              controller: orderCubit.phoneController,
                              hint: "Phone",
                              isPhone: true),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: GestureDetector(
                            onTap: () {
                              if (orderCubit.orderFormKey.currentState!
                                  .validate()) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            BlocProvider.value(
                                                value: orderCubit,
                                                child: PlaceOrderScreen(
                                                    orderCubit: orderCubit,
                                                    items: cartItems))),
                                  );
                              }
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 13, horizontal: 16),
                              decoration: BoxDecoration(
                                  color: primaryDark,
                                  borderRadius: BorderRadius.circular(42.r),
                                  border: Border.all(color: Colors.yellow)),
                              child: const TxtStyle("Continue", 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
