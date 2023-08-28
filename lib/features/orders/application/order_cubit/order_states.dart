
import 'package:plants_project/features/orders/data/models/order_model.dart';

abstract class OrderStates {}

class OrderInitialState extends OrderStates {}

class OrderLoadingState extends OrderStates {}

class OrdersLoadedState extends OrderStates {
  final List<OrderModel> ordersModel;
  OrdersLoadedState(this.ordersModel);
}
class PlaceOrderSuccessState extends OrderStates{

}
class OrderStatusChangeState extends OrderStates {}

class OrderErrorState implements OrderStates {
  final String message;
  OrderErrorState(this.message);
}
