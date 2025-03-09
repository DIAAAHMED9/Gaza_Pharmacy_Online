// import 'dart:async';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:get/get.dart';
// import 'package:intl/intl.dart';

// import '../model/orders.dart';

// class OrderController extends GetxController {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   // final AuthController _authController = Get.find<AuthController>();
//   StreamSubscription? _ordersSubscription;

//   Stream<List<OrderModel>> get completedOrdersStream => _firestore
//       .collection('orders')
//       .where('userId', isEqualTo: _authController.currentUser?.id)
//       .where('status', isEqualTo: 'completed')
//       .orderBy('createdAt', descending: true)
//       .snapshots()
//       .map((snapshot) => snapshot.docs
//           .map((doc) => OrderModel.fromFirestore(doc))
//           .toList());

//   Stream<List<OrderModel>> get canceledOrdersStream => _firestore
//       .collection('orders')
//       .where('userId', isEqualTo: _authController.currentUser?.id)
//       .where('status', isEqualTo: 'canceled')
//       .orderBy('createdAt', descending: true)
//       .snapshots()
//       .map((snapshot) => snapshot.docs
//           .map((doc) => OrderModel.fromFirestore(doc))
//           .toList());

//   @override
//   void onClose() {
//     _ordersSubscription?.cancel();
//     super.onClose();
//   }

//   Future<void> toggleOrderStatus(String orderId, String newStatus) async {
//     try {
//       await _firestore
//           .collection('orders')
//           .doc(orderId)
//           .update({'status': newStatus});
//     } catch (e) {
//       Get.snackbar('Error', 'Failed to update order status: ${e.toString()}');
//     }
//   }

//   String formatOrderDate(DateTime date) {
//     return DateFormat('dd MMM yyyy - HH:mm').format(date);
//   }
// }