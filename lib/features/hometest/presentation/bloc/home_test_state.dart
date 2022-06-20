part of 'home_test_bloc.dart';

abstract class HomeTestState extends Equatable {
  const HomeTestState();

  @override
  List<Object> get props => [];
}

class HomeTestInitial extends HomeTestState {}

class CartLoading extends HomeTestState {}

class CartItemsLoaded extends HomeTestState {
  final List<String> cart;
  const CartItemsLoaded({
    required this.cart,
  });

  @override
  List<Object> get props => [cart];
}

class CartItemsLoadFail extends HomeTestState {
  final String message;
  const CartItemsLoadFail({
    required this.message,
  });

  @override
  List<Object> get props => [message];
}

class AddingCartItem extends HomeTestState {}

class DeletingCartItem extends HomeTestState {}

class AddedCartItem extends HomeTestState {
  final List<String> cart;
  const AddedCartItem({
    required this.cart,
  });

  @override
  List<Object> get props => [cart];
}

class AddingFail extends HomeTestState {
  final String message;
  const AddingFail({required this.message});

  @override
  List<Object> get props => [message];
}

class DeletedCartItem extends HomeTestState {
  final List<String> cart;
  const DeletedCartItem({
    required this.cart,
  });

  @override
  List<Object> get props => [cart];
}

class DeleteFail extends HomeTestState {
  final String message;
  const DeleteFail({required this.message});

  @override
  List<Object> get props => [message];
}

class ChangingQuantity extends HomeTestState {}

class QuantityChanged extends HomeTestState {
  final List<String> cart;
  const QuantityChanged({
    required this.cart,
  });

  @override
  List<Object> get props => [cart];
}

class QuantityChangedFail extends HomeTestState {
  final String message;
  const QuantityChangedFail({required this.message});

  @override
  List<Object> get props => [message];
}
