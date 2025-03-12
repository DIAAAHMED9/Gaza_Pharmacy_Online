import 'package:flutter/material.dart';

import '../../Component/color.dart';
import 'complete_order.dart';
import 'oderer_details.dart';

class Canceld_order extends StatelessWidget {
  const Canceld_order({super.key});

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
            "طلباتي",
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MaterialButton(
                      onPressed: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => const CompleteOrder()));
                      },
                      child: Container(
                        width: 90,
                        height: 40,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Center(
                          child: Text(
                            "مكتملة",
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 100,
                    ),
                    MaterialButton(
                      onPressed: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => const Canceld_order()));
                      },
                      child: Container(
                        width: 90,
                        height: 40,
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Center(
                            child: Text(
                          "ملغية",
                          style: TextStyle(color: Colors.white),
                        )),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => SingleChildScrollView(

                      child: Container(
                        width: double.infinity,
                        height: 170,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.lightBlueAccent,
                          ),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Text(
                                    "عدد المنتجات",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  Text(
                                    "5",
                                    style: TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    "1 , اكتوبر 2024",
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 13),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Text(
                                    "عالمبلغ الاجمالي",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  Text(
                                    "120 ش",
                                    style: TextStyle(
                                      color: primaryColor,
                                    ),
                                  ),
                                  Spacer(),
                                  MaterialButton(
                                    onPressed: () {
                                      Navigator.of(context).push(MaterialPageRoute(
                                          builder: (context) => const OrderDetails()));
                                    },
                                    child: Container(
                                      width: 100,
                                      height: 35,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(50),
                                        border:
                                            Border.all(color: primaryColor),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "عرض تفاصيل",
                                          style: TextStyle(
                                              color: primaryColor,
                                              fontSize: 13),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Text(
                                    "عنوان التوصيل",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  Text(
                                    "خانيونس - البلد -مسجد الاسلام",
                                    style: TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  Spacer(),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    separatorBuilder: (context, index) => const SizedBox(
                          height: 20,
                        ),
                    itemCount: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
