import 'package:dro_hometest/di/injectable.dart';
import 'package:dro_hometest/features/hometest/data/models/cart_model.dart';
import 'package:dro_hometest/features/hometest/domain/entities/cart.dart';
import 'package:dro_hometest/features/hometest/presentation/cubit/cart_cubit.dart';
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

    if (event is AddCartItem) {
      yield* _mapAddCartItem(event);
    }
  }

  Stream<HomeTestState> _mapGetCartItems(
    GetCartItems event,
  ) async* {
    try {
      yield CartLoading();

      final sp = await SharedPreferences.getInstance();
      final cartList = sp.getStringList('cart');

      print(cartList == null);
      print('HERERE');

      if (cartList != null) {
        final li = <String>[];
        cartList.map((e) {
          li.add(e);
        }).toList();
        getIt<CartCubit>().setData(li);
        yield CartItemsLoaded(cart: cartList);
      }

      // } on SocketException catch (e) {
      //   if (e.osError?.errorCode == 61) getIt<LoginBloc>().add(const LogOut());
    } catch (e) {
      print(e.toString());
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

      final data = "${event.cart.cartId}-${event.cart.itemId}";

      print(cartList);

      if (cartList != null) {
        if (cartList.contains(data)) {
          final qt = sp.getInt(data);

          if (qt != null) {
            var result = qt + event.cart.quantity;
            sp.setInt(data, result);
          } else {
            sp.setInt(data, event.cart.quantity);
          }
          updateCubit(event.cart);
        } else {
          cartList.add(data);
          sp.setInt(data, event.cart.quantity);
          updateCubit(event.cart);
          sp.setStringList('cart', cartList);
          yield AddedCartItem(cart: cartList);
        }
      } else {
        updateCubit(event.cart);
        sp.setStringList('cart', [data]);
        sp.setInt(data, event.cart.quantity);
        yield AddedCartItem(cart: [data]);
      }

      // } on SocketException catch (e) {
      //   if (e.osError?.errorCode == 61) getIt<LoginBloc>().add(const LogOut());
    } catch (e) {
      yield const CartItemsLoadFail(message: 'Failed to states list');
    }
  }

  void updateCubit(Cart event) {
    String ca = "${event.cartId}-${event.itemId}";

    final data = getIt<CartCubit>().state;
    print('checking');
    print(data.toString());
    if (data != null) {
      // final d = data.firstWhere((element) => element.cartId == ca.cartId);
      // d.quantity = ca.quantity;
      // print(data.toString());
      // getIt<CartCubit>().setData(data);

      // //new
      data.add(ca);
      data.toSet().toList();
      getIt<CartCubit>().setData(data);
    } else {
      getIt<CartCubit>().setData([ca]);
    }
  }
}
