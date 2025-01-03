import 'package:flutter/material.dart';
import 'package:gaza_pharmacy/UI/Product/product.dart';

class Section extends StatelessWidget {
  const Section({super.key});

  @override
  Widget build(BuildContext context) {
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
      body: Wrap(
          alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 10,
          children: [
            MaterialButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const Product()));
              },
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white70,
                    radius: 50,
                    child: Image.asset(
                      "assets/image/comtrex-tabs-11709223596-removebg-preview (1).png",
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(
                    height:  10,
                  ),
                  Text(
                    "فيتامينات",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
            MaterialButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const Product()));
              },
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white70,
                    radius: 50,
                    child: Image.asset(
                      "assets/image/comtrex-tabs-11709223596-removebg-preview (1).png",
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(
                    height:  10,
                  ),
                  Text(
                    "فيتامينات",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
            MaterialButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const Product()));
              },
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white70,
                    radius: 50,
                    child: Image.asset(
                      "assets/image/comtrex-tabs-11709223596-removebg-preview (1).png",
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(
                    height:  10,
                  ),
                  Text(
                    "فيتامينات",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
            MaterialButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const Product()));
              },
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white70,
                    radius: 50,
                    child: Image.asset(
                      "assets/image/comtrex-tabs-11709223596-removebg-preview (1).png",
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(
                    height:  10,
                  ),
                  Text(
                    "فيتامينات",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
            MaterialButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const Product()));
              },
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white70,
                    radius: 50,
                    child: Image.asset(
                      "assets/image/comtrex-tabs-11709223596-removebg-preview (1).png",
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "فيتامينات",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
            MaterialButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const Product()));
              },
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white70,
                    radius: 50,
                    child: Image.asset(
                      "assets/image/comtrex-tabs-11709223596-removebg-preview (1).png",
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(
                    height:  10,
                  ),
                  Text(
                    "فيتامينات",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),

          ]),
    );
  }
}
