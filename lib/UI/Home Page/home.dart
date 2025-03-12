import 'package:flutter/material.dart';
import 'package:gaza_pharmacy/UI/Home%20Page/favorite_screen.dart';
import 'package:gaza_pharmacy/UI/Home%20Page/section.dart';
import 'package:gaza_pharmacy/Component/color.dart';
import 'package:gaza_pharmacy/UI/Home%20Page/serchapp.dart';
import 'package:gaza_pharmacy/UI/Product/product.dart';
import 'package:gaza_pharmacy/controller/categore_controller.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../controller/product.dart';
import '../../model/category.dart';
import '../../model/product.dart';
import '../Product/product_details.dart';

class Home_Page extends StatefulWidget {
  const Home_Page({super.key});

  @override
  State<Home_Page> createState() => _BottombarState();
}

class _BottombarState extends State<Home_Page> {
  final _contriler = PageController(initialPage: 1, viewportFraction: 0.5);
  final ProductModel product =
      ProductModel(name: 'name', image: 'image', price: 20, categoryId: null);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProductController>();
    final categoryController = Get.find<CategoreController>();

    return SafeArea(
        child: SingleChildScrollView(
      child: Column(
        // spacing: 20,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.notifications_none,
                    color: Colors.grey,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => LovedScreen()));
                  },
                  icon: Icon(
                    Icons.favorite_border,
                    color: Colors.grey,
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MaterialButton(
                    onPressed: () {},
                    child: Container(
                      width: 130,
                      height: 55,
                      decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.location_on_outlined,
                              color: Colors.white,
                            ),
                            Text(
                              "اضافة عنوان",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                child: MaterialButton(
                  onPressed: () {
                    showSearch(context: context, delegate: Serchapp());
                  },
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(13.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.search_rounded,
                            color: Colors.grey,
                          ),
                          Text(
                            "ابحث عن دوائك ",
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.filter_alt,
                    color: primaryColor,
                  ))
            ],
          ),
          Center(
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 150,
                  child: PageView(
                    controller: _contriler,
                    scrollDirection: Axis.horizontal,
                    children: List.generate(
                      3,
                      (int index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: primaryColor,
                          ),
                          child: Image.network(
                            "https://th.bing.com/th/id/R.46c94894bea3db400863edea3b5ed879?rik=pZ641%2fPY7w0Sxw&pid=ImgRaw&r=0",
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SmoothPageIndicator(
                  controller: _contriler,
                  count: 3,
                  effect: JumpingDotEffect(
                    activeDotColor: primaryColor,
                    dotColor: Colors.grey,
                    jumpScale: 3,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text("الاقسام"),
                      Spacer(),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const Section()));
                          },
                          child: Text(
                            "عرض الكل",
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: Colors.grey,
                                fontSize: 14),
                          ))
                    ],
                  ),
                ),
                SizedBox(
                  height: 129,
                  child: StreamBuilder<List<CategoryModel>>(
                      stream: categoryController.getCategorieItems(),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) return Text('No Items in Cart');
                        if (!snapshot.hasData)
                          return Center(child: CircularProgressIndicator());
                        print(snapshot.data);
                        return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (BuildContext context, int index) =>
                              CategoryItem(
                            category: snapshot.data![index],
                          ),
                        );
                      }),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text("الادوية"),
                      Spacer(),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Product()));
                          },
                          child: Text(
                            "عرض الكل",
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: Colors.grey,
                                fontSize: 14),
                          ))
                    ],
                  ),
                ),
                StreamBuilder<List<ProductModel>>(
                    stream: controller.getProducts(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError)
                        return Text('Error: ${snapshot.error}');
                      if (!snapshot.hasData) return CircularProgressIndicator();

                      return GridView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data!.length,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, childAspectRatio: 3 / 4),
                        itemBuilder: (context, index) => MaterialButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const ProductDetails()));
                          },
                          child: GridProductItem(
                            product: snapshot.data![index],
                          ),
                        ),
                      );
                    }),
                // Wrap(
                //   spacing: 10,
                //   alignment: WrapAlignment.center,
                //   crossAxisAlignment: WrapCrossAlignment.center,
                //   children: [
                //     MaterialButton(
                //       onPressed: () {
                //         Navigator.of(context).push(MaterialPageRoute(
                //             builder: (context) => const ProductDetails()));
                //       },
                //       child: Card(
                //         shape: RoundedRectangleBorder(
                //           borderRadius: BorderRadius.circular(10),
                //         ),
                //         elevation: 4,
                //         child: Container(
                //           width:  150,
                //           height:  200,
                //           child: Column(
                //             mainAxisSize: MainAxisSize.min,
                //             children: [
                //               Row(
                //                 children: [
                //                   Align(
                //                     alignment: Alignment.topRight,
                //                     child: IconButton(
                //                       onPressed: () {},
                //                       icon: Icon(
                //                         Icons.favorite_border,
                //                         color: Colors.grey,
                //                       ),
                //                     ),
                //                   ),
                //                   Spacer(),
                //                   Container(
                //                     width: 40,
                //                     height: 40,
                //                     decoration: BoxDecoration(
                //                         color: primaryColor,
                //                         borderRadius:
                //                             BorderRadius.circular(10)),
                //                     child: IconButton(
                //                       onPressed: () {},
                //                       icon: Icon(
                //                         Icons.add,
                //                         color: Colors.white,
                //                       ),
                //                     ),
                //                   ),
                //                 ],
                //               ),
                //               Padding(
                //                 padding: const EdgeInsets.all(10.0),
                //                 child: Image.asset(
                //                   "assets/image/On-bording.png",
                //                   width:  100,
                //                   height: 80,
                //                   fit: BoxFit.fill,
                //                 ),
                //               ),
                //               Text(
                //                 'تلفاست',
                //                 style: TextStyle(
                //                   fontSize: 18,
                //                   fontWeight: FontWeight.bold,
                //                 ),
                //               ),
                //               Row(
                //                 mainAxisAlignment: MainAxisAlignment.center,
                //                 children: [
                //                   Text(
                //                     '9 ش',
                //                     style: TextStyle(
                //                       color: primaryColor,
                //                       fontSize: 16,
                //                       fontWeight: FontWeight.bold,
                //                     ),
                //                   ),
                //                   Text(
                //                     ' / 20 قرص',
                //                     style: TextStyle(
                //                       color: Colors.black54,
                //                       fontSize: 16,
                //                     ),
                //                   ),
                //                 ],
                //               ),
                //             ],
                //           ),
                //         ),
                //       ),
                //     ),
                //     MaterialButton(
                //       onPressed: () {
                //         Navigator.of(context).push(MaterialPageRoute(
                //             builder: (context) => const ProductDetails()));
                //       },
                //       child: Card(
                //         shape: RoundedRectangleBorder(
                //           borderRadius: BorderRadius.circular(10),
                //         ),
                //         elevation: 4,
                //         child: Container(
                //           width:  150,
                //           height:  200,
                //           child: Column(
                //             mainAxisSize: MainAxisSize.min,
                //             children: [
                //               Row(
                //                 children: [
                //                   Align(
                //                     alignment: Alignment.topRight,
                //                     child: IconButton(
                //                       onPressed: () {},
                //                       icon: Icon(
                //                         Icons.favorite_border,
                //                         color: Colors.grey,
                //                       ),
                //                     ),
                //                   ),
                //                   Spacer(),
                //                   Container(
                //                     width: 40,
                //                     height: 40,
                //                     decoration: BoxDecoration(
                //                         color: primaryColor,
                //                         borderRadius:
                //                             BorderRadius.circular(10)),
                //                     child: IconButton(
                //                       onPressed: () {},
                //                       icon: Icon(
                //                         Icons.add,
                //                         color: Colors.white,
                //                       ),
                //                     ),
                //                   ),
                //                 ],
                //               ),
                //               Padding(
                //                 padding: const EdgeInsets.all(10.0),
                //                 child: Image.asset(
                //                   "assets/image/On-bording.png",
                //                   width:  100,
                //                   height: 80,
                //                   fit: BoxFit.fill,
                //                 ),
                //               ),
                //               Text(
                //                 'تلفاست',
                //                 style: TextStyle(
                //                   fontSize: 18,
                //                   fontWeight: FontWeight.bold,
                //                 ),
                //               ),
                //               Row(
                //                 mainAxisAlignment: MainAxisAlignment.center,
                //                 children: [
                //                   Text(
                //                     '9 ش',
                //                     style: TextStyle(
                //                       color: primaryColor,
                //                       fontSize: 16,
                //                       fontWeight: FontWeight.bold,
                //                     ),
                //                   ),
                //                   Text(
                //                     ' / 20 قرص',
                //                     style: TextStyle(
                //                       color: Colors.black54,
                //                       fontSize: 16,
                //                     ),
                //                   ),
                //                 ],
                //               ),
                //             ],
                //           ),
                //         ),
                //       ),
                //     ),
                //     MaterialButton(
                //       onPressed: () {
                //         Navigator.of(context).push(MaterialPageRoute(
                //             builder: (context) => const ProductDetails()));
                //       },
                //       child: Card(
                //         shape: RoundedRectangleBorder(
                //           borderRadius: BorderRadius.circular(10),
                //         ),
                //         elevation: 4,
                //         child: Container(
                //           width:  150,
                //           height:  200,
                //           child: Column(
                //             mainAxisSize: MainAxisSize.min,
                //             children: [
                //               Row(
                //                 children: [
                //                   Align(
                //                     alignment: Alignment.topRight,
                //                     child: IconButton(
                //                       onPressed: () {},
                //                       icon: Icon(
                //                         Icons.favorite_border,
                //                         color: Colors.grey,
                //                       ),
                //                     ),
                //                   ),
                //                   Spacer(),
                //                   Container(
                //                     width: 40,
                //                     height: 40,
                //                     decoration: BoxDecoration(
                //                         color: primaryColor,
                //                         borderRadius:
                //                             BorderRadius.circular(10)),
                //                     child: IconButton(
                //                       onPressed: () {},
                //                       icon: Icon(
                //                         Icons.add,
                //                         color: Colors.white,
                //                       ),
                //                     ),
                //                   ),
                //                 ],
                //               ),
                //               Padding(
                //                 padding: const EdgeInsets.all(10.0),
                //                 child: Image.asset(
                //                   "assets/image/On-bording.png",
                //                   width:  100,
                //                   height: 80,
                //                   fit: BoxFit.fill,
                //                 ),
                //               ),
                //               Text(
                //                 'تلفاست',
                //                 style: TextStyle(
                //                   fontSize: 18,
                //                   fontWeight: FontWeight.bold,
                //                 ),
                //               ),
                //               Row(
                //                 mainAxisAlignment: MainAxisAlignment.center,
                //                 children: [
                //                   Text(
                //                     '9 ش',
                //                     style: TextStyle(
                //                       color: primaryColor,
                //                       fontSize: 16,
                //                       fontWeight: FontWeight.bold,
                //                     ),
                //                   ),
                //                   Text(
                //                     ' / 20 قرص',
                //                     style: TextStyle(
                //                       color: Colors.black54,
                //                       fontSize: 16,
                //                     ),
                //                   ),
                //                 ],
                //               ),
                //             ],
                //           ),
                //         ),
                //       ),
                //     ),
                //     MaterialButton(
                //       onPressed: () {
                //         Navigator.of(context).push(MaterialPageRoute(
                //             builder: (context) => const ProductDetails()));
                //       },
                //       child: Card(
                //         shape: RoundedRectangleBorder(
                //           borderRadius: BorderRadius.circular(10),
                //         ),
                //         elevation: 4,
                //         child: Container(
                //           width:  150,
                //           height:  200,
                //           child: Column(
                //             mainAxisSize: MainAxisSize.min,
                //             children: [
                //               Row(
                //                 children: [
                //                   Align(
                //                     alignment: Alignment.topRight,
                //                     child: IconButton(
                //                       onPressed: () {},
                //                       icon: Icon(
                //                         Icons.favorite_border,
                //                         color: Colors.grey,
                //                       ),
                //                     ),
                //                   ),
                //                   Spacer(),
                //                   Container(
                //                     width: 40,
                //                     height: 40,
                //                     decoration: BoxDecoration(
                //                         color: primaryColor,
                //                         borderRadius:
                //                             BorderRadius.circular(10)),
                //                     child: IconButton(
                //                       onPressed: () {},
                //                       icon: Icon(
                //                         Icons.add,
                //                         color: Colors.white,
                //                       ),
                //                     ),
                //                   ),
                //                 ],
                //               ),
                //               Padding(
                //                 padding: const EdgeInsets.all(10.0),
                //                 child: Image.asset(
                //                   "assets/image/On-bording.png",
                //                   width:  100,
                //                   height: 80,
                //                   fit: BoxFit.fill,
                //                 ),
                //               ),
                //               Text(
                //                 'تلفاست',
                //                 style: TextStyle(
                //                   fontSize: 18,
                //                   fontWeight: FontWeight.bold,
                //                 ),
                //               ),
                //               Row(
                //                 mainAxisAlignment: MainAxisAlignment.center,
                //                 children: [
                //                   Text(
                //                     '9 ش',
                //                     style: TextStyle(
                //                       color: primaryColor,
                //                       fontSize: 16,
                //                       fontWeight: FontWeight.bold,
                //                     ),
                //                   ),
                //                   Text(
                //                     ' / 20 قرص',
                //                     style: TextStyle(
                //                       color: Colors.black54,
                //                       fontSize: 16,
                //                     ),
                //                   ),
                //                 ],
                //               ),
                //             ],
                //           ),
                //         ),
                //       ),
                //     ),
                //     MaterialButton(
                //       onPressed: () {
                //         Navigator.of(context).push(MaterialPageRoute(
                //             builder: (context) => const ProductDetails()));
                //       },
                //       child: Card(
                //         shape: RoundedRectangleBorder(
                //           borderRadius: BorderRadius.circular(10),
                //         ),
                //         elevation: 4,
                //         child: Container(
                //           width:  150,
                //           height:  200,
                //           child: Column(
                //             mainAxisSize: MainAxisSize.min,
                //             children: [
                //               Row(
                //                 children: [
                //                   Align(
                //                     alignment: Alignment.topRight,
                //                     child: IconButton(
                //                       onPressed: () {},
                //                       icon: Icon(
                //                         Icons.favorite_border,
                //                         color: Colors.grey,
                //                       ),
                //                     ),
                //                   ),
                //                   Spacer(),
                //                   Container(
                //                     width: 40,
                //                     height: 40,
                //                     decoration: BoxDecoration(
                //                         color: primaryColor,
                //                         borderRadius:
                //                             BorderRadius.circular(10)),
                //                     child: IconButton(
                //                       onPressed: () {},
                //                       icon: Icon(
                //                         Icons.add,
                //                         color: Colors.white,
                //                       ),
                //                     ),
                //                   ),
                //                 ],
                //               ),
                //               Padding(
                //                 padding: const EdgeInsets.all(10.0),
                //                 child: Image.asset(
                //                   "assets/image/On-bording.png",
                //                   width:  100,
                //                   height: 80,
                //                   fit: BoxFit.fill,
                //                 ),
                //               ),
                //               Text(
                //                 'تلفاست',
                //                 style: TextStyle(
                //                   fontSize: 18,
                //                   fontWeight: FontWeight.bold,
                //                 ),
                //               ),
                //               Row(
                //                 mainAxisAlignment: MainAxisAlignment.center,
                //                 children: [
                //                   Text(
                //                     '9 ش',
                //                     style: TextStyle(
                //                       color: primaryColor,
                //                       fontSize: 16,
                //                       fontWeight: FontWeight.bold,
                //                     ),
                //                   ),
                //                   Text(
                //                     ' / 20 قرص',
                //                     style: TextStyle(
                //                       color: Colors.black54,
                //                       fontSize: 16,
                //                     ),
                //                   ),
                //                 ],
                //               ),
                //             ],
                //           ),
                //         ),
                //       ),
                //     ),

                //   ],
                // ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.category,
  });

  final dynamic category;

  @override
  Widget build(BuildContext context) {
    print('test item ${category.categoryId}');
    return MaterialButton(
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => Product(
                  categoryId: category.categoryId,
                )));
      },
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: Colors.white70,
            radius: 50,
            child: Image.network(
              category.image,
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            category.name,
            style: TextStyle(
              color: Colors.black,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}

class GridProductItem extends StatelessWidget {
  final ProductModel product;

  const GridProductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProductController>();

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 4,
      child: Container(
        width: 150,
        height: 200,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    icon: Icon(
                      product.isLoved ? Icons.favorite : Icons.favorite_border,
                      color: product.isLoved ? Colors.red : Colors.grey,
                    ),
                    onPressed: () =>
                        controller.toggleLove(product.id!, !product.isLoved),
                  ),
                ),
                Spacer(),
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: IconButton(
                    onPressed: () {
                      controller.addToCart(product.id!);
                    },
                    icon: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image.network(
                product.image ?? '',
                width: 100,
                height: 80,
                fit: BoxFit.fill,
              ),
            ),
            Text(
              product.name,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '\$${product.price.toStringAsFixed(2)}',
                  style: TextStyle(
                    color: primaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  ' / 20 قرص',
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
