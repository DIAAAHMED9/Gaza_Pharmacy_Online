import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';

class UserProfile {
  String? userId;
  String name;
  String email;
  String? profileImage;
  String address;
  DateTime? createdAt;

  UserProfile({
    this.userId,
    required this.name,
    required this.email,
    this.profileImage,
    required this.address,
    this.createdAt,
  });

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'profileImage': profileImage,
        'address': address,
        'createdAt': FieldValue.serverTimestamp(),
      };

  factory UserProfile.fromJson(String docId, Map<String, dynamic> json) => UserProfile(
        userId: docId,
        name: json['name'],
        email: json['email'],
        profileImage: json['profileImage'],
        address: json['address'],
        createdAt: (json['createdAt'] as Timestamp).toDate(),
      );
}

// Profile Controller
class ProfileController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<UserProfile> getProfile() {
    final userId = _auth.currentUser?.uid;
    if (userId == null) throw Exception("User not logged in");
    
    return _firestore
        .collection('users')
        .doc(userId)
        .snapshots()
        .map((snapshot) => UserProfile.fromJson(userId, snapshot.data()!));
  }

  Future<void> updateProfile(UserProfile profile) async {
    try {
      final userId = _auth.currentUser?.uid;
      if (userId == null) throw Exception("User not logged in");
      
      await _firestore
          .collection('users')
          .doc(userId)
          .update(profile.toJson());
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  Future<void> uploadProfileImage(File imageFile) async {
    try {
      final userId = _auth.currentUser?.uid;
      if (userId == null) throw Exception("User not logged in");
      
      final ref = FirebaseStorage.instance
          .ref()
          .child('profile_images')
          .child('$userId.jpg');
      
      await ref.putFile(imageFile);
      final url = await ref.getDownloadURL();
      
      await _firestore
          .collection('users')
          .doc(userId)
          .update({'profileImage': url});
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }
}
