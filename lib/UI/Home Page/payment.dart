import 'package:flutter/material.dart';
import 'package:gaza_pharmacy/UI/Order/done.dart';

import '../../Component/color.dart';

class Payment extends StatelessWidget {
  const Payment({super.key});

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
            "الدفع",
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "عنوان التوصيل",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "شارع صلاح الدين , بجوار مسجد الاسلام , منطقة التحلية , محافظة خانيونس ",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Divider(
                indent: 5,
                thickness: 1,
                endIndent: 10,
                color: Colors.grey,
                height: 5,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "ميعاد التوصيل",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  Text(
                    "خلال ",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    " ساعة واحدة  ",
                    style: TextStyle(
                      color: primaryColor,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    "من وقت اتمام الطلب ",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Divider(
                indent: 5,
                thickness: 1,
                endIndent: 10,
                color: Colors.grey,
                height: 5,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "تفاصيل الطلب",
                style: TextStyle(color: primaryColor, fontSize: 18),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Text(
                    "سعر المنتجات",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  Spacer(),
                  Text(
                    "55 ش ",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  Text(
                    "تكلفة التوصيل",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  Spacer(),
                  Text(
                    "55 ش ",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Divider(
                indent: 5,
                thickness: 2,
                endIndent: 10,
                color: Colors.grey,
                height: 5,
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    "المبلغ الاجمالي",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: primaryColor,
                    ),
                  ),
                  Spacer(),
                  Text(
                    "55 ش ",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: primaryColor,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  color: primaryColor,
                ),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: MaterialButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const Done_Order()));
                  },
                  child: const Text(
                    'اتمام الطلب',
                    style: TextStyle(color: Colors.white, fontSize: 17),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
