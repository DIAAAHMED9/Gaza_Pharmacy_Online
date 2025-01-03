import 'package:flutter/material.dart';
import '../../Component/buttom.dart';
import '../Home Page/bottombat.dart';
import 'login.dart';
import 'register.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(
                  "assets/icon/1.png",
                  height: 200,
                  width: double.infinity,
                ),
                SizedBox(height: 20),
                BottomComponent(
                  name: Login_Screen(),
                  title: 'تسجيل الدخول',
                ),
                SizedBox(height: 20),
                BottomComponent(
                  name: Register_Screen(),
                  title: "انشاء حساب",
                ),
                SizedBox(height: 40),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Bottombar()),
                    );
                  },
                  child: Text(
                    "تسجيل الدخول كزائر",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
