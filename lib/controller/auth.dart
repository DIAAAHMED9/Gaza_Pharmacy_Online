// controllers/auth_controller.dart
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../model/user.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  
  Rx<User?> firebaseUser = Rx<User?>(null);
  Rx<UserModel?> userModel = Rx<UserModel?>(null);
    RxBool isLoading = false.obs;

  @override
  void onInit() {
    firebaseUser.bindStream(_auth.authStateChanges());
    ever(firebaseUser, _setInitialUser);
    super.onInit();
  }

  void _setInitialUser(User? user) async {
    if (user != null) {
      userModel.value = await _getUserData(user.uid);
    }
  }

  Future<UserModel?> _getUserData(String uid) async {
    DocumentSnapshot doc = 
      await _firestore.collection('users').doc(uid).get();
    return doc.exists ? UserModel.fromJson(doc.data() as Map<String, dynamic>, uid) : null;
  }

  // Sign Up
  Future<void> signUp({
    required String email,
    required String password,
    required String name,
    String? phone,
  }) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      
      UserModel newUser = UserModel(
        id: credential.user!.uid,
        name: name,
        email: email,
        phone: phone,
      );

      await _firestore.collection('users').doc(newUser.id).set(newUser.toJson());
      
      Get.offAllNamed('/home');
    } on FirebaseAuthException catch (e) {
      Get.snackbar('Error', e.message!);
    }
  }

  // Sign In
  Future<void> signIn(String email, String password) async {
    try {
            isLoading.value = true;

      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      Get.offAllNamed('/home');
    } on FirebaseAuthException catch (e) {
      Get.snackbar('Error', e.message!);
    }finally{
      isLoading.value = false;
    }
  }

  // Edit Profile
  Future<void> editProfile({
    required String name,
    String? phone,
  }) async {
    try {
            isLoading.value = true;

      await _firestore.collection('users').doc(firebaseUser.value!.uid).update({
        'name': name,
        'phone': phone,
      });
      userModel.value = await _getUserData(firebaseUser.value!.uid);
      Get.snackbar('Success', 'Profile updated');
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }finally{
      isLoading.value = false;
    } 
  }

  // Change Password
  Future<void> changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    try {
            isLoading.value = true;

      User user = _auth.currentUser!;
      AuthCredential credential = EmailAuthProvider.credential(
        email: user.email!,
        password: currentPassword,
      );
      
      await user.reauthenticateWithCredential(credential);
      await user.updatePassword(newPassword);
      
      Get.snackbar('Success', 'Password changed');
    } on FirebaseAuthException catch (e) {
      Get.snackbar('Error', e.message!);
    }finally{
      isLoading.value = false;
    } 
  }

  // Sign Out
  Future<void> signOut() async {
    await _auth.signOut();
    Get.offAllNamed('/login');
  }
}