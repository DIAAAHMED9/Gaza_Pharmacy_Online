import 'package:flutter/material.dart';
import 'package:gaza_pharmacy/Component/color.dart';

class Serchapp extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return null;
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          "assets/image/null search.png",
          height: 500,
        ),
        Text(
          "عذرا لا يتوفر المنتج الذي تبحث عنه حاليا",
          style: TextStyle(fontSize: 20, color: primaryColor),
        ),
      ],
    ));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Center(
        child: Text(
      "ابحث عن المنتجات التي تريدها",
      style: TextStyle(
          fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
    ));
  }
}
