import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gaza_pharmacy/model/cart.dart';
import 'package:get/get.dart';

import '../model/product.dart';

class CartController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  double total = 0.0; // جعلها تفاعلية باستخدام Rx

 void calculateTotal(List<Map<String, dynamic>> cartProducts) {
    double newTotal = 0.0;
    for (var item in cartProducts) {
      final product = item['product'] as ProductModel;
      final cartItem = item['cartItem'] as CartItem;
      newTotal += product.price * cartItem.quantity;
      update();
      print('product.price ${product.price} cartItem.quantity ${cartItem.quantity} newTotal $newTotal');
    }
    total = newTotal;
    update();
  }

  // Add to cart with quantity management
  Future<void> addToCart(String productId) async {
    try {
      final cartRef = _firestore.collection('cart').doc(productId);
      
      await _firestore.runTransaction((transaction) async {
        final doc = await transaction.get(cartRef);
        
        if (doc.exists) {
          final currentQuantity = doc.data()?['quantity'] ?? 0;
          transaction.update(cartRef, {'quantity': currentQuantity + 1});
        } else {
          transaction.set(cartRef, {
            'productId': productId,
            'quantity': 1,
            'addedAt': FieldValue.serverTimestamp(),
          });
        }
      });
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  // Update cart quantity
  Future<void> updateCartQuantity(String productId, int newQuantity) async {
    try {
      if (newQuantity <= 0) {
        await removeFromCart(productId);
      } else {
        await _firestore.collection('cart').doc(productId).update({
          'quantity': newQuantity,
        });
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  // Remove from cart
  Future<void> removeFromCart(String productId) async {
    try {
      await _firestore.collection('cart').doc(productId).delete();
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  // Get cart items stream
  Stream<List<CartItem>> getCartItems() {
    return _firestore.collection('cart').snapshots().map((snapshot) =>
        snapshot.docs
            .map((doc) => CartItem.fromJson(doc.id,doc.data()))
            .toList());
  }

  // Get cart items with product details
  Stream<List<Map<String, dynamic>>> getCartProducts() {
    print('test 1');
    return _firestore.collection('cart').snapshots().asyncMap((snapshot) async {
      print('test 2 ${snapshot.docs.first.data()}');
      List<Map<String, dynamic>> cartProducts = [];
      for (var doc in snapshot.docs) {
        print('test 3');
        final productDoc = await _firestore.collection('products').doc(doc.id).get();
        if (productDoc.exists) {
                  print('test 4 ${productDoc.data()}');

          cartProducts.add({
            'product': ProductModel.fromJson(productDoc.id, productDoc.data()!),
            'cartItem': CartItem.fromJson(doc.id,doc.data()!),
          });
        }
      }
      return cartProducts;
    });
  }
}