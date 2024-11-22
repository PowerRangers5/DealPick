import 'dart:async';

import 'package:flutter/material.dart';
<<<<<<< HEAD
=======
import 'package:google_fonts/google_fonts.dart';
>>>>>>> 2240143 (feat: Splash/HomeScreen & 폴더구조 생성)

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 2),
      () {
        Navigator.pushNamed(context, '/HomeScreen');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xff4CB0C0), Color(0xff84DCA3)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'DealPick',
<<<<<<< HEAD
              style: (
=======
              style: GoogleFonts.lobster(
>>>>>>> 2240143 (feat: Splash/HomeScreen & 폴더구조 생성)
                fontSize: 54,
                fontWeight: FontWeight.normal,
                color: Colors.white,
              ),
            ),
            Text(
              '가치있는 거래의 시작',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
