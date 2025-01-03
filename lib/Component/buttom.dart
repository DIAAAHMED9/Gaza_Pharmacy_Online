import 'package:flutter/material.dart';

import 'color.dart';

class BottomComponent extends StatelessWidget {
  final String title;
  final Widget name;

  const BottomComponent({Key? key, required this.name, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height:50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3),
        color: primaryColor,
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: MaterialButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => name));
        },
        child: Text(
          title,
          style: TextStyle(color: Colors.white, fontSize: 17),
        ),
      ),
    );
  }
}
