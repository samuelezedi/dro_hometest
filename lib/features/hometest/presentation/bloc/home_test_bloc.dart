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

    if (event is DeleteCartItem) {
      yield* _mapRemoveCartItem(event);
    }

    if (event is ChangeQuantity) {
      yield* _mapChangeQuantity(event);
    }
  }

  Stream<HomeTestState> _mapGetCartItems(
    GetCartItems event,
  ) async* {
    try {
      yield CartLoading();

      final sp = await SharedPreferences.getInstance();
      final cartList = sp.getStringList('cart');

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
      yield CartItemsLoadFail(message: e.toString());
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
    } catch (e) {
      yield AddingFail(message: e.toString());
    }
  }

  Stream<HomeTestState> _mapRemoveCartItem(
    DeleteCartItem event,
  ) async* {
    try {
      yield DeletingCartItem();

      final sp = await SharedPreferences.getInstance();
      final cartList = sp.getStringList('cart');

      final data = "${event.cart.cartId}-${event.cart.itemId}";

      if (cartList != null) {
        if (cartList.contains(data)) {
          sp.remove(data);
          deleteCubit(event.cart);
          cartList.removeWhere((element) => data == element);
        }
      }
      yield DeletedCartItem(cart: [data]);
    } catch (e) {
      yield DeleteFail(message: e.toString());
    }
  }

  Stream<HomeTestState> _mapChangeQuantity(
    ChangeQuantity event,
  ) async* {
    try {
      yield ChangingQuantity();

      final sp = await SharedPreferences.getInstance();
      final cartList = sp.getStringList('cart');

      if (cartList != null) {
        if (cartList.contains(event.name)) {
          sp.setInt(event.name, event.qt);
        }
      }
      yield QuantityChanged(cart: cartList as List<String>);
    } catch (e) {
      yield QuantityChangedFail(message: e.toString());
    }
  }

  void updateCubit(Cart event) {
    String ca = "${event.cartId}-${event.itemId}";

    final data = getIt<CartCubit>().state;

    if (data != null) {
      data.add(ca);
      data.toSet().toList();
      getIt<CartCubit>().setData(data);
    } else {
      getIt<CartCubit>().setData([ca]);
    }
  }

  void deleteCubit(Cart event) {
    String ca = "${event.cartId}-${event.itemId}";

    final data = getIt<CartCubit>().state;

    if (data != null) {
      data.removeWhere((element) => element == ca);
      data.toSet().toList();
      getIt<CartCubit>().setData(data);
    }
  }
}
