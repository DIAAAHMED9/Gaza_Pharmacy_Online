import 'package:flutter/material.dart';
import 'package:gaza_pharmacy/UI/Login&Register/login.dart';
import 'package:get/get.dart';
import '../../Component/buttom.dart';
import '../../controller/auth.dart';
import '../Home Page/bottombat.dart';
import '../../Component/color.dart';

class Register_Screen extends StatelessWidget {
   Register_Screen({super.key});
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
        final controller = Get.put(AuthController());

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
        key: _formKey,
          child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                  height: 20,
                ),
                TextFormField(
                                    controller: phoneController,

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
                                    controller: passwordController,

                  obscureText: true,
                  decoration: const InputDecoration(
                    suffix: Icon(Icons.lock_outline),
                    prefix: Icon(Icons.remove_red_eye_outlined),
                    labelText: 'كلمة المرور',
                    border: OutlineInputBorder(),
                  ),
                      validator: (value) {
                    if (value!.isEmpty) return 'Required';
                    if (value.length < 6) return 'Minimum 6 characters';
                    return null;
                  },
                ),
                 SizedBox(
                  height: 20,
                ),
                // TextFormField(
                //   keyboardType: TextInputType.visiblePassword,
                //   obscureText: true,
                //   decoration: const InputDecoration(
                //     suffix: Icon(Icons.lock_outline),
                //     prefix: Icon(Icons.remove_red_eye_outlined),
                //     labelText: 'ناكبد كلمة المرور',
                //     border: OutlineInputBorder(),
                //   ),
                // ),
                 SizedBox(
                  height: 20,
                ),
              Obx(() => controller.isLoading.value
                    ? CircularProgressIndicator(): GestureDetector(
                      onTap: ()async {
                           if (_formKey.currentState!.validate()) {
                            await controller.signUp(
                              email: emailController.text.trim(),
                              password: passwordController.text.trim(),
                              name: nameController.text.trim(),
                              phone: phoneController.text.trim(),
                            );}
                      },
                      child: BottomComponent(
                                        name: Bottombar(),
                                        title: 'انشاء حساب',
                                        
                                      ),
                    )) ,
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
                            builder: (context) =>  Login_Screen()));
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
