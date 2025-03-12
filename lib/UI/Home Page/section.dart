import 'package:flutter/material.dart';
import 'package:gaza_pharmacy/UI/Home%20Page/home.dart';
import 'package:get/get.dart';
import '../../controller/categore_controller.dart';
import '../../model/category.dart';

class Section extends StatelessWidget {
  const Section({super.key});

  @override
  Widget build(BuildContext context) {
    final categoryController = Get.find<CategoreController>();

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "الاقسام",
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: StreamBuilder<List<CategoryModel>>(
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
              itemBuilder: (BuildContext context, int index) => CategoryItem(
                category: snapshot.data![index],
              ),
            );
          }),
    );
  }
}
