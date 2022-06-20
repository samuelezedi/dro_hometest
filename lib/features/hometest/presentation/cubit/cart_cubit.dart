import 'package:flutter_bloc/flutter_bloc.dart';

class CartCubit extends Cubit<List<String>?> {
  CartCubit() : super(null);

  void setData(List<String> cart) {
    emit(cart);
  }
}
