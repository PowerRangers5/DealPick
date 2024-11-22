import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'car_registration/car_registration.dart';
=======
import 'package:flutter_dealpick/home_screen/home_screen.dart';
import 'package:flutter_dealpick/splash/splash.dart';
>>>>>>> 2240143 (feat: Splash/HomeScreen & 폴더구조 생성)

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
<<<<<<< HEAD
      title: '차량 등록',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('차량 등록'),
        backgroundColor: const Color(0xFF34BD8C),
        foregroundColor: Colors.white,
      ),
      body: const ProductRegistrationForm(),
    );
  }
}
=======
      debugShowCheckedModeBanner: false,
      routes: {
        '/HomeScreen': (context) => HomeScreen(),
      },
      home: Splash(),
    );
  }
}
>>>>>>> 2240143 (feat: Splash/HomeScreen & 폴더구조 생성)
