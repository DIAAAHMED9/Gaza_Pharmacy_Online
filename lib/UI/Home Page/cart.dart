import 'package:flutter/material.dart';
import 'package:gaza_pharmacy/Component/color.dart';
import 'package:get/get.dart';
import '../../controller/cart.dart';
import '../../model/cart.dart';
import '../../model/product.dart';
import '../../stripe_payment/stripe_mangment.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  int totalAmount = 0;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CartController>();

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
      body: StreamBuilder<List<Map<String, dynamic>>>(
          stream: controller.getCartProducts(),
          builder: (context, snapshot) {
            if (snapshot.hasError)
              return Center(child: Text('No Items in Cart'));
            if (!snapshot.hasData)
              return Center(child: CircularProgressIndicator());
            controller.calculateTotal(snapshot.data!);

            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          final item = snapshot.data![index];
                          final product = item['product'] as ProductModel;
                          final cartItem = item['cartItem'] as CartItem;

                          return cartProducts(
                            item: item,
                            product: product,
                            cartItem: cartItem,
                          );
                        },
                        separatorBuilder: (context, index) => SizedBox(
                              height: 20,
                            ),
                        itemCount: snapshot.data!.length),
                    SizedBox(
                      height: 20,
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
                          controller.total.toStringAsFixed(2),
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
                          controller.total.toStringAsFixed(2),
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: primaryColor,
                          ),
                        ),
                        // Obx(() =>   ),
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
                        onPressed: () async {
                          await PaymentManger.mackPayment(
                              controller.total.toInt(), 'usd');
                          // Navigator.of(context).push(MaterialPageRoute(
                          //     builder: (context) => const Payment()));
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
            );
          }),
    );
  }
}

class cartProducts extends StatelessWidget {
  const cartProducts(
      {super.key,
      required this.cartItem,
      required this.item,
      required this.product});

  final dynamic item;
  final dynamic product;
  final dynamic cartItem;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CartController>();

    return Container(
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
            child: Image.network(
              product.image,
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
              Text(product.name),
              Row(
                children: [
                  Text(
                    '\$${product.price.toStringAsFixed(2)}',
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
          Text('${product.price * cartItem.quantity}'),
          Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius:
                      BorderRadius.only(bottomRight: Radius.circular(20)),
                ),
                child: Center(
                    child: IconButton(
                        onPressed: () => controller.updateCartQuantity(
                              product.id!,
                              cartItem.quantity = 0,
                            ),
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
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: IconButton(
                          onPressed: () => controller.updateCartQuantity(
                              product.id!, cartItem.quantity -= 1),
                          icon: Icon(
                            Icons.minimize,
                            color: Colors.white,
                          )),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "${cartItem.quantity}",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: IconButton(
                          onPressed: () => controller.updateCartQuantity(
                                product.id!,
                                cartItem.quantity += 1,
                              ),
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
    );
  }
}
