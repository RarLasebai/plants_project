import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plants_project/core/utils/functions/utils_functios.dart';
import 'package:plants_project/features/auth/data/model/user_model.dart';
import 'package:plants_project/features/home/data/model/cart_model.dart';
import 'package:plants_project/features/orders/application/order_cubit/order_states.dart';
import 'package:plants_project/features/orders/data/models/order_model.dart';

class OrderCubit extends Cubit<OrderStates> {
  OrderCubit() : super(OrderInitialState());

  static OrderCubit get(context) => BlocProvider.of(context);

  //var
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  TextEditingController locationController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  GlobalKey<FormState> orderFormKey = GlobalKey<FormState>();
  String status = "In Review";
  List<CartItemModel> cartItems = [];
  List<OrderModel> orderModels = [];
  int total = 0;

  //methods
  placeOrder() {
    emit(OrderLoadingState());
    DateTime today = DateTime.now();
    for (var element in cartItems) {
      element.toMap();
    }
    final orderDoc = firestore.collection('orders').doc();

    String date = "${today.day}-${today.month}-${today.year}";
    OrderModel orderModel = OrderModel(
        orderId: orderDoc.id,
        date: date,
        userId: cartItems.first.userId,
        deliveryCost: "0.04",
        items: cartItems,
        location: locationController.text,
        orderNo: "orderNo",
        orderStatus: status,
        orderTotalCost: "$total",
        phone: phoneController.text);
    try {
      firestore
          .collection("orders")
          .doc(orderDoc.id)
          .set(orderModel.toMap())
          .then((value) async {
        emit(PlaceOrderSuccessState());
        // firestore.collection("cartItems").where(field)
        QuerySnapshot query = await firestore
            .collection("cartItems")
            .where("userId", isEqualTo: cartItems.first.userId)
            .get();
        for (var element in query.docs) {
          element.reference.delete();
        }
      });
    } catch (e) {
      emit(OrderErrorState("Something went wrong when placing your order"));
    }
  }

  getOrders(String userId) async {
    emit(OrderLoadingState());
    try {
      QuerySnapshot query = await firestore
          .collection("orders")
          .where("userId", isEqualTo: userId)
          .get();

      if (query.docs.isNotEmpty) {
        query.docs.map<List<OrderModel>>((e) {
          final data = e.data() as Map<String, dynamic>;

          final OrderModel orderModel = OrderModel.fromMap(data);
          orderModels.add(orderModel);
          return orderModels;
        }).toList();
      }
      emit(OrdersLoadedState(orderModels));
    } catch (e) {
      emit(OrderErrorState(e.toString()));
    }
  }

  confirmOrder(OrderModel orderModel) async {
    UserModel user = await getDataFromSharedPref();
    int userPoints = int.parse(user.userPoints);
    emit(OrderLoadingState());
    await firestore.collection("orders").doc(orderModel.orderId).update({
      "orderStatus": "confirmed",
    });
    for (var item in orderModel.items) {
      userPoints = userPoints + item.points;
    }
    await firestore.collection("users").doc(orderModel.userId).update({
      "userPoints": userPoints.toString(),
    });
    user.userPoints = userPoints.toString();
    storeDataLocally(user);
    emit(OrderStateChanged());
  }
}
