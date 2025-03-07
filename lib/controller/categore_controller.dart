import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gaza_pharmacy/model/category.dart';
import 'package:get/get.dart';

import '../model/product.dart';

class CategoreController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  // Get catrgores items stream
  Stream<List<CategoryModel>> getCategorieItems() {
    return _firestore.collection('categories').snapshots().map((snapshot) {
      print('test 1 category ${snapshot.docs.first.data()}');
      return snapshot.docs
            .map((doc) => CategoryModel.fromJson(doc.id,doc.data()))
            .toList();
           } );
            
  }

  // Get catrgores items with product details
  Stream<List<Map<String, dynamic>>> getCategoreProducts() {
    print('test 1');
    return _firestore.collection('categories').snapshots().asyncMap((snapshot) async {
      print('test 2 ${snapshot.docs.first.data()}');
      List<Map<String, dynamic>> cartProducts = [];
      for (var doc in snapshot.docs) {
        print('test 3');
        final productDoc = await _firestore.collection('products').doc(doc.id).get();
        if (productDoc.exists) {
                  print('test 4 ${productDoc.data()}');

          cartProducts.add({
            'product': ProductModel.fromJson(productDoc.id, productDoc.data()!),
            'cartItem': CategoryModel.fromJson(doc.id,doc.data()!),
          });
        }
      }
      return cartProducts;
    });
  }
}