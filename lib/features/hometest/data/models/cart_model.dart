import 'package:dro_hometest/features/hometest/domain/entities/cart.dart';

class CartModel {
  final String cartId;
  final int itemId;
  final int quantity;

  const CartModel(
      {required this.cartId, required this.itemId, required this.quantity});

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
      cartId: json['cart_id'],
      itemId: json['item_id'],
      quantity: json['quantity']);

  Map<String, dynamic> toJson() => {
        'cart_id': cartId,
        'item_id': itemId,
        'quantity': quantity,
      };

  Cart toEntity() => Cart(cartId: cartId, itemId: itemId, quantity: quantity);

  List<Object> get props => [
        itemId,
        cartId,
        quantity,
      ];
}
