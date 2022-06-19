import 'package:dro_hometest/features/hometest/domain/entities/cart.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'home_test_event.dart';
part 'home_test_state.dart';

class HomeTestBloc extends Bloc<HomeTestEvent, HomeTestState> {
  HomeTestBloc() : super(HomeTestInitial());

  @override
  Stream<HomeTestState> mapEventToState(
    HomeTestEvent event,
  ) async* {
    if (event is GetCartItems) {
      yield* _mapGetCartItems(event);
    }
  }

  Stream<HomeTestState> _mapGetCartItems(
    GetCartItems event,
  ) async* {
    try {
      if (state is HomeTestInitial) {
        yield CartLoading();

        final sp = await SharedPreferences.getInstance();
        final cartList = sp.getStringList('cart');

        if (cartList!.isNotEmpty) {
          yield CartItemsLoaded(cart: cartList);
        }
        yield const CartItemsLoadFail(message: 'Failed to states list');
      }

      // } on SocketException catch (e) {
      //   if (e.osError?.errorCode == 61) getIt<LoginBloc>().add(const LogOut());
    } catch (e) {
      yield const CartItemsLoadFail(message: 'Failed to states list');
    }
  }

  Stream<HomeTestState> _mapAddCartItem(
    AddCartItem event,
  ) async* {
    try {
      yield AddingCartItem();

      final sp = await SharedPreferences.getInstance();
      final cartList = sp.getStringList('cart');

      final data =
          "${event.cart.cartId}-${event.cart.itemId}-${event.cart.quantity}";

      cartList!.add(data);

      sp.setStringList('cart', cartList);

      yield AddedCartItem(cart: cartList);

      // } on SocketException catch (e) {
      //   if (e.osError?.errorCode == 61) getIt<LoginBloc>().add(const LogOut());
    } catch (e) {
      yield const CartItemsLoadFail(message: 'Failed to states list');
    }
  }
}
