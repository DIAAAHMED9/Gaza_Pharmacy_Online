import 'package:cloud_firestore/cloud_firestore.dart';

class OrderModel {
  final String id;
  final String userId;
  final List<OrderProduct> products;
  final double totalAmount;
  final String status; // 'completed' or 'canceled'
  final DateTime createdAt;
  final String? address;
  final String? paymentMethod;

  OrderModel({
    required this.id,
    required this.userId,
    required this.products,
    required this.totalAmount,
    required this.status,
    required this.createdAt,
    this.address,
    this.paymentMethod,
  }
 );

  factory OrderModel.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return OrderModel(
      id: doc.id,
      userId: data['userId'],
      products: (data['products'] as List)
          .map((p) => OrderProduct.fromMap(p))
          .toList(),
      totalAmount: data['totalAmount'].toDouble(),
      status: data['status'],
      createdAt: (data['createdAt'] as Timestamp).toDate(),
      address: data['address'],
      paymentMethod: data['paymentMethod'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'products': products.map((p) => p.toMap()).toList(),
      'totalAmount': totalAmount,
      'status': status,
      'createdAt': Timestamp.fromDate(createdAt),
      'address': address,
      'paymentMethod': paymentMethod,
    };
  }
}

class OrderProduct {
  final String productId;
  final String productName;
  final int quantity;
  final double price;

  OrderProduct({
    required this.productId,
    required this.productName,
    required this.quantity,
    required this.price,
  });

  factory OrderProduct.fromMap(Map<String, dynamic> map) {
    return OrderProduct(
      productId: map['productId'],
      productName: map['productName'],
      quantity: map['quantity'],
      price: map['price'].toDouble(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'productId': productId,
      'productName': productName,
      'quantity': quantity,
      'price': price,
    };
  }
}
