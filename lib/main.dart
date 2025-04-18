import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:gaza_pharmacy/Component/color.dart';
import 'package:gaza_pharmacy/UI/Home%20Page/home.dart';
import 'package:gaza_pharmacy/UI/Order/Canceld%20Order.dart';
import 'package:gaza_pharmacy/UI/Order/complete_order.dart';
import 'package:gaza_pharmacy/UI/Profile/profile.dart';
import 'package:gaza_pharmacy/UI/splash_Screen.dart';
import 'package:get/get.dart';
import 'controller/cart.dart';
import 'controller/categore_controller.dart';
import 'controller/product.dart';
import 'firebase_options.dart';
import 'stripe_payment/strpe_keys.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Stripe.publishableKey = StripeKeys.publishableKey;
  Get.put(ProductController());
  Get.put(CartController());
  Get.put(CategoreController());
  // Get.put(ProfileController());
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
      home: SplashScreen(),
    );
  }
}
