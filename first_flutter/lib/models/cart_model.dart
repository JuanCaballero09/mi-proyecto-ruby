class CartItem {
  final String id;
  final String name;
  final double price;
  final int quantity;
  final String? image;
  final String? description;

  CartItem({
    required this.id,
    required this.name,
    required this.price,
    required this.quantity,
    this.image,
    this.description,
  });

  CartItem copyWith({
    String? id,
    String? name,
    int? price,
    int? quantity,
    String? image,
    String? description,
  }) {
    return CartItem(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price?.toDouble() ?? this.price,
      quantity: quantity ?? this.quantity,
      image: image ?? this.image,
      description: description ?? this.description,
    );
  }
}

class Cart {
  final List<CartItem> items;

  Cart({this.items = const []});

  int get totalPrice {
    return items.fold(0, (total, item) => total + (item.price * item.quantity).toInt());
  }

  Cart copyWith({List<CartItem>? items}) {
    return Cart(
      items: items ?? this.items,
    );
  }
}