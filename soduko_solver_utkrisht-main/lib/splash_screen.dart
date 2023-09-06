import 'dart:async';

import 'package:flutter/material.dart';
import 'package:soduko_solver_utkrisht/home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 2), () {
      
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(),
          )
      );

    });

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Container(
        color: const Color(0xff121212),
        child: Center(
            child: Image.asset(
                'assets/images/splash.png',
                height: 150,
            )
        ),

      ),

    );
  }
}
