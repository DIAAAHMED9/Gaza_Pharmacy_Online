import 'package:flutter/material.dart';
import 'package:gaza_pharmacy/UI/Product/product_details.dart';
import 'package:get/get.dart';
import '../../controller/product.dart';
import '../../model/product.dart';
import '../Home Page/home.dart';

class Product extends StatelessWidget {

   Product({super.key,  this.categoryId});
final String? categoryId;
  @override
  Widget build(BuildContext context) {
          final controller = Get.find<ProductController>();

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
            "فيتامنات",
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child:      StreamBuilder<List<ProductModel>>(
        stream: controller.getProducts(),
        builder: (context, snapshot) {
        
          if (snapshot.hasError) return Text('Error: ${snapshot.error}');
          if (!snapshot.hasData) return CircularProgressIndicator();
                  // تصفية المنتجات بناءً على categoryId
            List<ProductModel> filteredProducts = categoryId == null
                ? snapshot.data!
                : snapshot.data!.where((product) => product.categoryId == categoryId).toList();

                    return GridView.builder(
                      
                      shrinkWrap: true,
                      itemCount: filteredProducts.length,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 3/4),
                      itemBuilder: (context, index)  {
                                        final product = filteredProducts[index];

                        print('product id cate ${categoryId}');
                        print('product id snapshot ${snapshot.data![index].categoryId}');
                        return MaterialButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const ProductDetails()));
                          },
                          child:
                          GridProductItem(product:product ,)
                         
                        );},
                    
                    );
                  }
                ),
        
        
 
      ),
    );
  }
}
