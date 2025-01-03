import 'package:flutter/material.dart';
import 'package:gaza_pharmacy/UI/Home%20Page/cart.dart';

import '../../Component/color.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white70,
        elevation: 0,
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
            "باندول",
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
              Container(
                width: double.infinity,
                height: 350,
                color: Colors.white54,
                child: Image.asset(
                  "assets/image/comtrex-tabs-11709223596-removebg-preview (1).png",
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                children: [
                  Text(
                    "عدد الاقراص",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: primaryColor,
                    ),
                    width: 80,
                    height: 35,
                    child: Center(child: Text(" 20 قرص", style:
                      TextStyle(

                        color: Colors.white
                      ),)),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "عدد الجرعات",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "جرعة بنادول اكيوت هيد كولد المعتادة للبالغين والأطفال أكبر من 12 عام:هى 1 أو 2 قرص كل 6 ساعات لمدة لا تزيد عن 7 أيام تحت إشراف الطبيب ",
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.grey,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "تفاصيل الدواء",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "بنادول لنزلات البرد الحالدة (برشام كومتركس comtrex tablets الجديد) من أقوي أدوية علاج البرد والانفلونزا وما يصاحبها من أعراض كالرشح، إحتقان الأنف، العطس، حكة العينين، كما يستخدم لتسكين الألم وخفض الحرارة.",
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.grey,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 300,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      color: primaryColor,
                    ),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) => Cart()));
                      },
                      child: Text(
                        "اضافة الى السلة",
                        style: TextStyle(color: Colors.white, fontSize: 17),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "32 ش",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: primaryColor),
                  ),

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
