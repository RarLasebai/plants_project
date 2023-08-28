import 'package:plants_project/features/home/data/model/cart_model.dart';

abstract class CartStates {}

class CartInitialState extends CartStates {}

class CartLoadingState extends CartStates {}

class CartItemsLoadedState extends CartStates {
  final List<CartItemModel> cartItems;
   CartItemsLoadedState({required this.cartItems});
}

class CartEmptyState extends CartStates{}

class CartErrorState implements CartStates {
  final String message;
  CartErrorState(this.message);
}
