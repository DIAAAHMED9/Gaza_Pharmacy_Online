// model/user_model.dart
import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? id;
  String name;
  String email;
  String? password;
  String? phone;
  Timestamp? createdAt;

  UserModel({
    this.id,
    required this.name,
    required this.email,
    this.password,
    this.phone,
    this.createdAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json, String id) => UserModel(
        id: id,
        name: json['name'],
        email: json['email'],
        phone: json['phone'],
        createdAt: json['createdAt'],
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'phone': phone,
        'createdAt': FieldValue.serverTimestamp(),
      };
}