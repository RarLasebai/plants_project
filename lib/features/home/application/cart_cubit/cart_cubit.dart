import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plants_project/features/home/application/cart_cubit/cart_states.dart';
import 'package:plants_project/features/home/data/model/cart_model.dart';

class CartCubit extends Cubit<CartStates> {
  CartCubit() : super(CartInitialState());

  static CartCubit get(context) => BlocProvider.of(context);

  //var
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final List<CartItemModel> cartItems = [];
  int total = 0;
  //methods
  Future getCartItems({required String userId}) async {
    emit(CartLoadingState());
    try {
      QuerySnapshot query = await firestore
          .collection("cartItems")
          .where("userId", isEqualTo: userId)
          .get();

      if (query.docs.isNotEmpty) {
        query.docs.map<List<CartItemModel>>((e) {
          final data = e.data() as Map<String, dynamic>;

          final CartItemModel cartItemModel = CartItemModel.fromMap(data);
          cartItems.add(cartItemModel);
          return cartItems;
        }).toList();
        emit(CartItemsLoadedState(cartItems: cartItems));
        
      } else {
        emit(CartEmptyState());
      }
    } catch (e) {
      emit(CartErrorState(e.toString()));
    }
  }
}
