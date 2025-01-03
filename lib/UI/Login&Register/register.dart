import 'package:flutter/material.dart';
import 'package:gaza_pharmacy/UI/Login&Register/login.dart';
import '../../Component/buttom.dart';
import '../Home Page/bottombat.dart';
import '../../Component/color.dart';

class Register_Screen extends StatelessWidget {
  const Register_Screen({super.key});

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
      body: Form(
          child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    suffix: Icon(Icons.email_outlined),
                    labelText: ' اسم المستخدم',
                    border: OutlineInputBorder(),
                  ),
                ),
                 SizedBox(
                  height: 20,
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
                TextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  decoration: const InputDecoration(
                    suffix: Icon(Icons.lock_outline),
                    prefix: Icon(Icons.remove_red_eye_outlined),
                    labelText: 'ناكبد كلمة المرور',
                    border: OutlineInputBorder(),
                  ),
                ),
                 SizedBox(
                  height: 20,
                ),
                BottomComponent(
                  name: Bottombar(),
                  title: 'انشاء حساب',
                ),
                 SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "هل لديك حساب بالفعل ؟",
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const Login_Screen()));
                      },
                      child: const Text(
                        "تسجيل الدخول",
                        style: TextStyle(
                          color: primaryColor,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
