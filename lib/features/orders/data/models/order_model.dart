import 'package:plants_project/features/home/data/model/cart_model.dart';

class OrderModel {
  final String orderId;
  final String orderNo;
  final String userId;
  final String orderTotalCost;
  final String deliveryCost;
  final String date;
  final String location;
  final String phone;
  final List<CartItemModel> items;
  final String orderStatus;
  const OrderModel(
    
      {
        required this.orderId,
        required this.date,
      required this.userId,
      required this.deliveryCost,
      required this.items,
      required this.location,
      required this.orderNo,
      required this.orderStatus,
      required this.orderTotalCost,
      required this.phone});

  //from map
  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return OrderModel(
      orderId:  map["orderId"] ?? "",
      date: map["date"] ?? "",
      userId: map["userId"] ?? "",
      deliveryCost: map["deliveryCost"] ?? "",
      items: map['items']
              .map<CartItemModel>(
                  (mapString) => CartItemModel.fromMap(mapString))
              .toList() ??
          "",
      // List.from(map['items'])
      location: map["location"] ?? "",
      orderNo: map["orderNo"] ?? "",
      orderStatus: map["orderStatus"] ?? "",
      orderTotalCost: map["orderTotalCost"] ?? "",
      phone: map["phone"] ?? "",
    );
  }

  //to map
  Map<String, dynamic> toMap() {
    return {
      "orderId" : orderId,
      "date": date,
      "userId": userId,
      "deliveryCost": deliveryCost,
      "items": items.map((i) => i.toMap()).toList(),
      "location": location,
      "orderNo": orderNo,
      "orderStatus": orderStatus,
      "orderTotalCost": orderTotalCost,
      "phone": phone,
    };
  }
}
