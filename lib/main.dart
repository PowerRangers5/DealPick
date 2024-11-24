import 'package:flutter/material.dart';
import 'car_registration/car_registration.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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