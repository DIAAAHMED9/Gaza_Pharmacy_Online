import 'package:flutter/material.dart';
import 'package:gaza_pharmacy/UI/Home%20Page/cart.dart';
import '../../Component/color.dart';
import '../Order/complete_order.dart';
import '../Profile/profile.dart';
import 'home.dart';

class Bottombar extends StatefulWidget {
  const Bottombar({Key? key}) : super(key: key);

  @override
  State<Bottombar> createState() => _BottombarState();
}
class _BottombarState extends State<Bottombar> {

  int _selectedIndex = 0;

  List<Widget> _widgetOptions =[
    Home_Page(),
    Cart(),
    CompleteOrder(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions[_selectedIndex] ,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey[300],
        elevation: 5,
        selectedItemColor: primaryColor,
        unselectedItemColor: Colors.grey,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'الرئيسية',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label: 'العربة',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.remove_from_queue),
            label: 'طلباتي',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline_rounded),
            label: 'البروفايل',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex= index;
          });
        },
      ),
    );
  }
}
