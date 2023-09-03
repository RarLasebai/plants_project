import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plants_project/core/utils/widgets/loading_widget.dart';
import 'package:plants_project/core/utils/widgets/txt_style.dart';
import 'package:plants_project/features/auth/application/auth_cubit/auth_cubit.dart';
import 'package:plants_project/features/auth/application/auth_cubit/auth_states.dart';
import 'package:plants_project/features/auth/data/model/user_model.dart';
import 'package:plants_project/features/orders/application/order_cubit/order_cubit.dart';
import 'package:plants_project/features/orders/application/order_cubit/order_states.dart';
import 'package:plants_project/features/orders/presentation/screens/order_details_screen.dart';
import 'package:plants_project/features/orders/presentation/widgets/order_widget.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthStates>(builder: (context, authState) {
      if (authState is AuthGetUser) {
        final UserModel user = authState.userModel;

        return BlocProvider(
          create: (context) => OrderCubit()..getOrders(user.userId),
          child: SafeArea(
              child: Padding(
            padding: const EdgeInsets.all(24),
            child: BlocConsumer<OrderCubit, OrderStates>(
                listener: (context, state) {},
                builder: (context, orderState) {
                  OrderCubit orderCubit = OrderCubit.get(context);
                  if (orderState is OrdersLoadedState) {
                    if (orderState.ordersModel.isEmpty) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("assets/images/empty-cart.png",
                                height: 150.h),
                            const TxtStyle("You Have No Orders!", 30),
                          ],
                        ),
                      );
                    } else {
                      return SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const TxtStyle("Orders", 32,
                                fontWeight: FontWeight.bold),
                            SizedBox(height: 70.h),
                            ...orderState.ordersModel
                                .map((order) => GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  BlocProvider.value(
                                                    value: orderCubit,
                                                    child: OrderDetailsScreen(
                                                        orderModel: order, orderCubit: orderCubit),
                                                  )));
                                    },
                                    child: OrderWidget(orderModel: order)))
                          ],
                        ),
                      );
                    }
                  } else if (orderState is OrderLoadingState) {
                    return const LoadingWidget();
                  } else {
                    return const Center(
                      child: TxtStyle("There is no orders yet", 30,
                          fontWeight: FontWeight.bold),
                    );
                  }
                }),
          )),
        );
      } else {
        return const Center(child: TxtStyle("Authintication Faild", 30));
      }
    });
  }
}
