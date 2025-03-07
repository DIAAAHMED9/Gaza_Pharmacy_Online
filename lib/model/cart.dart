class CartItem {
  final String productId;
  int quantity;
  // final DateTime addedAt;

  CartItem({
    required this.productId,
    this.quantity = 1,
    // required this.addedAt,
  });

  Map<String, dynamic> toJson() => {
    'quantity': quantity,
    // 'addedAt': addedAt.toIso8601String(),
  };

  factory CartItem.fromJson(String docId,Map<String, dynamic> json) => CartItem(
    productId:   json['productId'],
    quantity: json['quantity'],
    // addedAt: DateTime.parse(json['addedAt'].toString()),
  );
}