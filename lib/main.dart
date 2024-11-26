import 'package:flutter/material.dart';
import 'package:flutter_dealpick/car_registration/car_registration.dart';
import 'package:flutter_dealpick/car_registration/imsi.dart';
import 'package:flutter_dealpick/home_screen/home_screen.dart';
import 'package:flutter_dealpick/shopping_cart_page/shopping_cart.dart';
import 'package:flutter_dealpick/splash/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/HomeScreen': (context) => HomeScreen(),
        '/ShoppingCart': (context) => ShoppingCartPage(cartItems: [],),
        '/CreateForm': (context) => Imsi(),
        '/CarRegistration': (context) => CarRegistration(),
      },
      home: Splash(),
    );
  }
}
