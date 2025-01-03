import 'package:flutter/material.dart';

import '../../Component/color.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({super.key});

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
          child: Text("تفاصيل الطلب ",
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text("عدد المنتجات",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text("5",
                  style: TextStyle(

                    color: Colors.grey
                  ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text("المبلغ الاجمالي",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text("120 ش",
                  style: TextStyle(

                    color: primaryColor,
                  ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text("عنوان التوصيل",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text("خانيونس - البلد -مسجد الاسلام",
                  style: TextStyle(
                    color: Colors.grey
                  ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text("تاريخ الطلب",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text("1 , اكتوبر 2024",
                  style: TextStyle(
                    color: Colors.redAccent
                  ),
                  ),
                ],
              ),
              SizedBox(
                height: 35,
              ),
              Text("المنتجات",
                style: TextStyle(
                  fontSize:18
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) =>Container(
                    width: double.infinity,
                    height: 120,
                    decoration: BoxDecoration(
                      color: Colors.white70,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(35.0),
                      child: Row(
                        children: [
                          Image.asset("assets/image/comtrex-tabs-11709223596-removebg-preview (1).png",
                            width: 90,
                            height: 70,
                            fit: BoxFit.cover,
                          ),
                          Column(
                            children: [
                              Text("تلفاست "),
                              Row(
                                children: [
                                  Text("9 ش / ",
                                    style: TextStyle(
                                      color: primaryColor,
                                    ),
                                  ),
                                  Text(" 20 قرص",
                                    style: TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Spacer(),
                          Column(
                            children: [
                              Text("الكمية",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Container(
                                width: 70,
                                height: 30,
                                decoration: BoxDecoration(
                                  color: primaryColor,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: Center(
                                  child: Text("20 قرص",
                                    style: TextStyle(
                                      color: Colors.white,

                                    ),
                                  ),
                                ),
                              ),
                            ],
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
    );
  }
}
