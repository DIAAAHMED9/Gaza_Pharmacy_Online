import 'package:flutter/material.dart';
import 'package:gaza_pharmacy/UI/Login&Register/login.dart';
import 'package:gaza_pharmacy/UI/Profile/change_password.dart';
import '../../Component/color.dart';
import 'ediit_profile.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("الملف الشخصي")),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: 100,
                height: 100,
                child: CircleAvatar(
                  child: Image.asset(
                    "assets/image/On-bording.png",
                  ),
                ),
              ),
              Text(
                "عدي ابو معمر",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "data",
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.mode_edit_outline_outlined)),
                ],
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => EditProfile()));
                },
                child: Container(
                  width: double.infinity,
                  height: 50,
                  child: Row(
                    children: [
                      Icon(
                        Icons.person_outline_rounded,
                        color: primaryColor,
                      ),
                      Text(
                        "تعديل الحساب",
                      ),
                      Spacer(),
                      Icon(
                        Icons.person_outline_rounded,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ChangePassword()));
                },
                child: Container(
                  width: double.infinity,
                  height: 50,
                  child: Row(
                    children: [
                      Icon(
                        Icons.key,
                        color: primaryColor,
                      ),
                      Text(
                        "تعيير كلمة المرور",
                      ),
                      Spacer(),
                      Icon(
                        Icons.person_outline_rounded,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Login_Screen()));
                },
                child: Container(
                  width: double.infinity,
                  height: 50,
                  child: Row(
                    children: [
                      Icon(
                        Icons.delete_outline_sharp,
                        color: primaryColor,
                      ),
                      Text(
                        "تسجيل الخروج",
                      ),
                    ],
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
