import 'package:dro_hometest/features/hometest/domain/entities/cart.dart';

class CartModel {
  final int itemId;
  final String cartId;
  final int quantity;

  const CartModel(
      {required this.itemId, required this.cartId, required this.quantity});

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
      itemId: json['item_id'],
      cartId: json['cart_id'],
      quantity: json['quantity']);

  Map<String, dynamic> toJson() =>
      {'quantity': quantity, 'cart_id': cartId, 'item_id': itemId};

  Cart toEntity() => Cart(itemId: itemId, cartId: cartId, quantity: quantity);

  List<Object> get props => [
        itemId,
        cartId,
        quantity,
      ];
}
