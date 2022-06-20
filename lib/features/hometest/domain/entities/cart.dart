class Cart {
  String cartId;
  int itemId;
  int quantity;

  Cart({required this.cartId, required this.itemId, required this.quantity});

  List<Object> get props => [
        itemId,
        cartId,
        quantity,
      ];
}
