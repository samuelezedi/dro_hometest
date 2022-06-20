part of 'home_test_bloc.dart';

abstract class HomeTestEvent extends Equatable {
  const HomeTestEvent();

  @override
  List<Object> get props => [];
}

class GetCartItems extends HomeTestEvent {
  const GetCartItems();
}

class AddCartItem extends HomeTestEvent {
  final Cart cart;
  const AddCartItem(this.cart);
}

class DeleteCartItem extends HomeTestEvent {
  final Cart cart;
  const DeleteCartItem(this.cart);
}

class ChangeQuantity extends HomeTestEvent {
  final String name;
  final int qt;
  const ChangeQuantity(this.name, this.qt);
}
