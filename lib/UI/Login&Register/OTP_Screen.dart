import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:gaza_pharmacy/UI/Login&Register/new_password.dart';
import 'package:gaza_pharmacy/Component/color.dart';

import '../../Component/buttom.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
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
              "رمز التحقق OTP",
            ),
            Text(
              "ادخل كود التحقق المرسل الى هاتفك",
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Image.asset(
                  'assets/image/Enter OTP-cuate.png',
                  width: double.infinity,
                  height: 200,
                ),
                SizedBox(
                  height:20,
                ),
                SizedBox(
                  width: double.infinity,
                  child: OtpTextField(
                    decoration: InputDecoration(
                      fillColor: primaryColor
                    ),
                    fillColor: primaryColor,
                    cursorColor: primaryColor,
                    disabledBorderColor: primaryColor,
                    numberOfFields: 6,
                    borderColor: primaryColor,
                    //set to true to show as box or false to show as dash
                    showFieldAsBox: true,
                    //runs when a code is typed in
                    onCodeChanged: (String code) {
                      //handle validation or checks here
                    },
                    //runs when every textfield is filled
                    onSubmit: (String verificationCode) {
                      showDialog(

                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text("رمز التحقق",
                              style: TextStyle(
                                color: primaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                              ),
                              content: Text('الكود هو $verificationCode',
                              style: TextStyle(
                                fontSize: 14
                              ),
                              ),
                            );
                          });
                    }, // end onSubmit
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                BottomComponent(
                  name: NewPassword(),
                  title:  'تاكيد الرمز',
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("لم يصلك الرمز؟"),
                    Icon(Icons.rotate_left_outlined,
                      color: primaryColor,
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          "اعادة ارسال الرمز",
                          style: TextStyle(

                            color: primaryColor,
                          ),
                        ))
                  ],
                ),
                SizedBox(
                  height:  40,
                ),
                Text("تنتهي صلاحية الرمز خلال"),
                SizedBox(
                  height:  10,
                ),
                Text("00:32 ث",
                style: TextStyle(
                  color: Colors.red
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
