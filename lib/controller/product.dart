import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import '../model/product.dart';

class ProductController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Stream for all products
  Stream<List<ProductModel>> getProducts() {
    return _firestore
        .collection('products')
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => ProductModel.fromJson(doc.id,doc.data()))
            .toList());
  }

  // Add product
  Future<void> addProduct(ProductModel product) async {
    try {
        final docRef = await FirebaseFirestore.instance.collection('products').add(product.toJson());
  await docRef.update({'id': docRef.id});  

    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  // Update product
  Future<void> updateProduct(ProductModel product) async {
    try {
      await _firestore.collection('products').doc(product.id).update(product.toJson());
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  // Delete product
  Future<void> deleteProduct(String productId) async {
    try {
      await _firestore.collection('products').doc(productId).delete();
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  // Toggle love status
  Future<void> toggleLove(String productId, bool isLoved) async {
    try {
      await _firestore.collection('products').doc(productId).update({'isLoved': isLoved});
      if (isLoved) {
        await _firestore.collection('loved').doc(productId).set({'productId': productId});
      } else {
        await _firestore.collection('loved').doc(productId).delete();
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  // Add to cart
  Future<void> addToCart(String productId) async {
    try {
      await _firestore.collection('cart').doc(productId).set({
        'quantity': 1,
        'productId': productId,
        'addedAt': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  // Stream for loved products
  Stream<List<ProductModel>> getLovedProducts() {
    return _firestore
        .collection('loved')
        .snapshots()
        .asyncMap((snapshot) async {
      List<ProductModel> lovedProducts = [];
      for (var doc in snapshot.docs) {
        var productDoc = await _firestore.collection('products').doc(doc.id).get();
        if (productDoc.exists) {
          lovedProducts.add(ProductModel.fromJson(doc.id,productDoc.data()!));
        }
      }
      return lovedProducts;
    });
  }


}
