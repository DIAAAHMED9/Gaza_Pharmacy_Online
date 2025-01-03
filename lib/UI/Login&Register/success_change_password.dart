import 'package:flutter/material.dart';
import 'package:gaza_pharmacy/UI/Login&Register/login.dart';

import '../../Component/buttom.dart';

class SuccessChangePassword extends StatelessWidget {
  const SuccessChangePassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/image/undraw_authentication_re_svpt 1.png",
                height:  400,
                width: double.infinity,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "تم تغيير كلمة المرور بنجاح ",
                style: TextStyle(fontSize: 25, color: Colors.black),
              ),
              SizedBox(
                height: 40,
              ),
              BottomComponent(
                name: Login_Screen(),
                title: 'العودة لصفحة التسجيل',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
