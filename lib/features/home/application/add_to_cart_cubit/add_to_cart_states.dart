abstract class AddToCartStates {}

class AddToCartInitialState extends AddToCartStates {}

class AddToCartLoadingState extends AddToCartStates {}

class AddToCartSuccessState extends AddToCartStates {}

class PlusState extends AddToCartStates {
  final int quantity;
  PlusState(this.quantity);
}

class MinusState extends AddToCartStates {
  final int quantity;
  MinusState(this.quantity);
}

class AddToCartErrorState implements AddToCartStates {
  final String message;
  AddToCartErrorState(this.message);
}
