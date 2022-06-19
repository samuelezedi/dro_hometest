import 'package:dro_hometest/features/hometest/data/models/cart_model.dart';
import 'package:dro_hometest/features/hometest/domain/entities/cart.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartCubit extends Cubit<List<Cart>?> {
  CartCubit() : super(null);

  void setData(List<Cart> cart) {
    emit(cart);
  }
}
