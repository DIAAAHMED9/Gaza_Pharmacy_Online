import 'package:flutter/material.dart';
import 'package:gaza_pharmacy/model/product.dart';
import 'package:get/get.dart';
import '../../controller/product.dart';

class LovedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProductController>();
    
    return Scaffold(
      appBar: AppBar(title: Text('Loved Products')),
      body: StreamBuilder<List<ProductModel>>(
        stream: controller.getLovedProducts(),
        builder: (context, snapshot) {
          if (snapshot.hasError) return Text('Error: ${snapshot.error}');
          if (!snapshot.hasData) return CircularProgressIndicator();
          
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) => LovedProductItem(product: snapshot.data![index]),
          );
        },
      ),
    );
  }
}
class LovedProductItem extends StatelessWidget {
  final ProductModel product;

  const LovedProductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProductController>();

    return ListTile(
      leading: Image.network(product.image??'', width: 50, height: 50),
      title: Text(product.name),
      subtitle: Text('\$${product.price.toStringAsFixed(2)}'),
      trailing: IconButton(
        icon: const Icon(Icons.favorite, color: Colors.red),
        onPressed: () => controller.toggleLove(product.id!, false),
      ),
    );
  }
}