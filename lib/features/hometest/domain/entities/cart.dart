class Cart {
  int itemId;
  String cartId;
  int quantity;

  Cart({required this.itemId, required this.cartId, required this.quantity});

  List<Object> get props => [
        itemId,
        cartId,
        quantity,
      ];
}
