import 'package:flutter/material.dart';
import 'package:gaza_pharmacy/UI/Home%20Page/payment.dart';
import 'package:gaza_pharmacy/Component/color.dart';


class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  int itemcount = 2;
  int number = 6;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "عربة التسوق",
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
              ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => Container(
                        width: double.infinity,
                        height: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            width: 3,
                            color: primaryColor,
                          ),
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(
                                "assets/image/comtrex-tabs-11709223596-removebg-preview (1).png",
                                width: 90,
                                height: 70,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Column(
                              children: [
                                SizedBox(
                                  height: 50,
                                ),
                                Text("تلفاست "),
                                Row(
                                  children: [
                                    Text(
                                      "9 ش / ",
                                      style: TextStyle(
                                        color: primaryColor,
                                      ),
                                    ),
                                    Text(
                                      " 20 قرص",
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
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: primaryColor,
                                    borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(20)),
                                  ),
                                  child: Center(
                                      child: IconButton(
                                          onPressed: () {
                                            setState(() {
                                              itemcount--;
                                            });
                                          },
                                          icon: Icon(
                                            Icons.delete_outline_sharp,
                                            color: Colors.white,
                                          ))),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          color: primaryColor,
                                          borderRadius:
                                              BorderRadius.circular(50),
                                        ),
                                        child: IconButton(
                                            onPressed: () {
                                              setState(() {
                                                number--;
                                              });
                                            },
                                            icon: Icon(
                                              Icons.minimize,
                                              color: Colors.white,
                                            )),
                                      ),
                                      SizedBox(
                                        width:10,
                                      ),
                                      Text(
                                        "${number}",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          color: primaryColor,
                                          borderRadius:
                                              BorderRadius.circular(50),
                                        ),
                                        child: IconButton(
                                            onPressed: () {
                                              setState(() {
                                                number++;
                                              });
                                            },
                                            icon: Icon(
                                              Icons.add,
                                              color: Colors.white,
                                            )),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                  separatorBuilder: (context, index) => SizedBox(
                        height: 20,
                      ),
                  itemCount: itemcount),
              SizedBox(
                height:20,
              ),
              Text(
                "تفاصيل الطلب",
                style: TextStyle(color: primaryColor, fontSize: 18),
              ),
              SizedBox(
                height: 16,
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
                height:  20,
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
                        builder: (context) => const Payment()));
                  },
                  child: const Text(
                    'الانتقال الى الدفع',
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
