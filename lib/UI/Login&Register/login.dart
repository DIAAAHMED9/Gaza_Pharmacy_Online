import 'package:flutter/material.dart';
import 'package:gaza_pharmacy/UI/Home%20Page/bottombat.dart';
import 'package:gaza_pharmacy/UI/Login&Register/forget_password.dart';
import 'package:gaza_pharmacy/UI/Login&Register/register.dart';

import '../../Component/buttom.dart';
import '../../Component/color.dart';

class Login_Screen extends StatelessWidget {
  const Login_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
              child: Padding(
            padding: EdgeInsets.all(12.0),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Image.asset(
                    "assets/icon/1.png",
                    height:  200,
                    width: double.infinity,
                  ),
                  TextFormField(
                    cursorColor: primaryColor,
                    cursorErrorColor: Colors.redAccent,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      suffix: Icon(Icons.phone_in_talk),
                      labelText: ' رقم الجوال',
                      fillColor: primaryColor,
                      focusColor: primaryColor,
                      hoverColor: primaryColor,
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: primaryColor, width: 5),
                      ),
                    ),
                  ),
                  SizedBox(
                    height:  10,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    decoration: const InputDecoration(
                      suffix: Icon(Icons.lock_outline),
                      prefix: Icon(Icons.remove_red_eye_outlined),
                      labelText: 'كلمة المرور',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ForgetPassword()));
                      },
                      child: Text(
                        "هل نسيت كلمة المرور؟",
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey,
                        ),
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  BottomComponent(
                    name: Bottombar(),
                    title: 'تسجيل الدخول',
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Register_Screen()));
                      },
                      child: Center(
                        child: Text(
                          "لا امتلك حساب",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ))
                ],
              ),
            ),
          )),
        ),
      ),
    );
  }
}
