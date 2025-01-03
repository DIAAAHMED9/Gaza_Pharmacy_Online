import 'package:flutter/material.dart';

import '../../Component/buttom.dart';
import 'OTP_Screen.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

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
        title: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "انشاء  حساب جديد",
            ),
            Text(
              "ادخل بياناتك لتسجيل حساب جديد",
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(
                  'assets/image/Forgot password-amico.png',
                  width: double.infinity,
                  height: 200,
                ),
                Text(
                  "رقم الهاتف يجب ان يكون مبدوئا ب",
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
                Text(
                  "059 & 056",
                  style: TextStyle(
                    fontSize: 14,
                    decoration: TextDecoration.underline,
                  ),
                ),
                SizedBox(
                  height:20,
                ),
                TextFormField(
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    suffix: Icon(Icons.phone_in_talk),
                    labelText: ' رقم الهاتف',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height:20,
                ),
                BottomComponent(
                  name: OtpScreen(),
                  title: 'ارسال رمز التاكيد',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
