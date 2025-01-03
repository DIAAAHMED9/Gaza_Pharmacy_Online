import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:gaza_pharmacy/Component/color.dart';
import 'package:gaza_pharmacy/UI/Home%20Page/home.dart';
import 'package:gaza_pharmacy/UI/Login&Register/start_screen.dart';
import 'package:gaza_pharmacy/UI/splash_Screen.dart';

import 'UI/Home Page/bottombat.dart';




void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: Locale('ar', 'AE'),
      supportedLocales: [
        Locale('en', 'US'),
        Locale('ar', 'AE'), // Arabic
      ],
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      color: primaryColor,
      theme: ThemeData(
          primaryColor: primaryColor,
          canvasColor: Colors.white,
          colorScheme: ColorScheme(
              brightness: Brightness.light,
              primary: primaryColor,
              onPrimary: Colors.black,
              secondary: Colors.white,
              onSecondary: Colors.black12,
              error: Colors.redAccent,
              onError: Colors.red,
              surface: Colors.white,
              onSurface: Colors.grey)),
      home: Bottombar(),
    );
  }
}
