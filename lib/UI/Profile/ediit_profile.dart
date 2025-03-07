import 'package:flutter/material.dart';
import 'package:gaza_pharmacy/UI/Profile/profile.dart';

import '../../Component/buttom.dart';


class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.arrow_back_ios_new_outlined),
            ),
          ),
        ],
        title: Center(
          child: Text(
            "تعديل الحساب",
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            // spacing: 20,
            children: [
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: ' اسم المستخدم',
                  border: OutlineInputBorder(),
                ),
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: ' ادخل الايميل',
                  border: OutlineInputBorder(),
                ),
              ),
              TextFormField(
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  labelText: ' رقم الهاتف',
                  border: OutlineInputBorder(),
                ),
              ),
              BottomComponent(
                name: Profile(),
                title: 'حفظ التعديلات',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
