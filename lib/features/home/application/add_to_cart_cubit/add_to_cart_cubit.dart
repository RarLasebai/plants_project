import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plants_project/features/home/application/add_to_cart_cubit/add_to_cart_states.dart';
import 'package:plants_project/features/home/data/model/cart_model.dart';
import 'package:plants_project/features/home/data/model/plant_model.dart';

class AddToCartCubit extends Cubit<AddToCartStates> {
  AddToCartCubit() : super(AddToCartInitialState());

  static AddToCartCubit get(context) => BlocProvider.of(context);

  //vars
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  int quantity = 1;

  //methods
  plus() {
    emit(AddToCartLoadingState());
    quantity++;
    emit(PlusState(quantity));
  }

  minus() {
    if (quantity > 1) {
      emit(AddToCartLoadingState());

      quantity--;
      emit(MinusState(quantity));
    }
  }

  addToCart({required PlantModel plant, required String userId}) {
    emit(AddToCartLoadingState());
    int price = plant.plantPrice;
    int total = calc(price);
    try {
      CartItemModel cartItemModel = CartItemModel(
          plantId: plant.plantId,
          price: plant.plantPrice,
          quantity: quantity,
          userId: userId,
          total: total,
          plantImage: plant.plantImage,
          plantName: plant.plantName,
          points: plant.points);
      firestore
          .collection("cartItems")
          .doc()
          .set(cartItemModel.toMap())
          .then((value) {
        emit(AddToCartSuccessState());
      }).catchError((error) {
        emit(AddToCartErrorState("Sorry, Something went wrong!"));
      });
    } catch (e) {
      emit(AddToCartErrorState(e.toString()));
    }
  }

  calc(int price) {
    int total = price;
    int j = quantity;
    while (j > 1) {
      total = total + price;
      j--;
    }
    return total;
  }
}
