class Cart {
  final int itemId;
  final String cartId;
  final int quantity;

  const Cart(
      {required this.itemId, required this.cartId, required this.quantity});

  List<Object> get props => [
        itemId,
        cartId,
        quantity,
      ];
}
