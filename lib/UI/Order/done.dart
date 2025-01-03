import 'package:flutter/material.dart';


import '../../Component/buttom.dart';
import '../Home Page/bottombat.dart';
import '../../Component/color.dart';

class Done_Order extends StatelessWidget {
  const Done_Order({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 220,
                  height: 220,
                  decoration: BoxDecoration(
                      color: Colors.blue[50],
                      borderRadius: BorderRadius.circular(200)),
                  child: Icon(
                    Icons.check_circle,
                    color: primaryColor,
                    size: 225,

                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Text(
                  "تم تأكيد الطلب",
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "رقم الطلب : QWGDYE1",
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                BottomComponent(
                  name: Bottombar(),
                  title: 'ارسل رمز التاكيد',
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
