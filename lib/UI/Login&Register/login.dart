import 'package:flutter/material.dart';
import 'package:gaza_pharmacy/UI/Home%20Page/bottombat.dart';
import 'package:gaza_pharmacy/UI/Login&Register/forget_password.dart';
import 'package:gaza_pharmacy/UI/Login&Register/register.dart';
import 'package:get/get.dart';

import '../../Component/buttom.dart';
import '../../Component/color.dart';
import '../../controller/auth.dart';

class Login_Screen extends StatelessWidget {
   Login_Screen({super.key});
      final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
        final controller = Get.put(AuthController());


    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
                      key: _formKey,

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
                                    controller: emailController,

                  keyboardType: TextInputType.emailAddress,
                   validator: (value) {
                    if (value!.isEmpty) return 'Required';
                    if (!value.isEmail) return 'Invalid email';
                    return null;
                  },
                  decoration: const InputDecoration(
                    suffix: Icon(Icons.email_outlined),
                    labelText: ' الاميل',
                    
                    border: OutlineInputBorder(),
                  ),
                ),
                  SizedBox(
                    height:  10,
                  ),
                  TextFormField(
                    controller: passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    decoration: const InputDecoration(
                      suffix: Icon(Icons.lock_outline),
                      prefix: Icon(Icons.remove_red_eye_outlined),
                      labelText: 'كلمة المرور',
                      border: OutlineInputBorder(),

                    ),
                                 validator: (value) =>
                    value!.isEmpty ? 'Required' : null,
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
                  GestureDetector(
                    onTap:() async {
                        if (_formKey.currentState!.validate()) {
                          await controller.signIn(
                            emailController.text.trim(),
                            passwordController.text.trim(),
                          );
                        }
                      },
                    child: BottomComponent(
                      name: Bottombar(),
                      title: 'تسجيل الدخول',
                    ),
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
