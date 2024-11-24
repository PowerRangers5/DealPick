import 'package:flutter/material.dart';
<<<<<<< HEAD
<<<<<<< HEAD
import 'car_registration/car_registration.dart';
=======
import 'package:flutter_dealpick/home_screen/home_screen.dart';
import 'package:flutter_dealpick/splash/splash.dart';
>>>>>>> 2240143 (feat: Splash/HomeScreen & 폴더구조 생성)
=======
import 'package:flutter_dealpick/home_screen/home_screen.dart';
import 'package:flutter_dealpick/splash/splash.dart';
=======
import 'car_registration/car_registration.dart';
>>>>>>> b0e9d45 (카테고리 선택 기능 추가)
>>>>>>> 4287929 (카테고리 선택 기능 추가)

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
<<<<<<< HEAD
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
=======
>>>>>>> 4287929 (카테고리 선택 기능 추가)
      debugShowCheckedModeBanner: false,
      routes: {
        '/HomeScreen': (context) => HomeScreen(),
      },
      home: Splash(),
    );
  }
}
<<<<<<< HEAD
>>>>>>> 2240143 (feat: Splash/HomeScreen & 폴더구조 생성)
=======
=======
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
>>>>>>> b0e9d45 (카테고리 선택 기능 추가)
>>>>>>> 4287929 (카테고리 선택 기능 추가)
