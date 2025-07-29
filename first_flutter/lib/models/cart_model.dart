class CartItem {
  final String id;
  final String name;
  final double price;
  int quantity;

  CartItem({
    required this.id,
    required this.name,
    required this.price,
    this.quantity = 1,
  });
}

class Cart {
  final List<CartItem> items;

  Cart({this.items = const []});

  double get totalPrice =>
      items.fold(0, (total, item) => total + (item.price * item.quantity));

  int get totalItems => items.fold(0, (total, item) => total + item.quantity);
}
