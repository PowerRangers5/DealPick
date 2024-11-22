import 'package:flutter/material.dart';
import 'package:flutter_dealpick/home_screen/home_screen.dart';
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
      routes: {
        '/HomeScreen': (context) => HomeScreen(),
      },
      home: Splash(),
    );
  }
}
