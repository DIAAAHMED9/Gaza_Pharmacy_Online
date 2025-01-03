import 'dart:async';
import 'package:flutter/material.dart';
import 'package:gaza_pharmacy/Component/color.dart';
import 'package:gaza_pharmacy/UI/Onboarding%20Details/onboarding.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 4),
            () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => const OnboardingPage())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Center(
        child: Image.asset('assets/icon/Red_Circle_Health_Logo__4_-removebg-preview 1.png'),
      ),
    );
  }
}
